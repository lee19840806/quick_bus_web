<?php
App::uses('AppModel', 'Model');
/**
 * Company Model
 *
 * @property SubCompany $SubCompany
 */
class Company extends AppModel {

	//The Associations below have been created with all possible keys, those that are not needed can be removed

    public $hasMany = array(
        'SubCompany' => array(
            'className' => 'SubCompany',
            'foreignKey' => 'company_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );
}
