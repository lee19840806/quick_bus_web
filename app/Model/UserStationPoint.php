<?php
App::uses('AppModel', 'Model');
/**
 * UserStationPoint Model
 *
 * @property UserRoute $UserRoute
 * @property PhoneNumber $PhoneNumber
 */
class UserStationPoint extends AppModel {

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'user_route_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'sequence' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'latitude' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'longitude' => array(
			'numeric' => array(
				'rule' => array('numeric'),
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
		'UserRoute' => array(
			'className' => 'UserRoute',
			'foreignKey' => 'user_route_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
    
    public $hasOne = array(
        'UserTriggerPoint' => array(
            'className' => 'UserTriggerPoint',
            'foreignKey' => 'user_station_id',
            'dependent' => true
        )
    );
    
	public $hasMany = array(
		'PhoneNumber' => array(
			'className' => 'PhoneNumber',
			'foreignKey' => 'user_station_id',
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
    
    public function isOwnedBy($station_id, $user_id)
    {
        $routeID = $this->field('user_route_id', array('UserStationPoint.id' => $station_id));
        return $this->UserRoute->field('user_id', array('UserRoute.id' => $routeID)) === $user_id;
    }
}
