<?php
include '../core/db.php';

class wechat extends db
{
    public function circle(){
        $results = $this->pdo
            ->query('select * from wechat')
            ->fetchAll();
        echo json_encode($results);
    }

    public function insert(){
        $stmt=$this->pdo->prepare("insert into wechat (user_id,user_avada,publish_time ,publish_address,img_urls ,content) value (?,?,?,?,?,?)");
        $stmt->bindValue(1, $_GET['user_name']);
        $stmt->bindValue(2, $_GET['user_avatar']);
        $stmt->bindValue(3, "2018-9-12");
        $stmt->bindValue(4, "学府街 凯通大厦");
        $stmt->bindValue(5, "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536642967964&di=99426a88e2f1bc54817027924f9b4156&imgtype=0&src=http%3A%2F%2Fimg1.jiemian.com%2Fjiemian%2Foriginal%2F20170619%2F149785681164347500_a580xH.jpg;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643092337&di=702641244e6377481a937997e2cb0d35&imgtype=0&src=http%3A%2F%2Fresource.feng.com%2Fresource%2Fh061%2Fh72%2Fimg201704302125012.png;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643105301&di=6862c06d734bca3ee4315354ba8e19b5&imgtype=0&src=http%3A%2F%2Fimg.cyol.com%2Fimg%2Fnews%2Fattachement%2Fjpeg%2Fsite2%2F20170816%2FIMG94659c88928f4528493872.jpeg;https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3552926315,2294971532&fm=26&gp=0.jpg");
       $stmt->bindValue(6, $_GET['content']);
        $results=$stmt->execute();
        echo json_encode($results);
    }




}

