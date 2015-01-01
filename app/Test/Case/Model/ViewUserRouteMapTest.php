<?php
App::uses('ViewUserRouteMap', 'Model');

/**
 * ViewUserRouteMap Test Case
 *
 */
class ViewUserRouteMapTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_route_map'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewUserRouteMap = ClassRegistry::init('ViewUserRouteMap');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserRouteMap);

		parent::tearDown();
	}

}
