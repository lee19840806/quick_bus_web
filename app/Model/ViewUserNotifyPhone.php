<?php
App::uses('AppModel', 'Model');
/**
 * ViewUserNotifyPhone Model
 *
 * @property RealTimePosition $RealTimePosition
 */
class ViewUserNotifyPhone extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'view_user_notify_phone';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'real_time_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
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
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'RealTimePosition' => array(
			'className' => 'RealTimePosition',
			'foreignKey' => 'real_time_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
