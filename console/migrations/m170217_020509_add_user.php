<?php

use yii\db\Migration;

class m170217_020509_add_user extends Migration
{
    public function safeUp()
    {
        $this->execute(file_get_contents(Yii::getlAlias('console/migrations/m170217_020509_add_user.sql')));
    }
    public function down()
    {
        echo "m170214_155127_primero cannot be reverted.\n";
        return false;
    }
}
