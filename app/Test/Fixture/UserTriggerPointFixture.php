<?php
/**
 * UserTriggerPointFixture
 *
 */
class UserTriggerPointFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'primary'),
		'user_station_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'index'),
		'latitude' => array('type' => 'float', 'null' => false, 'default' => null, 'length' => '12,8'),
		'longitude' => array('type' => 'float', 'null' => false, 'default' => null, 'length' => '12,8'),
		'heading' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1),
			'UK_user_trigger_points_id' => array('column' => 'id', 'unique' => 1),
			'FK_user_trigger_points_user_station_points_id' => array('column' => 'user_station_id', 'unique' => 0)
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
			'user_station_id' => 1,
			'latitude' => 1,
			'longitude' => 1,
			'heading' => 1
		),
	);

}
