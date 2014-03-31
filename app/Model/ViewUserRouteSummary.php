<?php
App::uses('AppModel', 'Model');
/**
 * ViewUserRouteSummary Model
 *
 */
class ViewUserRouteSummary extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'view_user_route_summary';

/**
 * Primary key field
 *
 * @var string
 */
	public $primaryKey = 'user_route_id';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

}
