<?php

namespace common\components;
use \Yii;
use yii\web\Response;
use yii\helpers\Url;
use app\models\Article;
use \crazyfd\qiniu\Qiniu;
use \yii\imagine\Image;

class Base64Image
{
  public static function base64EncodeImage ($image_file) {
      $base64_image = '';
      $image_info = getimagesize($image_file);
      $image_data = fread(fopen($image_file, 'r'), filesize($image_file));
      $base64_image = 'data:' . $image_info['mime'] . ';base64,' . chunk_split(base64_encode($image_data));
      return $base64_image;
  }
  /*
  * 后台使用
  */
  public static function upBase64Img($base64 , $prefix = ""){
  	$base = substr(strstr($base64,','),1);
    $base = str_replace(' ', '+', $base);
    $img = base64_decode($base);
    $time = date('Y/md', time());
    $save_path = Yii::getAlias('@webroot').'/uploads/admins/imgs/'.$time."/";

    $shejiname = $prefix.md5(uniqid(microtime(true),true)).".jpg";
    $url = '/uploads/admins/imgs/'.$time."/".$shejiname;

    if (!file_exists($save_path))
        mkdir($save_path, 0755, TRUE);

    file_put_contents($save_path.$shejiname, $img);
    return $url;
  }

  /*
  * 后台使用
  */
  public static function upBase64ImgUser($base64 , $prefix = ""){
    $base = substr(strstr($base64,','),1);
    $base = str_replace(' ', '+', $base);
    $img = base64_decode($base);
    $time = date('Y/md', time());
    $save_path = Yii::getAlias('@webroot').'/uploads/user/imgs/'.$time."/";

    $shejiname = $prefix.md5(uniqid(microtime(true),true)).".jpg";
    $url = '/uploads/user/imgs/'.$time."/".$shejiname;

    if (!file_exists($save_path))
        mkdir($save_path, 0755, TRUE);

    file_put_contents($save_path.$shejiname, $img);
    return $url;
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

  public static function upVideo($file,$prefix=""){
    $time = date('Y/md', time());
  	$shejiname = $prefix.uniqid().".mp4";
    $url = '/uploads/admins/videos/'.$time."/".$shejiname;
    $time = date('Y/md', time());
    $save_path = Yii::getAlias('@webroot').'/uploads/admins/videos/'.$time."/";
  	if (!file_exists($save_path))
      	mkdir($save_path, 0755, TRUE);

    move_uploaded_file($file,$save_path.$shejiname);
    return $url;
  }

  public function upQiniuByBase64ToFile($base64){
    $base = substr(strstr($base64,','),1);
    $base = str_replace(' ', '+', $base);
    $img = base64_decode($base);
    $key = 'masteranli'.uniqid();
    $name = $key.".jpg";

    $createImgPath = Yii::getAlias('@webroot').'/'.$name;
    $mark = Yii::getAlias('@webroot').'/mark.png';
    file_put_contents($createImgPath, $img);
    $size = getimagesize( $createImgPath );

    Image::watermark($createImgPath, $mark, [$size[0]/2-120 ,$size[1]/2-90])->save($createImgPath, ['quality' => 100]);

    $qiniu = new Qiniu(Article::AK, Article::SK, Article::DOMAIN,Article::BUCKET);
    $qiniu->uploadFile($createImgPath, $key);
    $pics = $qiniu->getLink($key);
    unlink($createImgPath);
    return $pics."?imageslim";
  }

  /*
  * 前台使用
  * $base64 
  * save_path 保存路径
  * url return 上传url
  * prefix 前缀 上传url
  */
  public static function upQiniuByBase64Img($base64){
    $base64 = substr(strstr($base64,','),1);
    $base64 = str_replace(' ', '+', $base64);
    $qiniu = new Qiniu(Article::AK, Article::SK, Article::DOMAIN,Article::BUCKET);
    $upToken = $qiniu->uploadToken(['scope' => Article::BUCKET]);//获取上传所需的token

    return self::request_by_curl('http://up.qiniu.com/putb64/-1',$base64,$upToken);
  }

  private static function request_by_curl($remote_server,$post_string,$upToken) {
    $headers = array();
    $headers[] = 'Content-Type:image/png';
    $headers[] = 'Authorization:UpToken '.$upToken;
    $ch = curl_init();  
    curl_setopt($ch, CURLOPT_URL,$remote_server);  
    //curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_HTTPHEADER ,$headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
    //curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_string);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    $data = curl_exec($ch);  
    curl_close($ch);  
    
    return $data;  
  }

}