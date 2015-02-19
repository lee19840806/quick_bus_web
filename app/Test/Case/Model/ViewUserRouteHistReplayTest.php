<?php
App::uses('ViewUserRouteHistReplay', 'Model');

/**
 * ViewUserRouteHistReplay Test Case
 *
 */
class ViewUserRouteHistReplayTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_route_hist_replay'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewUserRouteHistReplay = ClassRegistry::init('ViewUserRouteHistReplay');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserRouteHistReplay);

		parent::tearDown();
	}

}
