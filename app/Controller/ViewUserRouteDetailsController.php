<?php
App::uses('AppController', 'Controller');
/**
 * ViewUserRouteDetails Controller
 *
 * @property ViewUserRouteDetail $ViewUserRouteDetail
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ViewUserRouteDetailsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	
	public function wechat_route_station_detail()
	{
		if ($this->request->is('post'))
		{
			$route_detail = $this->ViewUserRouteDetail->find('all',
				array('conditions' => array(
				'ViewUserRouteDetail.user_id' => $this->Auth->user('id'),
				'ViewUserRouteDetail.user_route_id' => $this->request->data('user_route_id')
				),
				'fields' => array('user_route_id', 'route_name', 'station_sequence', 'station_name', 'station_lng', 'station_lat')
				));
	
			$this->set('route_detail', json_encode($route_detail));
			$this->render('/ViewUserRouteDetails/ajaxReturn', 'ajax');
		}
	}
}
