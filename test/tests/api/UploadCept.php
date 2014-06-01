<?php
$I = new ApiGuy($scenario);
$I->wantTo('test the GPS upload API');
$I->amOnPage('/Users/login');
$I->fillField('data[User][username]', 'guest1');
$I->fillField('data[User][password]', 'abc123');
$I->click('LogIn');
$I->see('查看');

$I->sendPOST('RealTimePositions/no_sms', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 29,
    'data[RealTimePosition][latitude]' => 31.14491882, 'data[RealTimePosition][longitude]' => 121.56331525, 'data[RealTimePosition][heading]' => 1));

sleep(4);

$I->sendPOST('RealTimePositions/no_sms', array('data[RealTimePosition][user_id]' => 7, 'data[RealTimePosition][user_route_id]' => 29,
    'data[RealTimePosition][latitude]' => 31.14575380, 'data[RealTimePosition][longitude]' => 121.56335576, 'data[RealTimePosition][heading]' => 359));

