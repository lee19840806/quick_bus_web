<?php
$I = new ApiGuy($scenario);
$I->wantTo('test the GPS upload API');
$I->amOnPage('/Users/login');
$I->fillField('data[User][username]', 'guest1');
$I->fillField('data[User][password]', 'abc123');
$I->click('LogIn');
$I->see('查看');

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28,
    'data[RealTimePosition][latitude]' => 31.21889, 'data[RealTimePosition][longitude]' => 121.54458, 'data[RealTimePosition][heading]' => 201));

sleep(4);

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28,
    'data[RealTimePosition][latitude]' => 31.20889, 'data[RealTimePosition][longitude]' => 121.53549, 'data[RealTimePosition][heading]' => 201));
/*
sleep(5);

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28,
    'data[RealTimePosition][latitude]' => 31.19967, 'data[RealTimePosition][longitude]' => 121.53364, 'data[RealTimePosition][heading]' => 180));

sleep(5);

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28,
    'data[RealTimePosition][latitude]' => 31.19959, 'data[RealTimePosition][longitude]' => 121.53364, 'data[RealTimePosition][heading]' => 179));

sleep(5);

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28, 
    'data[RealTimePosition][latitude]' => 31.19931, 'data[RealTimePosition][longitude]' => 121.53365, 'data[RealTimePosition][heading]' => 168));

sleep(5);

$I->sendPOST('RealTimePositions', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 28,
    'data[RealTimePosition][latitude]' => 31.19511, 'data[RealTimePosition][longitude]' => 121.53459, 'data[RealTimePosition][heading]' => 168));
*/
$I->see('0');
