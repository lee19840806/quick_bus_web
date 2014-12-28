<?php
App::uses('ViewUserRouteDetail', 'Model');

/**
 * ViewUserRouteDetail Test Case
 *
 */
class ViewUserRouteDetailTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_route_detail'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewUserRouteDetail = ClassRegistry::init('ViewUserRouteDetail');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserRouteDetail);

		parent::tearDown();
	}

}
