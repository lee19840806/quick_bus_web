<?php
App::uses('AppController', 'Controller');
/**
 * ViewUserLatestPosPhones Controller
 *
 * @property ViewUserLatestPosPhone $ViewUserLatestPosPhone
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ViewUserLatestPosPhonesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
    
    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->Auth->allow('passenger_inquiry', 'latestPosition', 'latestPositionInquiry');
    }

    public function passenger_inquiry()
    {
        $this->ViewUserLatestPosPhone->recursive = 0;
        $this->Paginator->settings = array('conditions' => array('ViewUserLatestPosPhone.phone_number' => $this->request->query['phone_number']), 'limit' => 5);
		$this->set('latestPositions', $this->Paginator->paginate('ViewUserLatestPosPhone'));
        
        $this->set('phone_num', $this->request->query['phone_number']);
    }
    
    public function latestPosition($route_name, $phone_num)
    {
        $route = $this->ViewUserLatestPosPhone->find('first', 
            array('conditions' => array('ViewUserLatestPosPhone.route_name' => $route_name, 'ViewUserLatestPosPhone.phone_number' => $phone_num)));
        
        if ($route != NULL)
        {
            $this->set('route_name', $route_name);
            $this->set('phone_num', $phone_num);
        }
    }
    
    public function latestPositionInquiry()
    {
        if ($this->request->is('ajax'))
        {
            $route = $this->ViewUserLatestPosPhone->find('first', array('conditions' => array(
                'ViewUserLatestPosPhone.route_name' => $this->request->data('route_name'), 
                'ViewUserLatestPosPhone.phone_number' => $this->request->data('phone_num')
                )));
            
            if ($route != NULL)
            {
                $this->set('position', json_encode($route));
                $this->render('/ViewUserLatestPosPhones/ajaxReturn', 'ajax');
            }
        }
    }
}
