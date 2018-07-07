<?php

namespace app\models\user;

use Yii;
use app\models\user\Token;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property string $userid
 * @property string $username
 * @property string $userpass
 * @property string $useremail
 * @property string $created_at
 * @property integer $logintime
 * @property string $loginip
 * @property string $avatar
 * @property string $nickname
 * @property string $unionid
 * @property string $jifen
 * @property string $appidopenid
 */
class User extends ActiveRecord implements \yii\web\IdentityInterface
{
    const XCX_APPKEY = 'wx1f4a3f6de3532fa6';
    const XCX_APPSECRET = '6207246dc35a1bdb0384d4642031f971';

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
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['created_at', 'logintime', 'loginip', 'jifen'], 'integer'],
            [['username', 'unionid', 'appidopenid'], 'string', 'max' => 32],
            [['userpass'], 'string', 'max' => 64],
            [['useremail'], 'string', 'max' => 100],
            [['avatar'], 'string', 'max' => 225],
            [['nickname'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'userid' => 'Userid',
            'username' => 'Username',
            'userpass' => 'Userpass',
            'useremail' => 'Useremail',
            'created_at' => 'Created At',
            'logintime' => 'Logintime',
            'loginip' => 'Loginip',
            'avatar' => 'Avatar',
            'nickname' => 'Nickname',
            'unionid' => 'Unionid',
            'jifen' => 'Jifen',
            'appidopenid' => 'Appidopenid',
        ];
    }

    public function generateAccessToken(){
        $this->accessToken = Yii::$app->getSecurity()->generateRandomString();
    }

    /*
    * 随机字符串
    */
    public static function randStr($m= 5) {
        $new_str= '';
        $str= '0123456789';
        for($i= 1; $i<= $m; ++$i) {
            $new_str.=$str[mt_rand(0, 10)];
        }
        return $new_str;
    }
    
    /**
     * 生成Token
     * @param $adminuser
     * @param $time
     * @return string
     */
    public function createToken($adminuser,$time){
        return md5(md5($adminuser).base64_encode(Yii::$app->request->userIP).md5($time));
    }

    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        $token = Token::find()->where("token = :t",[':t' => $token])->one();
        if(empty($token)){
            return null;
        }
        return static::findOne(['userid'=>$token->userid]);
    }

    public function getId()
    {
        return $this->userid;
    }

    public function getAuthKey()
    {
        return '';
    }

    public function validateAuthKey($authKey)
    {
        return true;
    }

    /*
    * 小程序解析用户
    */
    /**
     * 检验数据的真实性，并且获取解密后的明文.
     * @param $encryptedData string 加密的用户数据
     * @param $iv string 与用户数据一同返回的初始向量
     * @param $data string 解密后的原文
     *
     * @return int 成功0，失败返回对应的错误码
     */
    public static function decryptData($appid,$sessionKey, $encryptedData, $iv, &$data )
    {
        if (strlen($sessionKey) != 24) {
            return -41001;
        }
        $aesKey=base64_decode($sessionKey);
        
        if (strlen($iv) != 24) {
            return -41002;
        }
        $aesIV=base64_decode($iv);

        $aesCipher=base64_decode($encryptedData);

        $result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

        $dataObj=(array)json_decode( $result,1 );
        if( $dataObj  == NULL )
        {
            return -41003;
        }
        if( $dataObj['watermark']['appid'] != $appid )
        {
            return -41003;
        }
        $data = $dataObj;
        return 0;
    }
}
