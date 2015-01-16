<?php
App::uses('AppModel', 'Model');
/**
 * ViewUserLatestPosition Model
 *
 */
class ViewUserLatestPosition extends AppModel {

/**
 * Primary key field
 *
 * @var string
 */
	public $primaryKey = 'created';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

}
