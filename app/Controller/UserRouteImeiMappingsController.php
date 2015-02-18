<?php
App::uses('AppController', 'Controller');
/**
 * UserRouteImeiMappings Controller
 *
 * @property UserRouteImeiMapping $UserRouteImeiMapping
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class UserRouteImeiMappingsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

	public function edit($id = NULL)
	{
		if (!$this->UserRouteImeiMapping->UserRoute->exists($id))
		{
			$this->Session->setFlash('不存在此路线，请重选一条线路进行编辑');
			$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
		}
		elseif (!$this->UserRouteImeiMapping->UserRoute->isOwnedBy($id, $this->Auth->user('id')))
		{
			$this->Session->setFlash('选择有误，请重选一条线路进行编辑');
			$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
		}
		
		$mapping = $this->UserRouteImeiMapping->find('first', array('conditions' => array('UserRoute.id' => $id)));
		$route = $this->UserRouteImeiMapping->UserRoute->find('first', array('conditions' => array('UserRoute.id' => $id)));
		
		if (count($mapping) == 0)
		{
			$mapping = array('UserRouteImeiMapping' => array('imei' => ''));
		}
		
		$this->set('mapping', $mapping);
		$this->set('route', $route);
	}
	
	public function ajaxCheckIMEI()
	{
		if ($this->request->is('ajax'))
		{
			$findResult = $this->UserRouteImeiMapping->find('first', array(
				'conditions' => array(
					'imei' => $this->request->data('imei')
			)));
	
			if (count($findResult) == 0)
			{
				$this->set('is_available', json_encode(array('available' => 'yes', 'route_name' => '')));
			}
			else
			{
				$route = $this->UserRouteImeiMapping->UserRoute->find('first', array(
					'conditions' => array(
						'UserRoute.id' => $findResult['UserRouteImeiMapping']['user_route_id']
				)));
				
				$this->set('is_available', json_encode(array('available' => 'no', 'route_name' => $route['UserRoute']['name'])));
			}
	
			$this->render('/UserRouteImeiMappings/ajaxReturn', 'ajax');
		}
	}
	
	public function submit()
	{
		if ($this->request->is('post'))
		{
			$routeID = $this->request->data['UserRouteID'];
			
			if ($this->UserRouteImeiMapping->UserRoute->isOwnedBy($routeID, $this->Auth->user('id')))
			{
				$dataToBeSaved = array('user_route_id' => $routeID, 'imei' => $this->request->data['Imei']);
				
				$this->UserRouteImeiMapping->deleteAll(array('user_route_id' => $routeID));
				
				if ($this->UserRouteImeiMapping->save($dataToBeSaved))
				{
					$this->redirect(array('controller' => 'UserRouteImeiMappings', 'action' => 'submit_succeeded'));
				}
				else
				{
					$this->Session->setFlash('保存IMEI出错，请重选一条线路进行编辑');
					$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
				}
			}
			else
			{
				$this->Session->setFlash('提交IMEI有误，请重选一条线路进行编辑');
				$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
			}
		}
	}
	
	public function submit_succeeded()
	{
		
	}
	
	public function delete($id = null)
	{
		if ($this->request->is('post'))
		{
			if (!$this->UserRouteImeiMapping->UserRoute->exists($id))
			{
				$this->Session->setFlash('此线路不存在，请重选一条线路进行编辑');
				$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
			}
		
			if ($this->UserRouteImeiMapping->deleteAll(array('user_route_id' => $id)))
			{
				$this->redirect(array('action' => 'delete_succeeded'));
			}
			else
			{
				$this->Session->setFlash('无法删除线路，请稍后再试');
				$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
			}
		}
	}
	
	public function delete_succeeded()
	{
		
	}
}













