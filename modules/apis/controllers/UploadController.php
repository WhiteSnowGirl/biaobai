<?php
namespace app\modules\apis\controllers;

use \Yii;
use yii\helpers\FileHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use app\modules\apis\controllers\BaseController;
use crazyfd\qiniu\Qiniu;
use app\models\Article;
use app\models\User;
use app\models\jobs\MasterJob;
use common\components\Base64Image;
use yii\imagine\Image;
/*
上传图片删除图片
*/
class UploadController extends BaseController
{
	protected $verbs=[
		"upload"=>["post"]
	];

	/* 编辑器上传图片*/
	public function actionImgup(){
		$res=[];
		if (!in_array($_FILES["file"]["type"], ["image/gif","image/jpeg","image/pjpeg","image/x-png","image/png"])) {
		    $res = ['error' => '图片图片格式不正确'];
		    return json_encode($res);
		}

		$size = getimagesize($_FILES["file"]["tmp_name"]);
		$webroot = Yii::getAlias('@webroot/thumb-watermark.jpg');
		$save_path = Yii::getAlias('@webroot').'/products/'.date("Y/md",time()).'/';

		$webPath = '/products/'.date("Y/md",time()).'/'.md5(uniqid(microtime(true),true)).'.jpg';
		$watermark = Yii::getAlias('@webroot').$webPath;

		if (!file_exists($save_path)){
		    mkdir($save_path, 0755, TRUE);
		}

		move_uploaded_file($_FILES["file"]["tmp_name"],$watermark);
		
		return ["img"=>$webPath];
	}

	/** 文件转base64输出
	* @param  String $file 文件路径
	* @return String base64 string
	*/
	public static function fileToBase64($file){
	  $base64_file = '';
	  if(file_exists($file)){
	      $mime_type= mime_content_type($file);
	      $base64_data = base64_encode(file_get_contents($file));
	      $base64_file = 'data:'.$mime_type.';base64,'.$base64_data;
	  }
	  return $base64_file;
	}

}