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
    
    public $uses = array('UserRoute', 'ViewUserRouteSummary');

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
        $this->Paginator->settings = array('conditions' => array('ViewUserRouteSummary.username' => $this->Auth->user('username')), 'limit' => 10);
		$this->set('userRoutesSummary', $this->Paginator->paginate('ViewUserRouteSummary'));
	}
    
    public function create()
    {
        
    }
    
    public function delete($id = null)
    {
		$this->UserRoute->id = $id;
        
		if (!$this->UserRoute->exists())
        {
			throw new NotFoundException('此线路不存在');
		}
        
		$this->request->onlyAllow('post', 'delete');
        
		if ($this->UserRoute->delete())
        {
			$this->Session->setFlash('线路删除成功');
		}
        else
        {
			$this->Session->setFlash('无法删除线路，请稍后再试');
		}
        
		return $this->redirect(array('action' => 'index'));
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
    
    public function inquiry()
    {
        if ($this->request->is('post'))
        {
            $routes = $this->UserRoute->find('list', array(
                'fields' => array('UserRoute.id', 'UserRoute.name', 'UserRoute.created'),
                'conditions' => array('user_id' => $this->Auth->user('id'))
                )
            );

            $this->set('is_available', json_encode($routes));
            $this->render('/UserRoutes/ajaxReturn', 'ajax');
        }
    }
}
