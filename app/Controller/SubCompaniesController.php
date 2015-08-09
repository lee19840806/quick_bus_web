<?php
App::uses('AppController', 'Controller');
/**
 * SubCompanies Controller
 *
 * @property SubCompany $SubCompany
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SubCompaniesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	
	public function beforeFilter()
	{
	    parent::beforeFilter();
	    $this->Auth->allow('getSubCompaniesByCompany', 'getSubCompaniesByDistrict');
	}
	
	public function getSubCompaniesByCompany()
	{
	    $this->request->onlyAllow('post');
	
	    $subCompanies = $this->SubCompany->find('all', array(
	        'conditions' => array('Company.name' => $this->request->data('companyName')),
	        'fields' => array('SubCompany.id', 'SubCompany.name', 'SubCompany.created', 'Company.name', 'District.city', 'District.district'),
	        'recursive' => 0
	    ));
	
	    $this->set('var', json_encode($subCompanies));
	    $this->render('/Companies/ajaxReturn', 'ajax');
	}
	
	public function getSubCompaniesByDistrict()
	{
	    $this->request->onlyAllow('post');
	
	    $subCompanies = $this->SubCompany->find('all', array(
	        'conditions' => array('District.city' => $this->request->data('city'), 'District.district' => $this->request->data('district')),
	        'fields' => array('SubCompany.id', 'SubCompany.name', 'SubCompany.created', 'Company.name', 'District.city', 'District.district'),
	        'recursive' => 0
	    ));
	
	    $this->set('var', json_encode($subCompanies));
	    $this->render('/Companies/ajaxReturn', 'ajax');
	}
}















