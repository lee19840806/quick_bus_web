<?php
App::uses('UserRouteTimetable', 'Model');

/**
 * UserRouteTimetable Test Case
 *
 */
class UserRouteTimetableTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.user_route_timetable',
		'app.user_station'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->UserRouteTimetable = ClassRegistry::init('UserRouteTimetable');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->UserRouteTimetable);

		parent::tearDown();
	}

}
