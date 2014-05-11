<?php
App::uses('AppModel', 'Model');
/**
 * RealTimePosition Model
 *
 * @property User $User
 * @property UserRoute $UserRoute
 */
class RealTimePosition extends AppModel {

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
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'UserRoute' => array(
			'className' => 'UserRoute',
			'foreignKey' => 'user_route_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
    
    public function saveRealTimePosition($realTimePosition, $user_id)
    {
        $user_route_id = (int)$realTimePosition['user_route_id'];
        $latitude = (double)$realTimePosition['latitude'];
        $longitude = (double)$realTimePosition['longitude'];
        $heading = (int)$realTimePosition['heading'];

        $created = date('Y-m-d H:i:s');

        $user_route_id_error = ($user_route_id === 0);
        $latitude_error = ($latitude < -90 || $latitude > 90);
        $longitude_error = ($longitude < -180 || $longitude > 180);
        $heading_error = ($heading < 0 || $heading > 360);

        if ($user_route_id_error || $latitude_error || $longitude_error || $heading_error)
        {
            return 1;
        }
        
        if (!$this->UserRoute->isOwnedBy($user_route_id, $user_id))
        {
            return 2;
        }

        $position = array(
            'user_id' => $user_id,
            'user_route_id' => $user_route_id,
            'latitude' => $latitude,
            'longitude' => $longitude,
            'heading' => $heading,
            'created' => $created
            );

        $this->create();
        $saveSuccess = $this->save($position);

        if (!$saveSuccess)
        {
            return 3;
        }

        return 0;
    }
}
