<?php
App::uses('AppModel', 'Model');
/**
 * PhoneNumber Model
 *
 * @property UserStation $UserStation
 */
class PhoneNumber extends AppModel {

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'phone_numbers' => array(
			'rule1' => array(
				'rule' => array('notEmpty'),
				'message' => '手机号码不能为空',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
            'rule2' => array(
				'rule' => '/^1[3|4|5|8][0-9]\d{4,8}$/',
				'message' => '手机号码不符合正确的格式',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			)
		)
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'UserStationPoint' => array(
			'className' => 'UserStationPoint',
			'foreignKey' => 'user_station_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
