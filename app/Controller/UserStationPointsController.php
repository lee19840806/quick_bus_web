<?php
App::uses('AppController', 'Controller');
/**
 * UserStationPoints Controller
 *
 * @property UserStationPoint $UserStationPoint
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class UserStationPointsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null)
    {
		if (!$this->UserStationPoint->UserRoute->exists($id))
        {
            $this->Session->setFlash('不存在此路线，请重选一条线路进行编辑');
            $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
		}
        elseif (!$this->UserStationPoint->UserRoute->isOwnedBy($id, $this->Auth->user('id')))
        {
            $this->Session->setFlash('选择有误，请重选一条线路进行编辑');
            $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
        }
        else
        {
            $route = $this->UserStationPoint->UserRoute->find('first', array('conditions' => array('UserRoute.id' => $id)));
            $this->set('route', $route);
        }
	}
    
    public function submitPhoneNumbers()
    {
        if ($this->request->is('post'))
        {
            $stationsAndPhoneNumbers = $this->request->data['stationInfo'];
            
            foreach ($stationsAndPhoneNumbers as $stationPhone)
            {
                if (!$this->UserStationPoint->isOwnedBy($stationPhone['stationID'], $this->Auth->user('id')))
                {
                    $this->Session->setFlash('站点归属权有误，请重选一条线路进行编辑');
                    $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
                }
            }
            
            $bbb = $this->request->data;
        }
    }
}
