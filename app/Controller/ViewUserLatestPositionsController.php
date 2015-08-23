<?php
App::uses('AppController', 'Controller');
/**
 * ViewUserLatestPositions Controller
 *
 * @property ViewUserLatestPosition $ViewUserLatestPosition
 * @property UserRoute $UserRoute
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ViewUserLatestPositionsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	public $uses = array('ViewUserLatestPosition', 'UserRoute');

	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('wechat_latest_position_by_name', 'wechat_latest_position_by_id', 'carrefour_wanli', 'carrefour_baoshan', 'get_carrefour_buses_wanli',
		    'get_carrefour_buses_baoshan');
	}
	
	public function wechat_latest_position_by_name()
	{
		if ($this->request->is('post'))
		{
			$latest_position = $this->ViewUserLatestPosition->find('first',
				array('conditions' => array('name' => $this->request->data('route_name'))));
	
			$this->set('latest_position', json_encode($latest_position));
			$this->render('/ViewUserLatestPositions/ajaxReturn', 'ajax');
		}
	}
	
	public function wechat_latest_position_by_id()
	{
		if ($this->request->is('post'))
		{
			$latest_position = $this->ViewUserLatestPosition->find('first',
				array('conditions' => array('user_route_id' => $this->request->data('route_id'))));
	
			$this->set('latest_position', json_encode($latest_position));
			$this->render('/ViewUserLatestPositions/ajaxReturn', 'ajax');
		}
	}
	
	public function carrefour_wanli()
	{
	    $this->layout = 'carrefour';
	    
        $latest_position = $this->ViewUserLatestPosition->find('all',
            array(
                'conditions' => array('name LIKE' => '家乐福万里店%'),
                'fields' => array('user_route_id', 'name', 'latitude', 'longitude', 'heading', 'created', 'run_status'),
                'order' => array('name')
            )
        );
    
        $this->set('latest_position', json_encode($latest_position));
	}
	
	public function carrefour_baoshan()
	{
	    $this->layout = 'carrefour';
	     
	    $latest_position = $this->ViewUserLatestPosition->find('all',
	        array(
// 	            'conditions' => array('name LIKE' => '家乐福宝山店%'),
	            'conditions' => array('name' => array('家乐福宝山店12号班车', '家乐福宝山店5号班车')),
	            'fields' => array('user_route_id', 'name', 'latitude', 'longitude', 'heading', 'created', 'run_status'),
	            'order' => array('name')
	        )
	    );
	
	    $this->set('latest_position', json_encode($latest_position));
	}
	
	public function get_carrefour_buses_wanli()
	{
	    if ($this->request->is('ajax'))
	    {
	        $latest_position = $this->UserRoute->find('all',
	            array(
	                'conditions' => array('UserRoute.name LIKE' => '家乐福万里店%'),
	                'fields' => array(
	                    'UserRoute.id', 'UserRoute.name', 'ViewUserLatestPosition.latitude','ViewUserLatestPosition.longitude', 'ViewUserLatestPosition.heading',
	                    'ViewUserLatestPosition.created', 'ViewUserLatestPosition.run_status'
	                ),
	                'order' => array('UserRoute.name')
	            )
	        );
	
	        $this->set('latest_position', json_encode($latest_position));
	        $this->render('/ViewUserLatestPositions/ajaxReturn', 'ajax');
	    }
	}
	
	public function get_carrefour_buses_baoshan()
	{
	    if ($this->request->is('ajax'))
	    {
	        $latest_position = $this->UserRoute->find('all',
	            array(
// 	                'conditions' => array('UserRoute.name LIKE' => '家乐福宝山店%'),
	                'conditions' => array('UserRoute.name' => array('家乐福宝山店12号班车', '家乐福宝山店5号班车')),
	                'fields' => array(
	                    'UserRoute.id', 'UserRoute.name', 'ViewUserLatestPosition.latitude','ViewUserLatestPosition.longitude', 'ViewUserLatestPosition.heading',
	                    'ViewUserLatestPosition.created', 'ViewUserLatestPosition.run_status'
	                ),
	                'order' => array('UserRoute.name')
	            )
	        );
	         
	        $this->set('latest_position', json_encode($latest_position));
	        $this->render('/ViewUserLatestPositions/ajaxReturn', 'ajax');
	    }
	}
}














