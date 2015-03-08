<?php
/**
 * UserRouteTimetableFixture
 *
 */
class UserRouteTimetableFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'primary'),
		'user_station_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 10, 'key' => 'index'),
		'day_of_week' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 3),
		'run_sequence' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 3),
		'planned' => array('type' => 'time', 'null' => false, 'default' => null),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => null),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1),
			'UK_user_route_timetables_id' => array('column' => 'id', 'unique' => 1),
			'UK_user_route_timetables' => array('column' => array('user_station_id', 'day_of_week', 'run_sequence'), 'unique' => 1)
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
			'day_of_week' => 1,
			'run_sequence' => 1,
			'planned' => '23:08:26',
			'created' => '2015-03-07 23:08:26',
			'modified' => '2015-03-07 23:08:26'
		),
	);

}
