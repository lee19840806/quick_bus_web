<?php
App::uses('AppModel', 'Model');
/**
 * RealTimePosition Model
 *
 * @property User $User
 * @property UserRoute $UserRoute
 * @property ViewUserNotifyPhone $ViewUserNotifyPhone
 * @property UserNotifyPhoneHistory $UserNotifyPhoneHistory
 */
class RealTimePosition extends AppModel {

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'user_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'user_route_id' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'latitude' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'longitude' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'UserRoute' => array(
			'className' => 'UserRoute',
			'foreignKey' => 'user_route_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
    
/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'ViewUserNotifyPhone' => array(
			'className' => 'ViewUserNotifyPhone',
			'foreignKey' => 'real_time_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
        'UserNotifyPhoneHistory' => array(
			'className' => 'UserNotifyPhoneHistory',
			'foreignKey' => 'real_time_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);
    
    public function saveRealTimePosition($realTimePosition, $user_id)
    {
        $user_route_id = (int)$realTimePosition['user_route_id'];
        $latitude = (double)$realTimePosition['latitude'];
        $longitude = (double)$realTimePosition['longitude'];
        $heading = (int)$realTimePosition['heading'];

        $created = date('Y-m-d H:i:s');

        $user_route_id_error = ($user_route_id === 0);
        $latitude_error = ($latitude < -90 || $latitude > 90);
        $longitude_error = ($longitude < -180 || $longitude > 180);
        $heading_error = ($heading < 0 || $heading > 360);

        if ($user_route_id_error || $latitude_error || $longitude_error || $heading_error)
        {
            return 1;
        }
        
        if (!$this->UserRoute->isOwnedBy($user_route_id, $user_id))
        {
            return 2;
        }

        $position = array(
            'user_id' => $user_id,
            'user_route_id' => $user_route_id,
            'latitude' => $latitude,
            'longitude' => $longitude,
            'heading' => $heading,
            'created' => $created
            );

        $this->create();
        $saveSuccess = $this->save($position);

        if (!$saveSuccess)
        {
            return 3;
        }

        return 0;
    }
    
    private function socketPost($url, $query)
    {
        $info = parse_url($url);
        $fp = fsockopen($info["host"], 80, $errno, $errstr, 30);
        $head = "POST " . $info['path'] . " HTTP/1.0\r\n";
        $head .= "Host: " . $info['host'] . "\r\n";
        $head .= "Referer: http://" . $info['host'] . $info['path'] . "\r\n";
        $head .= "Content-type: application/x-www-form-urlencoded\r\n";
        $head .= "Content-Length: " . strlen(trim($query)) . "\r\n";
        $head .= "\r\n";
        $head .= trim($query);
        $write = fputs($fp, $head);
        $header = "";
        
        while ($str = trim(fgets($fp, 4096)))
        {
            $header .= $str;
        }
        
        $data = "";
        
        while (!feof($fp))
        {
            $data .= fgets($fp, 4096);
        }
        
        return $data;
    }
    
    public function sendTemplateSMS($apikey, $tpl_id, $tpl_value, $mobile)
    {
        $url = "http://yunpian.com/v1/sms/tpl_send.json";
        $encoded_tpl_value = urlencode("$tpl_value");
        $post_string = "apikey=$apikey&tpl_id=$tpl_id&tpl_value=$encoded_tpl_value&mobile=$mobile";
        return socketPost($url, $post_string);
    }
    
    public function sendCustomizedSMS($apikey, $text, $mobile)
    {
        $url = "http://yunpian.com/v1/sms/send.json";
        $post_string = "apikey=$apikey&text=$text&mobile=$mobile";
        return socketPost($url, $post_string);
    }
}
