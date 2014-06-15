<?php
/**
 * ViewUserLatestPosPhoneFixture
 *
 */
class ViewUserLatestPosPhoneFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'view_user_latest_pos_phone';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => true, 'default' => '0', 'length' => 10, 'key' => 'primary'),
		'user_id' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
		'user_route_id' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
		'latitude' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'longitude' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'heading' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'route_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'phone_number' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 11, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'time_diff' => array('type' => 'biginteger', 'null' => true, 'default' => null, 'length' => 10),
		'indexes' => array(
			
		),
		'tableParameters' => array()
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'id' => 1,
			'user_id' => 1,
			'user_route_id' => 1,
			'latitude' => 1,
			'longitude' => 1,
			'heading' => 1,
			'created' => '2014-06-15 11:37:19',
			'modified' => '2014-06-15 11:37:19',
			'route_name' => 'Lorem ipsum dolor sit amet',
			'phone_number' => 'Lorem ips',
			'time_diff' => ''
		),
	);

}
