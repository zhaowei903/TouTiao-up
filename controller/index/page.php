<?php
include '../core/db.php';

class page extends db
{
  const PER_PAGE = 4;
//  首页
  public function index()
  {
//接收分类id
    if (isset($_GET['cid'])) {
      $cid = $_GET['cid'];
    } else {
      $cid = 1;
    }
//接收页数
    if (isset($_GET['page'])) {
      $page = $_GET['page'];
    } else {
      $page = 1;
    }
//分类
    $category = $this->pdo
      ->query('select * from news_category where is_default = "1" ')
      ->fetchAll();

//某个分类下的总条数
    $num = $this->pdo
      ->query('select count(*) as total from news where cid =' . $cid)
      ->fetch()['total'];

//总页数
    $page_total = ceil($num / $this::PER_PAGE);

//新闻
    $news = $this->pdo
      ->query(
        'select * from news where cid= ' . $cid . ' limit '.$this::PER_PAGE.' offset ' . ($page - 1) * $this::PER_PAGE
      )
      ->fetchAll();

    include '../views/index/index.html';
  }
//  分类页面
  public function category()
  {
    // 查两次
    // 查默认的
    // 查其他的
    $category = $this->pdo
      ->query('select * from news_category')
      ->fetchAll();
    include '../views/index/category.html';
  }
    public function move()
    {
        $is_default=$_GET['is_default'];
        $id=$_GET['id'];
        $stmt = $this->pdo->prepare("update news_category set is_default=? where id=?");
        $stmt->bindValue(1, $is_default);
        $stmt->bindValue(2, $id);

        $rows=$stmt->execute();
        echo $rows;
    }
//  搜索页面
  public function search()
  {
      $num=0;
      $results=[];
    if(isset($_GET['s'])){
      $keyword = $_GET['s'];
        //某个分类下的总条数
        $num = $this->pdo
            ->query('select count(*) as total from news where title like "%'.$keyword.'%"')
            ->fetch()['total'];
        $results = $this->pdo
            ->query('select * from news where title like "%'.$keyword.'%" limit '.$this::PER_PAGE.' offset 0')
            ->fetchAll();
    }
    include '../views/index/search.html';
  }

  // ajax
  public function searchList(){

    if(isset($_GET['s'])){
      $keyword = $_GET['s'];
    }else{
      $keyword = '';
    }
    if(isset($_GET['page'])){
      $page = $_GET['page'];
    }else{
      $page = 1;
    }
    $results = $this->pdo
      ->query('select * from news where title like "%'.$keyword.'%" limit '.$this::PER_PAGE.' offset '.($page-1)*$this::PER_PAGE)
      ->fetchAll();
    echo json_encode($results);
  }
}



// 前台3个页面
//      ajax方式
// 中台 新闻管理   删除  分页
//      分类管理   删除  设置默认值  编辑
