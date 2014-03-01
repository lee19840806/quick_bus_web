<?php
App::uses('AppController', 'Controller');
/**
 * UserRoutes Controller
 *
 * @property UserRoute $UserRoute
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 * @property User $User
 * @property UserRoutePoint $UserRoutePoint
 */
class UserRoutesController extends AppController {

/**
 * Helpers
 *
 * @var array
 */
	public $helpers = array('Session');

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->UserRoute->recursive = 0;
		$this->set('userRoutes', $this->Paginator->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->UserRoute->exists($id)) {
			throw new NotFoundException(__('Invalid user route'));
		}
		$options = array('conditions' => array('UserRoute.' . $this->UserRoute->primaryKey => $id));
		$this->set('userRoute', $this->UserRoute->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->UserRoute->create();
			if ($this->UserRoute->save($this->request->data)) {
				$this->Session->setFlash(__('The user route has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user route could not be saved. Please, try again.'));
			}
		}
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		if (!$this->UserRoute->exists($id)) {
			throw new NotFoundException(__('Invalid user route'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->UserRoute->save($this->request->data)) {
				$this->Session->setFlash(__('The user route has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user route could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('UserRoute.' . $this->UserRoute->primaryKey => $id));
			$this->request->data = $this->UserRoute->find('first', $options);
		}
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		$this->UserRoute->id = $id;
		if (!$this->UserRoute->exists()) {
			throw new NotFoundException(__('Invalid user route'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ($this->UserRoute->delete()) {
			$this->Session->setFlash(__('The user route has been deleted.'));
		} else {
			$this->Session->setFlash(__('The user route could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
    
    public function submit()
    {
        if ($this->request->is('post'))
        {
            $this->loadModel('User');
            $user_array = $this->User->find('first', array(
                'conditions' => array('username' => $this->Auth->user('username')),
                'fields' => array('id', 'username')
            ));
            
            $user_route_to_be_saved = array(
                'user_id' => $user_array['User']['id'],
                'name' => $this->request->data('UserRoute.name'));
            
            $this->UserRoute->create();
            $this->UserRoute->save($user_route_to_be_saved);
            
            $user_route_array = $this->UserRoute->find('first', array(
                'conditions' => array(
                    'user_id' => $user_array['User']['id'],
                    'name' => $this->request->data('UserRoute.name'))
                )
            );
            
            $navPointsObj = json_decode($this->request->data['navPoints']);
            $navPoints = array();
            
            foreach ($navPointsObj as $obj)
            {
                array_push($navPoints, array(
                    'UserRoutePoint' => array_merge(array('route_id' => $user_route_array['UserRoute']['id']), (array)$obj)
                    ));
            }
            
            $this->loadModel('UserRoutePoint');
            $this->UserRoutePoint->create();
            $this->UserRoutePoint->saveMany($navPoints);
            
            $this->set('navPoints', $navPoints);
        }
    }
    
    public function ajaxCheckRouteName()
    {
        
    }
}
