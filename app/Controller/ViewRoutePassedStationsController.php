<?php
App::uses('AppController', 'Controller');
/**
 * ViewRoutePassedStations Controller
 *
 * @property ViewRoutePassedStation $ViewRoutePassedStation
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ViewRoutePassedStationsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('wechat_passed_stations_by_name', 'wechat_passed_stations_by_id');
	}
	
	public function wechat_passed_stations_by_name()
	{
		if ($this->request->is('post'))
		{
			$passed_stations = $this->ViewRoutePassedStation->find('all',
				array(
					'conditions' => array(
						'route_name' => $this->request->data('route_name'),
						'minutes_elapsed <=' => $this->request->data('minutes_elapsed')),
					'order' => array('minutes_elapsed' => 'asc')
				));
	
			$this->set('passed_stations', json_encode($passed_stations));
			$this->render('/ViewRoutePassedStations/ajaxReturn', 'ajax');
		}
	}
	
	public function wechat_passed_stations_by_id()
	{
		if ($this->request->is('post'))
		{
			$passed_stations = $this->ViewRoutePassedStation->find('all',
					array(
						'conditions' => array(
							'user_route_id' => $this->request->data('route_id'),
							'minutes_elapsed <=' => $this->request->data('minutes_elapsed')),
						'order' => array('minutes_elapsed' => 'asc')
					));
	
			$this->set('passed_stations', json_encode($passed_stations));
			$this->render('/ViewRoutePassedStations/ajaxReturn', 'ajax');
		}
	}
}
