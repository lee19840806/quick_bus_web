<?php
App::uses('AppModel', 'Model');
/**
 * SubCompany Model
 *
 * @property Company $Company
 * @property District $District
 */
class SubCompany extends AppModel {

	//The Associations below have been created with all possible keys, those that are not needed can be removed

    public $hasMany = array(
        'UserRoute' => array(
            'className' => 'UserRoute',
            'foreignKey' => 'sub_company_id',
            'conditions' => '',
            'order' => 'UserRoute.id',
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
            'order' => 'Company.id'
        ),
        'District' => array(
            'className' => 'District',
            'foreignKey' => 'district_id',
            'conditions' => '',
            'fields' => '',
            'order' => 'District.id'
        )
    );
}
