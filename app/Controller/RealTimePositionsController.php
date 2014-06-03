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
        $this->set('routeID', $routeID);
        $this->set('userID', $this->Auth->user('id'));
    }
}
