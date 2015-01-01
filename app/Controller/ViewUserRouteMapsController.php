<?php
App::uses('AppController', 'Controller');
/**
 * ViewUserRouteMaps Controller
 *
 * @property ViewUserRouteMap $ViewUserRouteMap
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ViewUserRouteMapsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('wechat_route_map');
	}
	
	public function wechat_route_map()
	{
		if ($this->request->is('post'))
		{
			$route_map = $this->ViewUserRouteMap->find('all', array('conditions' => array(
				'ViewUserRouteMap.route_name' => $this->request->data('route_name')
			)));
	
			$this->set('route_map', json_encode($route_map));
			$this->render('/ViewUserRouteMaps/ajaxReturn', 'ajax');
		}
	}
}
