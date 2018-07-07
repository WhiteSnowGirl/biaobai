<?php

namespace app\models\user;

use Yii;
use app\models\user\Token;

/**
 * This is the model class for table "{{%token}}".
 *
 * @property string $id
 * @property string $userid
 * @property string $token
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $iscx
 */
class Token extends \yii\db\ActiveRecord
{
    const XCX_STATUS = 0;
    const APP_STATUS = 1;

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
        return '{{%token}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['userid'], 'required'],
            [['userid', 'created_at', 'updated_at', 'iscx'], 'integer'],
            [['token'], 'string', 'max' => 255],
            [['token'], 'unique'],
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
            'token' => 'Token',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'iscx' => 'Iscx',
        ];
    }

    public function generate($userid,$token = "",$type = self::XCX_STATUS)
    {
        $token = false;
        if( $to = self::findOne(['userid'=>$userid]) ){
            // 返回token
            $to->updated_at = time();
            $to->save();
            $token = $to->token;
            // return $to->token;
        }
        if( empty($token) ){
            // 创建token
            $this->userid = $userid;
            $this->iscx = $type;
            $this->token = Yii::$app->getSecurity()->generateRandomString();
            $this->save();
            $token = $this->token;
        }
        User::updateAll([
            "loginip"=> ip2long(Yii::$app->getRequest()->userIP),
            "logintime"=>time()
        ],"userid = :uid",[":uid"=>$userid ]);
        return $token;
    }
}
