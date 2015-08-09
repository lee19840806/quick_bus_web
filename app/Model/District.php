<?php
App::uses('AppModel', 'Model');
/**
 * District Model
 *
 * @property SubCompany $SubCompany
 */
class District extends AppModel {

	//The Associations below have been created with all possible keys, those that are not needed can be removed

    public $hasMany = array(
        'SubCompany' => array(
            'className' => 'SubCompany',
            'foreignKey' => 'district_id',
            'conditions' => '',
            'order' => 'SubCompany.id',
            'limit' => '',
            'dependent' => true
        )
    );
}
