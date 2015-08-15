<?php
App::uses('AppController', 'Controller');
/**
 * Companies Controller
 *
 * @property Company $Company
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class CompaniesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	
	public function beforeFilter()
	{
	    parent::beforeFilter();
	    $this->Auth->allow('getAllCompanies', 'getCompanies');
	}
    
    public function getAllCompanies()
    {
		$this->request->onlyAllow('post');
		$this->response->header('Access-Control-Allow-Origin', '*');
        
		$companies = $this->Company->find('all', array(
		    'order' => array('Company.name'),
		    'recursive' => 0
		));
        
		$this->set('var', json_encode($companies));
		$this->render('/Companies/ajaxReturn', 'ajax');
	}
}















