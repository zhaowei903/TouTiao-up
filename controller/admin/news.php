<?php
include '../core/db.php';

class news extends db
{
    const PER_PAGE = 10;

    public function index()
  {
      //接收页数
      if (isset($_GET['page'])) {
          $page = $_GET['page'];
      } else {
          $page = 1;
      }
      //某个分类下的总条数
      $num = $this->pdo
          ->query('select count(*) as total from news')
          ->fetch()['total'];

      //总页数
      $page_total = ceil($num / $this::PER_PAGE);

      //新闻
      $news = $this->pdo
          ->query(
              'select * from news limit '.$this::PER_PAGE.' offset ' . ($page - 1) * $this::PER_PAGE
          )
          ->fetchAll();

      include '../views/admin/news.html';

  }

    public function add()
    {
        $stmt = $this->pdo->prepare("insert into news (cid,title,dsc,url,image,pubtime,content) values (?,?,?,?,?,?,?)");
        $stmt->bindValue(1, '1');
        $stmt->bindValue(2, '');
        $stmt->bindValue(3, '');
        $stmt->bindValue(4, '');
        $stmt->bindValue(5, '');
        $stmt->bindValue(6, '');
        $stmt->bindValue(7, '');
        echo $stmt->execute();
    }

    public function remove()
    {
        $course = $this->pdo->exec("delete from news where id=" . $_GET['id']);
        echo $course;
    }

    public function update()
    {
        $count = $this->pdo->prepare('update news set '.$_GET['k'].'= ? where id= ?');
        $count->bindValue(1, $_GET['v']);
        $count->bindValue(2, $_GET['id']);
        echo $count->execute();
    }
}