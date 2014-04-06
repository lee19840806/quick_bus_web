<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class UsersController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
    
    public function beforeFilter()
    {
        parent::beforeFilter();
        $this->Auth->allow('login', 'register', 'add');
    }

/**
 * index method
 *
 * @return void
 */
//	public function index() {
//		$this->User->recursive = 0;
//		$this->set('users', $this->Paginator->paginate());
//	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
//	public function view($id = null) {
//		if (!$this->User->exists($id)) {
//			throw new NotFoundException(__('Invalid user'));
//		}
//		$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
//		$this->set('user', $this->User->find('first', $options));
//	}

/**
 * add method
 *
 * @return void
 */
//	public function add() {
//		if ($this->request->is('post')) {
//			$this->User->create();
//			if ($this->User->save($this->request->data)) {
//				$this->Session->setFlash(__('The user has been saved.'));
//				return $this->redirect(array('action' => 'index'));
//			} else {
//				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
//			}
//		}
//		$groups = $this->User->Group->find('list');
//		$this->set(compact('groups'));
//	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
//	public function edit($id = null) {
//		if (!$this->User->exists($id)) {
//			throw new NotFoundException(__('Invalid user'));
//		}
//		if ($this->request->is(array('post', 'put'))) {
//			if ($this->User->save($this->request->data)) {
//				$this->Session->setFlash(__('The user has been saved.'));
//				return $this->redirect(array('action' => 'index'));
//			} else {
//				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
//			}
//		} else {
//			$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
//			$this->request->data = $this->User->find('first', $options);
//		}
//		$groups = $this->User->Group->find('list');
//		$this->set(compact('groups'));
//	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
//	public function delete($id = null) {
//		$this->User->id = $id;
//		if (!$this->User->exists()) {
//			throw new NotFoundException(__('Invalid user'));
//		}
//		$this->request->onlyAllow('post', 'delete');
//		if ($this->User->delete()) {
//			$this->Session->setFlash(__('The user has been deleted.'));
//		} else {
//			$this->Session->setFlash(__('The user could not be deleted. Please, try again.'));
//		}
//		return $this->redirect(array('action' => 'index'));
//	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->User->recursive = 0;
		$this->set('users', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->User->exists($id)) {
			throw new NotFoundException(__('Invalid user'));
		}
		$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
		$this->set('user', $this->User->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		}
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->User->exists($id)) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
			$this->request->data = $this->User->find('first', $options);
		}
		$groups = $this->User->Group->find('list');
		$this->set(compact('groups'));
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ($this->User->delete()) {
			$this->Session->setFlash(__('The user has been deleted.'));
		} else {
			$this->Session->setFlash(__('The user could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
    
    public function login()
    {
        if ($this->request->is('post'))
        {
            if ($this->Auth->login())
            {
                $this->Session->write('Users.username', $this->Auth->user('username'));
                return $this->redirect($this->Auth->redirectUrl());
            }
            
            $this->Session->setFlash("用户名或密码错误，请输入正确的信息");
        }
    }
    
    public function logout()
    {
        $this->Session->destroy();
        $this->redirect($this->Auth->logout());
    }
    
    public function register()
    {

    }
    
    public function add()
    {
        if ($this->request->is('post'))
        {
            if ($this->request->data['User']['password'] === $this->request->data['User']['passwordConfirm'])
            {
                $userToBeSaved = array(
                    'username' => $this->request->data['User']['username'],
                    'password' => $this->request->data['User']['password'],
                    'group_id' => 2
                );
                $this->User->set($userToBeSaved);

                if ($this->User->validates())
                {
                    $this->User->create();
                    if ($this->User->save($userToBeSaved))
                    {
                        return $this->redirect(array('action' => 'registered'));
                    } else {
                        $this->Session->setFlash('无法注册账号，请稍后再重新注册');
                    }
                }
                else
                {
                    $firstError = array_values($this->User->validationErrors);
                    $this->Session->setFlash($firstError[0][0] . '，请重新注册');
                    return $this->redirect(array('action' => 'register'));
                }
            }
            else
            {
                $this->Session->setFlash('确保两次输入的密码是一样的，请重新注册');
                return $this->redirect(array('action' => 'register'));
            }
        }
    }
    
    public function registered()
    {

    }
}
