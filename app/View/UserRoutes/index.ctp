<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>线路管理，可进行以下操作</strong>
            <ul style="padding-left: 20px">
                <li>编辑线路</li>
                <li>删除线路</li>
                <li>创建一条新的线路</li>
            </ul>
        </div>
        <div><hr/></div>
        <p><a class="btn btn-primary btn-block" href="/UserRoutes/create" role="button">创建一条新的线路</a></p>
    </div>
    <div class="col-md-9" id="showRoutes" style="height: 520px">
        <div>
            <strong>已有的线路列表</strong>
        </div>
        <div><br/></div>
        <div class="table-responsive">
            <table class="table table-hover">
                <tr>
                    <th><?php echo $this->Paginator->sort('name', '路线名称'); ?></th>
                    <th><?php echo $this->Paginator->sort('modified', '上次修改时间'); ?></th>
                    <th><?php echo $this->Paginator->sort('route_point_cnt', '导航点数'); ?></th>
                    <th><?php echo $this->Paginator->sort('station_cnt', '站点数'); ?></th>
                    <th><?php echo $this->Paginator->sort('trigger_cnt', '触发点数'); ?></th>
                    <th>操作</th>
                </tr>
                <?php foreach ($userRoutesSummary as $route): ?>
                <tr>
                    <td><?php echo $route['ViewUserRouteSummary']['name']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['modified']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['route_point_cnt']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['station_cnt']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['trigger_cnt']; ?></td>
                    <td>
                        <?php echo $this->Form->postLink('删除', array('action' => 'delete', $route['ViewUserRouteSummary']['user_route_id']), null,
                            '确定：删除线路 - ' . $route['ViewUserRouteSummary']['name']) ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>
</div>