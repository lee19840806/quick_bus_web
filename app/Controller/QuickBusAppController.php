<?php
App::uses('AppController', 'Controller');
/**
 * QuickBusApp Controller
 *
 * @property UserRoute $UserRoute
 * @property SessionComponent $Session
 */
class QuickBusAppController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Session');
	public $uses = array('ViewUserLatestPosition', 'UserRoute');

	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('store_select', 'route_select', 'route_position');
	}
	
	public function store_select()
	{
	    $this->layout = 'WebApp';
	    
		$stores = array(
		    array('store' => '家乐福 - 万里店', 'name' => 'wanli'),
		    array('store' => '家乐福 - 宝山店', 'name' => 'baoshan')
		);

		$this->set('stores', $stores);
	}
	
	public function route_select($name = NULL)
	{
	    $this->layout = 'WebApp';
	    
	    $storeNameList = array(
	        'wanli' => '家乐福万里店%',
	        'baoshan' => '家乐福宝山店%'
	    );
	    
	    $condition = $storeNameList[$name];
	    
	    if ($condition == null)
	    {
	        $this->redirect('/QuickBusApp/store_select');
	    }
	    
	    $routes = $this->UserRoute->find('list',
	        array(
	            'conditions' => array('UserRoute.name LIKE' => $condition),
	            'order' => array('UserRoute.name'),
	            'recursive' => 0
	        )
	    );
	
	    $this->set('routes', $routes);
	}
	
	public function route_position($routeID = NULL)
	{
	    $this->layout = 'WebApp';
	    
	    $aaa = $this->request->host();
	    
	    $route = $this->UserRoute->find('first',
	        array(
	            'conditions' => array('UserRoute.id' => $routeID),
	            'fields' => array(
	                'UserRoute.id', 'UserRoute.name', 'ViewUserLatestPosition.latitude','ViewUserLatestPosition.longitude', 'ViewUserLatestPosition.heading',
	                'ViewUserLatestPosition.created', 'ViewUserLatestPosition.run_status'
	            )
	        )
	    );
	    
	    $this->set('route', json_encode($route));
	    $this->set('routeName', $route['UserRoute']['name']);
	    $this->set('routeID', $route['UserRoute']['id']);
	}
}














