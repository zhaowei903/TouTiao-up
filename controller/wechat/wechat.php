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
}
