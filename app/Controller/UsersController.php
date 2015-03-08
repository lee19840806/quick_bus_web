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
        $this->Auth->allow('login', 'add', 'client_login', 'mobile_login', 'registered');
        
        //$this->Auth->allow('login', 'register', 'add', 'client_login', 'mobile_login', 'registered');
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
    
    public function client_login()
    {
        if ($this->request->is('post'))
        {
            if ($this->Auth->login())
            {
                $this->Session->write('Users.username', $this->Auth->user('username'));
                
                $routes = $this->User->UserRoute->find('list', array(
                    'fields' => array('UserRoute.id', 'UserRoute.name'),
                    'conditions' => array('user_id' => $this->Auth->user('id'))
                    )
                );
                
                $this->set('is_available', json_encode($routes));
                $this->render('/UserRoutes/ajaxReturn', 'ajax');
            }
            
            $this->Session->setFlash("用户名或密码错误，请输入正确的信息");
        }
    }
    
    public function mobile_login()
    {
        if ($this->request->is('post'))
        {
            if ($this->Auth->login())
            {
                $this->Session->write('Users.username', $this->Auth->user('username'));
                return $this->redirect(array('controller' => 'UserRoutes', 'action' => 'mRoute'));
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
                $userValid = $this->User->validates();

                if ($userValid == TRUE)
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
