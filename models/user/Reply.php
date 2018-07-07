<?php

namespace app\models\user;

use Yii;

/**
 * This is the model class for table "{{%reply}}".
 *
 * @property integer $id
 * @property integer $questionid
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $userid
 * @property string $button
 * @property string $myreply
 */
class Reply extends \yii\db\ActiveRecord
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
        return '{{%reply}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['questionid', 'created_at', 'updated_at', 'userid','index'], 'integer'],
            [['button'], 'string', 'max' => 50],
            [['myreply'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'questionid' => 'Questionid',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'userid' => 'Userid',
            'index' => 'index',
            'button' => 'Button',
            'myreply' => 'Myreply',
        ];
    }
}