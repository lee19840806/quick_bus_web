<?php
App::uses('UserTriggerPoint', 'Model');

/**
 * UserTriggerPoint Test Case
 *
 */
class UserTriggerPointTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.user_trigger_point',
		'app.user_station_point',
		'app.user_route',
		'app.user',
		'app.group',
		'app.user_route_point',
		'app.phone_number'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->UserTriggerPoint = ClassRegistry::init('UserTriggerPoint');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->UserTriggerPoint);

		parent::tearDown();
	}

}
