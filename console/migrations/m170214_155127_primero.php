<?php

use yii\db\Migration;

class m170214_155127_primero extends Migration
{
    public function safeUp()
    {
        $this->execute(file_get_contents(Yii::getlAlias('console/migrations/m170214_155127_primero.sql')));

    }

    public function down()
    {
        echo "m170214_155127_primero cannot be reverted.\n";

        return false;
    }

    /*
   ./yii migrate/create "Nombre del migrate" Asi creamos un migrate.
    */
}
