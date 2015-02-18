<?php
App::uses('AppModel', 'Model');
/**
 * UserRoute Model
 *
 * @property User $User
 * @property UserRouteImeiMapping $UserRouteImeiMapping
 */
class UserRoute extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'user_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'name' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => array('id', 'username'),
			'order' => ''
		)
	);
    
/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'UserStationPoint' => array(
			'className' => 'UserStationPoint',
			'foreignKey' => 'user_route_id',
			'dependent' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
        'UserRoutePoint' => array(
			'className' => 'UserRoutePoint',
			'foreignKey' => 'user_route_id',
			'dependent' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);
	
	public $hasOne = array(
		'UserRouteImeiMapping' => array(
			'className' => 'UserRouteImeiMapping',
			'foreignKey' => 'user_route_id',
			'dependent' => true
		)
	);
    
    public function saveRoute($route, $userID)
    {
        $routeName = $route['UserRoute']['name'];
        $routePoints = json_decode($route['UserRoute']['navPoints'], true);
        $stationPoints = json_decode($route['UserRoute']['stationPoints'], true);
        $triggerPoints = json_decode($route['UserRoute']['triggerPoints'], true);
        
        $routeAssociateRoutePoints = array(
            'user_id' => $userID,
            'name' => $routeName,
            'UserRoutePoint' => array(),
            'UserStationPoint' => array()
        );
        
        foreach ($routePoints as $routePoint)
        {
            array_push($routeAssociateRoutePoints['UserRoutePoint'], $routePoint);
        }
        
        for ($i = 0; $i < count($stationPoints); $i++)
        {
            $stationPoint = array_merge($stationPoints[$i], array('UserTriggerPoint' => $triggerPoint = $triggerPoints[$i]));
            array_push($routeAssociateRoutePoints['UserStationPoint'], $stationPoint);
        }
        
        if ($this->saveAssociated($routeAssociateRoutePoints, array('deep' => TRUE)))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    
    public function edit($route, $userID)
    {
    	$editedRoute = array(
    		'id' => $route->id,
    		'user_id' => $userID,
    		'name' => $route->name,
    		'UserRoutePoint' => array(),
    		'UserStationPoint' => array()
    	);
    	
    	foreach ($route->routePoints as $routePoint)
    	{
    		$rp = array(
    			'sequence' => $routePoint->sequence,
    			'latitude' => $routePoint->lat,
    			'longitude' => $routePoint->lng
    		);
    		
            array_push($editedRoute['UserRoutePoint'], $rp);
    	}
    	
    	foreach ($route->stationPoints as $stationPoint)
    	{
    		$tp = array(
    			'latitude' => $stationPoint->trigger->lat,
    			'longitude' => $stationPoint->trigger->lng,
    			'heading' => $stationPoint->trigger->heading
    		);
    		
    		$sp = array(
    			'sequence' => $stationPoint->sequence,
    			'name' => $stationPoint->name,
    			'latitude' => $stationPoint->lat,
    			'longitude' => $stationPoint->lng,
    			'UserTriggerPoint' => $tp
    		);
    		
    		array_push($editedRoute['UserStationPoint'], $sp);
    	}
    	
    	$this->delete($route->id, true);
    	
    	if ($this->saveAssociated($editedRoute, array('deep' => TRUE)))
    	{
    		return TRUE;
    	}
    	else
    	{
    		return FALSE;
    	}
    }
    
    public function isOwnedBy($routeID, $userID)
    {
        return $this->field('user_id', array('id' => $routeID, 'user_id' => $userID)) === $userID;
    }
}













