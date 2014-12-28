<?php
/**
 * ViewUserRouteDetailFixture
 *
 */
class ViewUserRouteDetailFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'view_user_route_detail';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'user_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'username' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'user_route_id' => array('type' => 'integer', 'null' => true, 'default' => '0', 'length' => 10),
		'route_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'station_sequence' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
		'station_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'station_lng' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'station_lat' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'trigger_lng' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'trigger_lat' => array('type' => 'float', 'null' => true, 'default' => null, 'length' => '12,8'),
		'trigger_heading' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
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
			'user_id' => 1,
			'username' => 'Lorem ipsum dolor sit amet',
			'user_route_id' => 1,
			'route_name' => 'Lorem ipsum dolor sit amet',
			'station_sequence' => 1,
			'station_name' => 'Lorem ipsum dolor sit amet',
			'station_lng' => 1,
			'station_lat' => 1,
			'trigger_lng' => 1,
			'trigger_lat' => 1,
			'trigger_heading' => 1
		),
	);

}
