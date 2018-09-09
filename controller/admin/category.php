<?php
include '../core/db.php';

class category extends db
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
            ->query('select count(*) as total from news_category')
            ->fetch()['total'];

        //总页数
        $page_total = ceil($num / $this::PER_PAGE);

        //新闻
        $category = $this->pdo
            ->query(
                'select * from news_category limit '.$this::PER_PAGE.' offset ' . ($page - 1) * $this::PER_PAGE
            )
            ->fetchAll();

        include '../views/admin/category.html';

    }

    public function add()
    {
        $stmt = $this->pdo->prepare("insert into news_category (name,is_default) values (?,?)");
        $stmt->bindValue(1, '');
        $stmt->bindValue(2, '');

        echo $stmt->execute();
    }

    public function remove()
    {
        $course = $this->pdo->exec("delete from news_category where id=" . $_GET['id']);
        echo $course;
    }

    public function update()
    {
        $count = $this->pdo->prepare('update news_category set '.$_GET['k'].'= ? where id= ?');
        $count->bindValue(1, $_GET['v']);
        $count->bindValue(2, $_GET['id']);
        echo $count->execute();
    }
}