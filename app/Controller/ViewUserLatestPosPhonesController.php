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
        $this->Auth->allow('passenger_inquiry');
    }

    public function passenger_inquiry()
    {
        $this->ViewUserLatestPosPhone->recursive = 0;
        $this->Paginator->settings = array('conditions' => array('ViewUserLatestPosPhone.phone_number' => $this->request->query['phone_number']), 'limit' => 5);
		$this->set('latestPositions', $this->Paginator->paginate('ViewUserLatestPosPhone'));
    }
    
    public function latestPosition($route_name)
    {
        $route = $this->ViewUserLatestPosPhone->find('first', 
            array('conditions' => array('ViewUserLatestPosPhone.route_name' => $route_name)));
    }
}
