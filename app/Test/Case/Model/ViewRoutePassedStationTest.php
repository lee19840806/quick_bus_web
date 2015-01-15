<?php
App::uses('ViewRoutePassedStation', 'Model');

/**
 * ViewRoutePassedStation Test Case
 *
 */
class ViewRoutePassedStationTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_route_passed_station'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewRoutePassedStation = ClassRegistry::init('ViewRoutePassedStation');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewRoutePassedStation);

		parent::tearDown();
	}

}
