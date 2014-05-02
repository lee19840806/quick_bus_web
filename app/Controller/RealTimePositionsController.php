<?php
App::uses('AppController', 'Controller');
/**
 * RealTimePositions Controller
 *
 * @property RealTimePosition $RealTimePosition
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class RealTimePositionsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

    public function upload()
    {
        if ($this->request->is('post'))
        {
            $returnValue = $this->RealTimePosition->saveRealTimePosition($this->request->data['RealTimePosition'], $this->Auth->user('id'));
            $this->set('returnValue', $returnValue);
        }
        else
        {
            $this->set('returnValue', 99);
        }
        
        $this->render('/RealTimePositions/upload', 'ajax');
    }
    
    public function test_upload()
    {
        
    }
}
