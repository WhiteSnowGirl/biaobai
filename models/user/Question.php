<?php

namespace app\models\user;

use Yii;

/**
 * This is the model class for table "{{%question}}".
 *
 * @property string $id
 * @property integer $userid
 * @property string $name
 * @property string $data
 * @property integer $created_at
 * @property integer $updated_at
 */
class Question extends \yii\db\ActiveRecord
{

    public function behaviors(){
        return [
            [
                "class" => \yii\behaviors\TimestampBehavior::className(),
                'attributes'=>[
                    \yii\db\ActiveRecord::EVENT_BEFORE_UPDATE => ["updated_at"],
                    \yii\db\ActiveRecord::EVENT_BEFORE_INSERT => ["created_at"],
                ]
            ]
        ];
    }
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%question}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['userid'], 'required'],
            [['userid', 'created_at', 'updated_at','times'], 'integer'],
            [['data'], 'string'],
            [['name','img'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'userid' => 'Userid',
            'name' => 'Name',
            'img' => 'img',
            'data' => 'Data',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'times' => 'times',
        ];
    }
}
