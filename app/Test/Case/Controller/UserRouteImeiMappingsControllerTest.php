<?php
App::uses('UserRouteImeiMappingsController', 'Controller');

/**
 * UserRouteImeiMappingsController Test Case
 *
 */
class UserRouteImeiMappingsControllerTest extends ControllerTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.user_route_imei_mapping',
		'app.user_route',
		'app.user',
		'app.group',
		'app.user_station_point',
		'app.user_trigger_point',
		'app.phone_number',
		'app.user_route_point'
	);

}
