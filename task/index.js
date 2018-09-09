const request = require('request');
//解析所用的插件
const cheerio = require('cheerio');
const iconv = require('iconv-lite');
const fs = require('fs');
const async = require('async');
const filter = require('bloom-filter-x');

//1初始化布隆过滤器
//  -从数据库中读取已有的url
//   -添加到布隆过滤器中
//2 定时抓取新闻网站上的数据
//   -根据布隆过滤器判定有没有新的新闻


//中观村在线
// async.eachLimit(['url','ur2','ur3'],1,(v,next)=>{
//     setTimeout(()=>{
//         console.log(v);
//         next(null);
// },1000);

//setInterval()
//url 去重
//
const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db'
});
//初始化布隆
// let newurl=[];
// let urls=[];
// let select_sql='select url from news';
// connection.query(select_sql,(err,result,fields)=>{
//     if (err) throw err;
//     result.forEach((v)=>{
//         let url=v.url;
//         if(filter.add(url)){
//             urls.push(url)
//         }
//     })
// });
function feedFilter() {
    console.log('开始喂布隆过滤器');
    connection.query('select * from news', (err, results) => {
        results.forEach(v => filter.add(v.url));
        console.log('喂完了');
        fetch_news();
    })
}

function fetch_news() {
    let data = [];
    let data_2=[];
    request(
        {
            url: "http://news.zol.com.cn/",
            encoding: null
        },
        (err, res, body) => {
            body = iconv.decode(body, 'gb2312');
            let $ = cheerio.load(body);
            $('.content-list li').each((k, v) => {

                let t = $(v).find('.info-head a');
                let title = t.text();
                let dsc = $(v).find('p').contents().eq(0).text();
                let image = $(v).find('img').attr('.src');
                let url = t.attr("href");
                if (filter.add(url)) {
                    data.push({
                        url: url,
                        title: title,
                        dsc: dsc,
                        image: image,
                    })
                }
            });

            if (!data.length) {
                let d = new Date();
                console.log(d.toUTCString() + '抓取一次，本次没有更新..')
            } else {
                let d = new Date();
                console.log(d.toUTCString() + '抓取一次，本次更新..' + data.length + '次');

                async.eachLimit(data, 1, (v, next) => {
                    request({
                        url: v.url,
                        encoding: null,
                    }, (err, res, body) => {
                        if (err) {
                            console.log(err.message)
                        } else {
                            body = iconv.decode(body, 'gb2312');
                            let $ = cheerio.load(body);
                            let pubtime = $('#pubtime_baidu').attr('content');
                            let content = $('#article-content').html();
                            let title = v.title;
                            let dsc = v.dsc;
                            let image = v.image;
                            let url = v.url;
                            let insert_sql = 'insert into news (cid,title,dsc,image,url,pubtime,content) values (?,?,?,?,?,?,?)';
                            connection.query(insert_sql, [1, title, dsc, image, url, pubtime, content], (err, results, fields) => {
                                if (err) throw err;
                                console.log(results.insertId);
                            })
                        }
                    });
                    next(null);
                },
                    () => {
                        console.log('全部插入完成');
                        setTimeout(fetch_news, 60*1000)
                }
                )

            }
        }
    )
    request(
        {
            url: "http://news.zol.com.cn/trend/",
            encoding: null
        },
        (err, res, body) => {
            body = iconv.decode(body, 'gb2312');
            let $ = cheerio.load(body);
            $('.content-list li').each((k, v) => {

                let t = $(v).find('.info-head a');
                let title = t.text();
                let dsc = $(v).find('p').contents().eq(0).text();
                let image = $(v).find('img').attr('.src');
                let url = t.attr("href");
                if (filter.add(url)) {
                    data_2.push({
                        url: url,
                        title: title,
                        dsc: dsc,
                        image: image,
                    })
                }
            });

            if (!data_2.length) {
                let d = new Date();
                console.log(d.toUTCString() + '抓取一次，本次没有更新..')
            } else {
                let d = new Date();
                console.log(d.toUTCString() + '抓取一次，本次更新..' + data_2.length + '次');

                async.eachLimit(data_2, 1, (v, next) => {
                        request({
                            url: v.url,
                            encoding: null,
                        }, (err, res, body) => {
                            if (err) {
                                console.log(err.message)
                            } else {
                                body = iconv.decode(body, 'gb2312');
                                let $ = cheerio.load(body);
                                let pubtime = $('#pubtime_baidu').attr('content');
                                let content = $('#article-content').html();
                                let title = v.title;
                                let dsc = v.dsc;
                                let image = v.image;
                                let url = v.url;
                                let insert_sql = 'insert into news (cid,title,dsc,image,url,pubtime,content) values (?,?,?,?,?,?,?)';
                                connection.query(insert_sql, [2, title, dsc, image, url, pubtime, content], (err, results, fields) => {
                                    if (err) throw err;
                                    console.log(results.insertId);
                                })
                            }
                        });
                        next(null);
                    },
                    () => {
                        console.log('全部插入完成');
                        setTimeout(fetch_news, 60*1000)
                    }
                )

            }
        }
    )


}

