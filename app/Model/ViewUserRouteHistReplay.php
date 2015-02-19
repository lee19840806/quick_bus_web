<?php
App::uses('AppModel', 'Model');
/**
 * ViewUserRouteHistReplay Model
 *
 */
class ViewUserRouteHistReplay extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'view_user_route_hist_replay';

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
