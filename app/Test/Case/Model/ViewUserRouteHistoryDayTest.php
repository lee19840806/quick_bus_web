<?php
App::uses('ViewUserRouteHistoryDay', 'Model');

/**
 * ViewUserRouteHistoryDay Test Case
 *
 */
class ViewUserRouteHistoryDayTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_route_history_day'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewUserRouteHistoryDay = ClassRegistry::init('ViewUserRouteHistoryDay');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserRouteHistoryDay);

		parent::tearDown();
	}

}
