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
	    $this->Auth->allow('getAllCompanies');
	}
    
    public function getAllCompanies()
    {
		$this->request->onlyAllow('post');
        
		$companies = $this->Company->find('all', array('recursive' => 0));
        
		$this->set('var', json_encode($companies));
		$this->render('/Companies/ajaxReturn', 'ajax');
	}
}















