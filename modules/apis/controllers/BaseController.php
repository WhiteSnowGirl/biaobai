<?php
namespace app\modules\apis\controllers;

use yii\rest\Controller;
use yii\web\Response;
use app\models\user\User;
use Yii;
use app\components\ApiAuth;
use yii\filters\auth\QueryParamAuth;

class BaseController extends Controller
{
    
    protected $actions = ['*'];
    protected $except = [];
    protected $mustlogin = [];
    protected $verbs = [];
    public $key;

    public $device ;

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => ApiAuth::className(),
            'optional' => $this->except,
            'tokenParam' => "token"
        ];

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
            'cors' => [
                'Origin' => ["*"],
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Allow-Credentials' => null,
                'Access-Control-Request-Headers' => ['*'],
                'Access-Control-Max-Age' => 86400,
                'Access-Control-Expose-Headers' => [],
            ],
        ];

        $behaviors['verbs']=[
            'class' => \yii\filters\VerbFilter::className(),
            'actions' => $this->verbs,
        ];
        return $behaviors;
    }

    // public function checkAccess($action, $model = null, $params = [])
    // {
    //     if ($action === 'index' || $action === 'delete') {
    //         if ($model->author_id !== \Yii::$app->user->id)
    //             throw new \yii\web\ForbiddenHttpException(sprintf('You can only %s articles that you\'ve created.', $action));
    //     }
    // }

    public function init()
    {
        parent::init();
        Yii::$app->yonghu->enableSession = false;
    }
    
    public function errorReturn(){
        throw new \yii\web\BadRequestHttpException("sth wrong");
    }

}
