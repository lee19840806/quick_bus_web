<?php
/**
 * ViewUserRouteHistReplayFixture
 *
 */
class ViewUserRouteHistReplayFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'view_user_route_hist_replay';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'user_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 10),
		'user_route_id' => array('type' => 'integer', 'null' => true, 'default' => '0', 'length' => 10),
		'name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 50, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'replay_day' => array('type' => 'date', 'null' => true, 'default' => null),
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
			'user_route_id' => 1,
			'name' => 'Lorem ipsum dolor sit amet',
			'replay_day' => '2015-02-19'
		),
	);

}
