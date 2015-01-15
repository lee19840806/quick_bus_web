<?php
/**
 * ViewRoutePassedStationFixture
 *
 */
class ViewRoutePassedStationFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'user_route_id' => array('type' => 'integer', 'null' => true, 'default' => '0', 'length' => 10),
		'route_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'station_sequence' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 10),
		'station_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'trigger_time' => array('type' => 'datetime', 'null' => true, 'default' => null),
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
			'user_route_id' => 1,
			'route_name' => 'Lorem ipsum dolor sit amet',
			'station_sequence' => 1,
			'station_name' => 'Lorem ipsum dolor sit amet',
			'trigger_time' => '2015-01-15 19:30:18'
		),
	);

}
