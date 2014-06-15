<?php
App::uses('ViewUserLatestPosPhone', 'Model');

/**
 * ViewUserLatestPosPhone Test Case
 *
 */
class ViewUserLatestPosPhoneTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_latest_pos_phone',
		'app.user',
		'app.group',
		'app.user_route',
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
		$this->ViewUserLatestPosPhone = ClassRegistry::init('ViewUserLatestPosPhone');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserLatestPosPhone);

		parent::tearDown();
	}

}
