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
	
	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('wechat_route_station_detail', 'wechat_route_station_detail_by_name');
	}
	
	public function wechat_route_station_detail()
	{
		if ($this->request->is('post'))
		{
			$route_detail = $this->ViewUserRouteDetail->find('all',
				array('conditions' => array(
				'ViewUserRouteDetail.user_route_id' => $this->request->data('user_route_id')
				),
				'fields' => array('user_route_id', 'route_name', 'station_sequence', 'station_name', 'station_lng', 'station_lat')
				));
	
			$this->set('route_detail', json_encode($route_detail));
			$this->render('/ViewUserRouteDetails/ajaxReturn', 'ajax');
		}
	}
	
	public function wechat_route_station_detail_by_name()
	{
	    if ($this->request->is('post'))
	    {
	        $route_detail = $this->ViewUserRouteDetail->find('all',
	            array('conditions' => array(
	                'ViewUserRouteDetail.route_name' => $this->request->data('route_name')
	            ),
	                'fields' => array('user_route_id', 'route_name', 'station_sequence', 'station_name', 'station_lng', 'station_lat')
	            ));
	
	        $this->set('route_detail', json_encode($route_detail));
	        $this->render('/ViewUserRouteDetails/ajaxReturn', 'ajax');
	    }
	}
	
	public function wechat_route_ending_station()
	{
		if ($this->request->is('post'))
		{
			$max_station_seq = $this->ViewUserRouteDetail->find('first',
				array('conditions' => array(
				'ViewUserRouteDetail.user_id' => $this->Auth->user('id'),
				'ViewUserRouteDetail.user_route_id' => $this->request->data('user_route_id')
				),
				'fields' => array('max(station_sequence) as max_station_seq')
				));
			
			$route_detail = $this->ViewUserRouteDetail->find('first',
				array('conditions' => array(
				'ViewUserRouteDetail.user_id' => $this->Auth->user('id'),
				'ViewUserRouteDetail.user_route_id' => $this->request->data('user_route_id'),
				'ViewUserRouteDetail.station_sequence' => $max_station_seq[0]['max_station_seq']
				),
				'fields' => array('user_route_id', 'route_name', 'station_sequence', 'station_name', 'station_lng', 'station_lat')
				));
	
			$station_array = array('linename' => $route_detail['ViewUserRouteDetail']['route_name'], 
				'lo' => $route_detail['ViewUserRouteDetail']['station_lng'],
				'la' => $route_detail['ViewUserRouteDetail']['station_lat']
				);
			
			$this->set('route_detail', json_encode(array($this->request->data('user_route_id') => $station_array)));
			$this->render('/ViewUserRouteDetails/ajaxReturn', 'ajax');
		}
	}
}
