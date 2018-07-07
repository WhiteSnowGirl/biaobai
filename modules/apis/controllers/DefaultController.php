<?php

namespace app\modules\apis\controllers;

// use yii\web\Controller;
use app\modules\apis\controllers\BaseController;

/**
 * Default controller for the `apis` module
 */
class DefaultController extends BaseController
{
	protected $except = ['index'];
  /**
   * Renders the index view for the module
   * @return string
   */
  public function actionIndex()
  {
      return [1];
  }
}