//     request({
//         url: "http://news.zol.com.cn/",
//         encoding: null//默认编码方式无
//     }, (err, res, body) => {
//         body = iconv.decode(body, 'gb2312');//编码方式gb2312
//         let $ = cheerio.load(body);
// //查找数据
//         $('.content-list li').each((k,v)=>{
//             let t = $(v).find('.info-head a');
//             let title = t.text();
//             let dsc = $(v).find('p').contents().eq(0).text();
//             let image = $(v).find('img').attr('.src');
//             let url=t.attr("href");
//             if(filter.add(url)){
//                 urls.push(url);
//                 newurl.push({
//                     'title':title,
//                     'dsc':dsc,
//                     'image':image,
//                     'url':url
//                 })
//             }
//         });
//         if(!urls.length){
//             let d=new Date();
//             console.log(d.toUTCString()+'抓取一次，本次没有更新..')
//         }else{
//             let d=new Date();
//             console.log(d.toUTCString()+'抓取一次，本次更新..'+urls.length+'次');
//             async.eachLimit(newurl,1,(v,next)=>{
//                 request({
//                     url:v.url,
//                     encoding:null,
//                 },(err, res, body)=>{
//                     if(err){
//                         console.log(err.message)
//                     }else{
//                         body = iconv.decode(body, 'gb2312');
//                         let $ = cheerio.load(body);
//                         let pubtime = $('#pubtime_baidu').attr('content');
//                         let content = $('#article-content').html();
//                         let title=v.title;
//                         let dsc=v.dsc;
//                         let image=v.image;
//                         let url=v.url;
//                         let insert_sql='insert into news (cid,title,dsc,image,url,pubtime,content) values (?,?,?,?,?,?,?)';
//                         connection.query(insert_sql,[1,title,dsc,image,url,pubtime,content],(err,results,fields)=>{
//                             if (err) throw err;
//                             console.log(results.insertId);
//                         })
//                     }
//                 });
//                 next(null);
//             },() =>setTimeout(fetch_news,60*1000)
//         )
//         }
//     });
//
//     request({
//         url: "http://news.zol.com.cn/trend/",
//         encoding: null//默认编码方式无
//     }, (err, res, body) => {
//         body = iconv.decode(body, 'gb2312');//编码方式gb2312
//         let $ = cheerio.load(body);
// //查找数据
//         $('.content-list li').each((k,v)=>{
//             let t = $(v).find('.info-head a');
//             let title = t.text();
//             let dsc = $(v).find('p').contents().eq(0).text();
//             let image = $(v).find('img').attr('.src');
//             let url=t.attr("href");
//             if(filter.add(url)){
//                 urls.push(url);
//                 newurl.push({
//                     'title':title,
//                     'dsc':dsc,
//                     'image':image,
//                     'url':url
//                 })
//             }
//         });
//         if(!urls.length){
//             let d=new Date();
//             console.log(d.toUTCString()+'抓取一次，本次没有更新..')
//         }else{
//             let d=new Date();
//             console.log(d.toUTCString()+'抓取一次，本次更新..'+urls.length+'次');
//             async.eachLimit(newurl,1,(v,next)=>{
//                 request({
//                     url:v.url,
//                     encoding:null,
//                 },(err, res, body)=>{
//                     if(err){
//                         console.log(err.message)
//                     }else{
//                         body = iconv.decode(body, 'gb2312');
//                         let $ = cheerio.load(body);
//                         let pubtime = $('#pubtime_baidu').attr('content');
//                         let content = $('#article-content').html();
//                         let title=v.title;
//                         let dsc=v.dsc;
//                         let image=v.image;
//                         let url=v.url;
//                         let insert_sql='insert into news (cid,title,dsc,image,url,pubtime,content) values (?,?,?,?,?,?,?)';
//                         connection.query(insert_sql,[2,title,dsc,image,url,pubtime,content],(err,results,fields)=>{
//                             if (err) throw err;
//                             console.log(results.insertId);
//                         })
//                     }
//                 });
//                 next(null);
//             })
//         }
//     })
// }

feedFilter();

