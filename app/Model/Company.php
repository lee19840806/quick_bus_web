<?php
App::uses('AppModel', 'Model');
/**
 * Company Model
 *
 * @property SubCompany $SubCompany
 */
class Company extends AppModel {
    
    public $primaryKey = 'id';
    
    public $validate = array(
        'id' => array(
            'rule' => 'numeric'
        )
    );

	//The Associations below have been created with all possible keys, those that are not needed can be removed

    public $hasMany = array(
        'SubCompany' => array(
            'className' => 'SubCompany',
            'foreignKey' => 'company_id',
            'conditions' => '',
            'order' => 'SubCompany.id',
            'limit' => '',
            'dependent' => true
        )
    );
}
