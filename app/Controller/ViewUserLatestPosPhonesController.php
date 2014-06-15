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
        $this->Auth->allow('passenger_inquery');
    }

    public function passenger_inquiry()
    {
        $aaa = $this->ViewUserLatestPosPhone->find('all', array('conditions' => array('ViewUserLatestPosPhone.phone_number' => $this->request->query['phone_number'])));
        $this->set('phone_number', $this->request->query['phone_number']);
    }
}
