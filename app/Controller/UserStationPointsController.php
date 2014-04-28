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
}
