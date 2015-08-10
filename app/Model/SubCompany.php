<?php
App::uses('AppModel', 'Model');
/**
 * SubCompany Model
 *
 * @property Company $Company
 * @property District $District
 * @property UserRoute $UserRoute
 */
class SubCompany extends AppModel {

	//The Associations below have been created with all possible keys, those that are not needed can be removed

    public $hasMany = array(
        'UserRoute' => array(
            'className' => 'UserRoute',
            'foreignKey' => 'sub_company_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );
    
    public $belongsTo = array(
        'Company' => array(
            'className' => 'Company',
            'foreignKey' => 'company_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'District' => array(
            'className' => 'District',
            'foreignKey' => 'district_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        )
    );
    
    public function getNearbySubCompanies($companyName = NULL, $latitude = NULL, $longitude = NULL, $distance = NULL)
    {
        $subCompanies = $this->find('all', array(
            'conditions' => array('Company.name' => $companyName),
            'fields' => array('SubCompany.id', 'SubCompany.name', 'SubCompany.created', 'Company.name', 'District.city', 'District.district'),
            'recursive' => 1
        ));
        
        $routeIDs = array();
         
        foreach ($subCompanies as $subCompany)
        {
            foreach ($subCompany['UserRoute'] as $userRoute)
            {
                array_push($routeIDs, $userRoute['id']);
            }
        }
        
        $routes = $this->UserRoute->find('all', array(
            'conditions' => array('UserRoute.id' => $routeIDs),
            'fields' => array('UserRoute.id', 'UserRoute.sub_company_id', 'UserRoute.name', 'SubCompany.id', 'SubCompany.company_id',
                'SubCompany.district_id', 'SubCompany.name'),
            'recursive' => 1
        ));
        
        $nearbySubCompanies = array();
        
        foreach ($routes as $route)
        {
            foreach ($route['UserStationPoint'] as $station)
            {
                if ('1' == $station['sequence'])
                {
                    $d = $this->gpsDistance($station['latitude'], $station['longitude'], $latitude, $longitude, false);
                    
                    if ($d <= $distance)
                    {
                        array_push($nearbySubCompanies, array_merge($route['SubCompany'], array('distance' => round($d, 2))));
                    }
                }
            }
        }
        
        return $nearbySubCompanies;
    }
    
    private function gpsDistance($lat1, $lng1, $lat2, $lng2, $miles = FALSE)
    {
        $pi80 = M_PI / 180;
        $lat1 *= $pi80;
        $lng1 *= $pi80;
        $lat2 *= $pi80;
        $lng2 *= $pi80;
        $r = 6372.797; // mean radius of Earth in km
        $dlat = $lat2 - $lat1;
        $dlng = $lng2 - $lng1;
        $a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        $km = $r * $c;
        return ($miles ? ($km * 0.621371192) : $km);
    }
}
















