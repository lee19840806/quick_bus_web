<?php
App::uses('UserRouteImeiMapping', 'Model');

/**
 * UserRouteImeiMapping Test Case
 *
 */
class UserRouteImeiMappingTest extends CakeTestCase {

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

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->UserRouteImeiMapping = ClassRegistry::init('UserRouteImeiMapping');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->UserRouteImeiMapping);

		parent::tearDown();
	}

}
