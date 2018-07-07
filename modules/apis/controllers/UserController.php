<?php

namespace app\modules\apis\controllers;

use app\modules\apis\controllers\BaseController;
use app\models\user\User;
use app\models\user\Token;
use app\models\user\Question;
use app\models\user\Reply;
use \Yii;

/**
 * Default controller for the `apis` module
 */
class UserController extends BaseController
{
    protected $except = ["login","getopendbycode","autoregister"];
    protected $verbs = [
      "autoregister"=>["POST","OPTIONS"],
      "add"=>["POST","OPTIONS"],
      "clicklog"=>["POST","OPTIONS"],
    ];

    public function actionAutoregister(){
        $post = [
            'encryptedData' => Yii::$app->getRequest()->post("encryptedData"),
            'iv' => Yii::$app->getRequest()->post("iv"),
            'rawData' => Yii::$app->getRequest()->post("rawData"),
            'signature' => Yii::$app->getRequest()->post("signature"),
            'userInfo' => Yii::$app->getRequest()->post("userInfo"),
            'sessionKey' => Yii::$app->getRequest()->post("sessionKey"),
            'mishucode' => Yii::$app->getRequest()->post("mishucode"),
        ];

        $errCode = User::decryptData(User::XCX_APPKEY,$post['sessionKey'],$post['encryptedData'], $post['iv'], $data );

        $userOne = User::findOne(['appidopenid' =>$data['openId'] ]);
        // 通过微信登陆
        if ( $userOne && Yii::$app->getUser()->isGuest ) {
            return ['status'=>1,"msg"=>"fail"];
        }
        if( empty($userOne) && $errCode == 0 ){
            $tablestatus = Yii::$app->getDb()->createCommand("show table status where Name ='user'")->queryAll();
            $autoUser = $tablestatus[0]['Auto_increment'];
            $connection = Yii::$app->getDb();
            $command = $connection->createCommand("show table status where Name ='user'");
            $queryData = $command->queryAll();
            $autoUser = $queryData[0]['Auto_increment'];
            $str = User::randStr(2);

            $model = new User();
            $model->username = 'A0'.++$autoUser.$str;
            $model->userpass = Yii::$app->getSecurity()->generatePasswordHash('suiro');
            $model->appidopenid = $data['openId'];
            $model->avatar = $data['avatarUrl'];
            $model->nickname = $data['nickName'];

            if ($model->save()) {
                $tokenMoel = new Token();
                $token = $tokenMoel->generate($model->userid);
                return ['status'=>0,"token"=>$token,"avatar"=>$model->avatar,'nickName'=>$data['nickName'] ];
            }else{
                Yii::warning(\yii\helpers\Html::errorSummary($model));
                return ['status'=>1,"msg"=>"sth wrong"];
            }
        }
        return ['status'=>1,"msg"=>"sth wrong"];
    }

    /*
    * 微信login
    */
    public function actionLogin($code)
    {
        $xcxArr = $this->getopendbycode($code);
        $token = Yii::$app->getRequest()->get("token");
        // 创建token 如果用户拒绝授权不让注册
        $userInfo = User::findOne(['appidopenid'=>$xcxArr['openid']]);
        if( empty($userInfo)  ){
          return ['status'=>1,"msg"=>"needregister",'sessionKey'=>$xcxArr['session_key']];
        }
        // Token
        $model = new Token();
        $token = $model->generate($userInfo->userid,$token);
        if($token === false){
            return ['status'=>1,"msg"=>"not fond unionid"];
        }
        return ['status'=>0,"token"=>$token,"avatar"=>$userInfo['avatar'],'nickName'=>$userInfo['nickname'] ];
    }

    /*
    * @return $array;
    */
    private function getopendbycode($code){
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=".User::XCX_APPKEY."&secret=".User::XCX_APPSECRET."&js_code=".$code."&grant_type=authorization_code";
        $method = "get";
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        // curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        
        $data = (array)json_decode(curl_exec($curl),1);
        curl_close($curl);

        return $data;
    }

    public function actionAdd()
    {
        $post = Yii::$app->getRequest()->post();
        $model = new Question();
        $model->name = $post['name'];
        $model->img = $post['img'];
        $model->userid = Yii::$app->yonghu->id;
        unset( $post['name'],$post['img'] );
        $model->data = json_encode($post);
        if( !$model->save() ){
            return ['status'=>1,'msg'=>'保存失败'];
        }
        return ['status'=>0,'msg'=>'保存成功'];
    }

    public function actionGetallquestion()
    {
        $ques = Question::find()->where(['userid'=>Yii::$app->yonghu->id ])->orderBy('created_at DESC')->asArray()->all();
        foreach ($ques as $key => $value) {
            $ques[$key]['created_at'] = date('Y-m-d H:i:s',$value['created_at']);
        }
        return $ques;
    }

    public function actionGetone($id)
    {
        $res = Question::find()->where(['id'=>$id])->asArray()->one();
        $res['created_at'] = date("Y-m-d H:i:s",$res['created_at']);
        return $res;
    }

    public function actionClicklog()
    {
        $post = Yii::$app->getRequest()->post();
        if( $model = Reply::findOne(['questionid'=>$post['id'],'userid'=>Yii::$app->yonghu->id,'index'=>$post['index'],'button'=>$post['btntype'] ]) ){
            return [];
        }
        $model = new Reply();
        $model->questionid = $post['id'];
        $model->userid = Yii::$app->yonghu->id;
        $model->button = $post['btntype'];
        $model->index = $post['index'];
        $model->myreply = $post['title'];
        $model->save();
        return $post;
    }

    public function actionGetuserclicklog($id)
    {
        $model = Question::find()->select('name,id,userid')->where(['id'=>$id,'userid'=>Yii::$app->yonghu->id])->asArray()->one();
        $return['name'] = $model['name'];

        $return['replay'] = Reply::find()->where(['questionid'=>$model['id'] ])->orderBy('userid,created_at DESC')->asArray()->all();

        foreach ($return['replay'] as $key => $value) {
            $userinfo = User::find()->where(['userid'=>$value['userid'] ])->one();
            $return['replay'][$key]['avatar'] = $userinfo['avatar'];
            $return['replay'][$key]['nickname'] = $userinfo['nickname'];
            $return['replay'][$key]['created_at'] = date("Y-m-d H:i:s",$value['created_at']);

        }

        return $return;
    }
}
