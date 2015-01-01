<?php
/**
 * ViewUserRouteMapFixture
 *
 */
class ViewUserRouteMapFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'user_route_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10),
		'route_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'sequence' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10),
		'latitude' => array('type' => 'float', 'null' => false, 'default' => null, 'length' => '12,8'),
		'longitude' => array('type' => 'float', 'null' => false, 'default' => null, 'length' => '12,8'),
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
			'sequence' => 1,
			'latitude' => 1,
			'longitude' => 1
		),
	);

}
