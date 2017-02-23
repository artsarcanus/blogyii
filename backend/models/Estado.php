<?php

namespace backend\models;
use common\models\User;
use Yii;

/**
 * This is the model class for table "estado".
 *
 * @property integer $id
 * @property string $estado_nombre
 * @property integer $estado_valor
 *
 * @property User[] $users
 */
class Estado extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'estado';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'estado_nombre', 'estado_valor'], 'required'],
            [['id', 'estado_valor'], 'integer'],
            [['estado_nombre'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'estado_nombre' => 'Estado Nombre',
            'estado_valor' => 'Estado Valor',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['estado_id' => 'id']);
    }
}
