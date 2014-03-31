<?php
App::uses('AppController', 'Controller');
/**
 * UserRoutes Controller
 *
 * @property UserRoute $UserRoute
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class UserRoutesController extends AppController {

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
		$users = $this->UserRoute->User->find('list');
		$this->set(compact('users'));
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
		$users = $this->UserRoute->User->find('list');
		$this->set(compact('users'));
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
    
    public function create()
    {
        
    }
    
    public function ajaxCheckRouteName()
    {
        if ($this->request->is('ajax'))
        {
            $findResult = $this->UserRoute->find('first', array(
                'conditions' => array(
                    'user_id' => $this->Auth->user('id'),
                    'name' => $this->request->data('routeName')
                    )
                )
            );
            
            if (count($findResult) == 0)
            {
                $this->set('is_available', 'yes');
            }
            else
            {
                $this->set('is_available', 'no');
            }

            $this->render('/UserRoutes/ajaxReturn', 'ajax');
        }
    }
    
    public function submit()
    {
        if ($this->request->is('post'))
        {
            $this->UserRoute->saveRoute($this->request->data, $this->Auth->user('id'));
        }
        else
        {
            $this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
        }
    }
}
