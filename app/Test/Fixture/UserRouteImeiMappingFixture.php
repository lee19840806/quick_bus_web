<?php
/**
 * UserRouteImeiMappingFixture
 *
 */
class UserRouteImeiMappingFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'primary'),
		'user_route_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'index'),
		'imei' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 15, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1),
			'UK_user_route_imei_mappings_id' => array('column' => 'id', 'unique' => 1),
			'FK_user_route_imei_mappings_user_routes_id' => array('column' => 'user_route_id', 'unique' => 0)
		),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_general_ci', 'engine' => 'InnoDB')
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'id' => 1,
			'user_route_id' => 1,
			'imei' => 'Lorem ipsum d',
			'created' => '2015-02-17 18:03:45',
			'modified' => '2015-02-17 18:03:45'
		),
	);

}
