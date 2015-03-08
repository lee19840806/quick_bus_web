<?php
App::uses('AppController', 'Controller');
/**
 * UserStationPoints Controller
 *
 * @property UserStationPoint $UserStationPoint
 * @property PhoneNumber $PhoneNumber
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class UserStationPointsController extends AppController {
    
    public $uses = array('UserStationPoint', 'PhoneNumber');

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
            
            $phoneNumberArray = array();
            
            foreach ($route['UserStationPoint'] as $station)
            {
                $phoneNumbers = $this->PhoneNumber->find('list', array(
                    'fields' => array('PhoneNumber.phone_number'),
                    'conditions' => array('PhoneNumber.user_station_id' => $station['id'])));
                $phoneNumbersString = implode(', ', $phoneNumbers);
                array_push($phoneNumberArray, $phoneNumbersString);
                
                unset($station);
            }
            
            $this->set('phoneNumberArray', $phoneNumberArray);
        }
	}
    
    public function submit()
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
                
                $phoneNumbersRemovedSpace = rtrim(str_replace(' ', '', $stationPhone['phoneNumbers']), ',');
                
                $phoneNumbers = array();
                
                if (strlen($phoneNumbersRemovedSpace) > 1)
                {
                    $phoneNumbers = str_getcsv(str_replace('，', ',', $phoneNumbersRemovedSpace));
                }
                
                foreach ($phoneNumbers as $phoneNumber)
                {
                    $numberToBeSaved = array('user_station_id' => $stationPhone['stationID'], 'phone_number' => $phoneNumber);
                    $this->UserStationPoint->PhoneNumber->set($numberToBeSaved);
                    
                    if (!$this->UserStationPoint->PhoneNumber->validates())
                    {
                        $firstError = array_values($this->UserStationPoint->PhoneNumber->validationErrors);
                        $this->Session->setFlash($firstError[0][0] . '，请重新填写手机号码');
                        $this->redirect(array('action' => 'edit', $this->UserStationPoint->field('user_route_id', array('id' => $stationPhone['stationID']))));
                    }
                }
                
                $this->UserStationPoint->PhoneNumber->deleteAll(array('PhoneNumber.user_station_id' => $stationPhone['stationID']));
                
                foreach ($phoneNumbers as $phoneNumber)
                {
                    $numberToBeSaved = array('user_station_id' => $stationPhone['stationID'], 'phone_number' => $phoneNumber);
                    $this->UserStationPoint->PhoneNumber->create();
                    
                    if (!$this->UserStationPoint->PhoneNumber->save($numberToBeSaved))
                    {
                        $this->Session->setFlash('保存手机号码出错，请稍后再试');
                        $this->redirect(array('action' => 'edit', $this->UserStationPoint->field('user_route_id', array('id' => $stationPhone['stationID']))));
                    }
                }
            }
        }
    }
    
    public function edit_station($id = NULL)
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
    
    public function submit_station()
    {
    	if ($this->request->is('post'))
    	{
    		$stationNewNames = $this->request->data['stationInfo'];
    		
    		foreach ($stationNewNames as $newName)
    		{
    			if (!$this->UserStationPoint->isOwnedBy($newName['stationID'], $this->Auth->user('id')))
    			{
    				$this->Session->setFlash('站点归属权有误，请重选一条线路进行编辑');
    				$this->redirect(array('controller' => 'UserRoutes', 'action' => 'index'));
    			}
    		}
    		
    		foreach ($stationNewNames as $newName)
    		{
    			$stationToBeUpdated = array('id' => $newName['stationID'], 'name' => $newName['stationNewName']);
    			$this->UserStationPoint->save($stationToBeUpdated);
    		}
    	}
    }
    
    public function edit_time_table($id = NULL)
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
        
        $stations = $this->UserStationPoint->find('all', array(
            'conditions' => array('UserRoute.id' => $id),
            'fields' => array('UserStationPoint.id', 'UserStationPoint.sequence', 'UserStationPoint.name'),
            'order' => array('UserStationPoint.sequence'),
            'recursive' => 0
        ));
        $station_IDs = array();
        
        foreach ($stations as $station)
        {
            array_push($station_IDs, $station['UserStationPoint']['id']);
            unset($station);
        }
        
        $stationsWithAssociates = $this->UserStationPoint->find('all', array(
            'conditions' => array('UserStationPoint.id' => $station_IDs),
            'fields' => array(
                'UserStationPoint.id',
                'UserStationPoint.sequence',
                'UserStationPoint.name'
            ),
            'order' => array('UserStationPoint.sequence')
        ));
        
        $timeTablesMatrix = array(
            '1' => array(),
            '2' => array(),
            '3' => array(),
            '4' => array(),
            '5' => array(),
            '6' => array(),
            '7' => array()
        );
        
        $timeTables = $this->UserStationPoint->UserRouteTimetable->find('all', array(
            'conditions' => array('UserRouteTimetable.user_station_id' => $station_IDs),
            'fields' => array('UserRouteTimetable.id', 'UserRouteTimetable.user_station_id', 'UserRouteTimetable.day_of_week',
                'UserRouteTimetable.run_sequence', 'UserRouteTimetable.planned'),
            'order' => array('UserRouteTimetable.day_of_week', 'UserRouteTimetable.run_sequence', 'UserRouteTimetable.planned'),
            'recursive' => -1
        ));
        
        foreach ($timeTables as $time)
        {
            $timeTablesMatrix[$time['UserRouteTimetable']['day_of_week']][$time['UserRouteTimetable']['run_sequence']][$time['UserRouteTimetable']['user_station_id']] = $time;
        }
        
        $route = $this->UserStationPoint->UserRoute->find('first', array('conditions' => array('UserRoute.id' => $id)));
        
        $this->set('route', $route);
        $this->set('stations', $stations);
        $this->set('stationsJSON', json_encode($stations));
        $this->set('timeTablesMatrix', $timeTablesMatrix);
    }
}
