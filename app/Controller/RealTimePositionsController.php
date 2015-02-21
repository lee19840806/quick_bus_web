<?php
App::uses('AppController', 'Controller');
/**
 * RealTimePositions Controller
 *
 * @property RealTimePosition $RealTimePosition
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class RealTimePositionsController extends AppController {
    
 /**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	public $uses = array('RealTimePosition', 'ViewUserRouteHistoryDay', 'UserRoute', 'ViewUserRouteDetail');
	
	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('imei_upload');
	}
	
	public function select_date($route_id = NULL)
	{
	    $history = $this->ViewUserRouteHistoryDay->find('all',
	        array('conditions' => array('user_id' => $this->Auth->user('id'), 'user_route_id' => $route_id), 'order' => array('replay_day DESC'), 'limit' => 5));
	    //$this->Auth->user('id')
	    
	    $this->set('history', $history);
	}
	
	public function show_track()
	{
	    if ($this->request->is('post'))
	    {
	        $routeID = $this->request->data['UserRouteID'];
	        $date = $this->request->data['SelectDate'];
	        
	        //$routeID = '30';
	        //$date = '2015-01-13';
	
	        if ($this->UserRoute->isOwnedBy($routeID, $this->Auth->user('id')))
	        //if ($this->UserRoute->isOwnedBy($routeID, '8'))
	        {
	            $routeName = $this->UserRoute->find('first', array('conditions' => array('UserRoute.id' => $routeID)))['UserRoute']['name'];
	            
	            $this->RealTimePosition->recursive = -1;
	            $positions = $this->RealTimePosition->find('all', array('conditions' => array(
	                'user_route_id' => $routeID,
	                'MAKEDATE(EXTRACT(year FROM RealTimePosition.created), DAYOFYEAR(RealTimePosition.created))' => $date
                    ),
	                'fields' => array('id', 'latitude', 'longitude', 'heading', 'created')
	            ));
	            
	            if (count($positions) == 0)
	            {
	                $this->Session->setFlash('所选日期没有运行记录，请重选一条线路进行轨迹回放');
	                $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
	            }
	            
	            $stationsAndTriggers = $this->ViewUserRouteDetail->find('all', array('conditions' => array('user_route_id' => $routeID)));
	            $route = $this->UserRoute->find('first', array('conditions' => array('UserRoute.id' => $routeID)));
	            
	            $this->set('stationsAndTriggers', json_encode($stationsAndTriggers));
	            $this->set('route', json_encode($route));
	            $this->set('positions', json_encode($positions));
	        }
	        else
	        {
	            $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
	        }
	    }
	    else
	    {
	        $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
	    }
	}

    public function upload()
    {
        if ($this->request->is('post'))
        {
            $returnValue = $this->RealTimePosition->saveRealTimePosition($this->request->data['RealTimePosition'], $this->Auth->user('id'));
            $this->set('returnValue', $returnValue);
        }
        else
        {
            $this->set('returnValue', 99);
        }
        
        $notifyPhones = $this->RealTimePosition->ViewUserNotifyPhone->find('all', array(
            'conditions' => array(
                'ViewUserNotifyPhone.user_id' => $this->Auth->user('id'),
                'ViewUserNotifyPhone.user_route_id' => $this->request->data['RealTimePosition']['user_route_id']),
            'fields' => array('ViewUserNotifyPhone.*')
            ));
        
        if (count($notifyPhones) > 0)
        {
            $UserNotifyPhoneHistoryRecords = array();
            $phoneNumbersArray = array();
            $stationName = '';
            
            foreach ($notifyPhones as $phone)
            {
                array_push($UserNotifyPhoneHistoryRecords, $phone['ViewUserNotifyPhone']);
                array_push($phoneNumbersArray, $phone['ViewUserNotifyPhone']['phone_number']);
                $stationName = $phone['ViewUserNotifyPhone']['station_name'];
                
                $returnValue = $this->RealTimePosition->sendTemplateSMS(
                    'f888473d1547897a797c85b3e1c63a0d', 353696, '#name#=' . $stationName, $phone['ViewUserNotifyPhone']['phone_number']);
                $this->set('returnValue', $returnValue);
            }
            
            $this->RealTimePosition->UserNotifyPhoneHistory->create();
            
            if (!$this->RealTimePosition->UserNotifyPhoneHistory->saveMany($UserNotifyPhoneHistoryRecords))
            {
                $this->set('returnValue', 4);
            }
        }
        
        $this->render('/RealTimePositions/upload', 'ajax');
    }
    
    public function imei_upload()
    {
    	if ($this->request->is('post'))
    	{
    		$returnValue = $this->RealTimePosition->saveImeiPosition($this->request->data['RealTimePosition']);
    		$this->set('returnValue', $returnValue);
    	}
    	else
    	{
    		$this->set('returnValue', 99);
    	}
    	
    	$user_route_imei = $this->RealTimePosition->UserRoute->UserRouteImeiMapping->find('first',
    		array('conditions' => array('imei' => $this->request->data['RealTimePosition']['imei'])));
    	
    	if (count($user_route_imei) == 0)
    	{
    		$this->set('returnValue', 6);
    		$this->render('/RealTimePositions/upload', 'ajax');
    		return;
    	}
    	
    	$user_route_id = $user_route_imei['UserRouteImeiMapping']['user_route_id'];
        
    	$notifyPhones = $this->RealTimePosition->ViewUserNotifyPhone->find('all', array(
   			'conditions' => array(
				'ViewUserNotifyPhone.user_id' => $this->Auth->user('id'),
				'ViewUserNotifyPhone.user_route_id' => $user_route_id),
   			'fields' => array('ViewUserNotifyPhone.*')
    	));
    
    	if (count($notifyPhones) > 0)
    	{
    		$UserNotifyPhoneHistoryRecords = array();
    		$phoneNumbersArray = array();
    		$stationName = '';
    
    		foreach ($notifyPhones as $phone)
    		{
    			array_push($UserNotifyPhoneHistoryRecords, $phone['ViewUserNotifyPhone']);
    			array_push($phoneNumbersArray, $phone['ViewUserNotifyPhone']['phone_number']);
    			$stationName = $phone['ViewUserNotifyPhone']['station_name'];
    
    			$returnValue = $this->RealTimePosition->sendTemplateSMS(
    				'f888473d1547897a797c85b3e1c63a0d', 353696, '#name#=' . $stationName, $phone['ViewUserNotifyPhone']['phone_number']);
    			$this->set('returnValue', $returnValue);
    		}
    
    		$this->RealTimePosition->UserNotifyPhoneHistory->create();
    
    		if (!$this->RealTimePosition->UserNotifyPhoneHistory->saveMany($UserNotifyPhoneHistoryRecords))
    		{
    			$this->set('returnValue', 4);
    		}
    	}
    
    	$this->render('/RealTimePositions/upload', 'ajax');
    }
    
    public function no_sms()
    {
        if ($this->request->is('post'))
        {
            $returnValue = $this->RealTimePosition->saveRealTimePosition($this->request->data['RealTimePosition'], $this->Auth->user('id'));
            $this->set('returnValue', $returnValue);
        }
        else
        {
            $this->set('returnValue', 99);
        }
        
        $notifyPhones = $this->RealTimePosition->ViewUserNotifyPhone->find('all', array(
            'conditions' => array(
                'ViewUserNotifyPhone.user_id' => $this->Auth->user('id'),
                'ViewUserNotifyPhone.user_route_id' => $this->request->data['RealTimePosition']['user_route_id']),
            'fields' => array('ViewUserNotifyPhone.*')
            ));
        
        if (count($notifyPhones) > 0)
        {
            $UserNotifyPhoneHistoryRecords = array();
            $phoneNumbersArray = array();
            $stationName = '';
            
            foreach ($notifyPhones as $phone)
            {
                array_push($UserNotifyPhoneHistoryRecords, $phone['ViewUserNotifyPhone']);
                array_push($phoneNumbersArray, $phone['ViewUserNotifyPhone']['phone_number']);
                $stationName = $phone['ViewUserNotifyPhone']['station_name'];
                
                $this->set('returnValue', $returnValue);
            }
            
            $this->RealTimePosition->UserNotifyPhoneHistory->create();
            
            if (!$this->RealTimePosition->UserNotifyPhoneHistory->saveMany($UserNotifyPhoneHistoryRecords))
            {
                $this->set('returnValue', 4);
            }
        }
        
        $this->render('/RealTimePositions/upload', 'ajax');
    }
    
    public function test_upload()
    {
        
    }
    
    public function mobile_gps($routeID)
    {
        if ($this->RealTimePosition->UserRoute->isOwnedBy($routeID, $this->Auth->user('id')))
        {
            $this->set('routeID', $routeID);
            $this->set('userID', $this->Auth->user('id'));
        }
        else
        {
            $this->render('mobile_gps_error');
        }
    }
}
