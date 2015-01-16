<?php
App::uses('ViewUserLatestPosition', 'Model');

/**
 * ViewUserLatestPosition Test Case
 *
 */
class ViewUserLatestPositionTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.view_user_latest_position'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ViewUserLatestPosition = ClassRegistry::init('ViewUserLatestPosition');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ViewUserLatestPosition);

		parent::tearDown();
	}

}
