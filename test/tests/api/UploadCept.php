<?php
$I = new ApiGuy($scenario);
$I->wantTo('test the GPS upload API');
$I->amOnPage('/Users/login');
$I->fillField('data[User][username]', 'guest1');
$I->fillField('data[User][password]', 'abc123');
$I->click('LogIn');
$I->see('查看');

$I->sendPOST('RealTimePositions', array(
    'data[RealTimePosition][user_id]' => 7,
    'data[RealTimePosition][user_route_id]' => 17,
    'data[RealTimePosition][latitude]' => 9,
    'data[RealTimePosition][longitude]' => 10,
    'data[RealTimePosition][heading]' => 285));

sleep(5);

$I->sendPOST('RealTimePositions', array(
    'data[RealTimePosition][user_id]' => 7,
    'data[RealTimePosition][user_route_id]' => 17,
    'data[RealTimePosition][latitude]' => 9,
    'data[RealTimePosition][longitude]' => 11,
    'data[RealTimePosition][heading]' => 285));

$I->see('0');