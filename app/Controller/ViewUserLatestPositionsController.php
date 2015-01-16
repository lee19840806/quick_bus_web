<?php
App::uses('AppController', 'Controller');
/**
 * ViewUserLatestPositions Controller
 *
 * @property ViewUserLatestPosition $ViewUserLatestPosition
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

	public function beforeFilter()
	{
		parent::beforeFilter();
		$this->Auth->allow('wechat_latest_position_by_name', 'wechat_latest_position_by_id');
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
}
