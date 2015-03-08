<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>线路管理，可进行以下操作</strong>
            <ul style="padding-left: 20px">
                <li>创建一条新的线路</li>
                <li>编辑报站手机号码</li>
                <li>更改站点名称</li>
                <li>更改线路轨迹或站点</li>
                <li>回放线路的历史轨迹</li>
                <li>删除线路</li>
            </ul>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showRoutes">
        <div>
            <p>
                <strong>管理已有的线路，或者</strong>
                <a class="btn btn-primary btn-sm" href="/UserRoutes/create" role="button">创建一条新的线路</a>
                <strong class="text-danger"><?php echo $this->Session->flash(); ?></strong>
            </p>
        </div>
        <div><br/></div>
        <div class="table-responsive">
            <table class="table table-hover table-condensed">
                <tr>
                    <th><?php echo $this->Paginator->sort('name', '路线名称'); ?></th>
                    <th><?php echo $this->Paginator->sort('modified', '上次修改时间'); ?></th>
                    <th><?php echo $this->Paginator->sort('route_point_cnt', '导航点数'); ?></th>
                    <th><?php echo $this->Paginator->sort('station_cnt', '站点数'); ?></th>
                    <th><?php echo $this->Paginator->sort('user_route_id', '线路管理'); ?></th>
                </tr>
                <?php foreach ($userRoutesSummary as $route): ?>
                <tr>
                    <td><?php echo $route['ViewUserRouteSummary']['name']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['modified']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['route_point_cnt']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['station_cnt']; ?></td>
                    <td>
                        <?php echo $this->Html->link('编辑手机号',
                            array('controller' => 'UserStationPoints', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                        <?php echo $this->Html->link('改站名',
                            array('controller' => 'UserStationPoints', 'action' => 'edit_station', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                        <?php echo $this->Html->link('改线路',
                            array('controller' => 'UserRoutes', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                        <?php echo $this->Html->link('时刻表',
                            array('controller' => 'UserStationPoints', 'action' => 'edit_time_table', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                        <p></p>
                        <?php if($group_id == 3) {echo $this->Html->link('关联或解除IMEI',
                            array('controller' => 'UserRouteImeiMappings', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-primary btn-xs'));} ?>
                        <?php echo $this->Html->link('看轨迹',
                            array('controller' => 'RealTimePositions', 'action' => 'select_date', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-success btn-xs')); ?>
                        <?php echo $this->Form->postLink('删除', array('action' => 'delete', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-warning btn-xs'), '确定：删除线路 - ' . $route['ViewUserRouteSummary']['name']) ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </table>
            <div><br/></div>
            <p>
                <?php echo $this->Paginator->counter(array(
                    'format' => '共 {:pages} 页，目前位于第 {:page} 页，正在显示第 {:start} - {:end} 条记录'));
                ?>
            </p>
            <div class="paging">
                <?php
                    echo $this->Paginator->prev('< 前一页', array(), null, array('class' => 'prev disabled'));
                    echo $this->Paginator->numbers(array('separator' => ''));
                    echo $this->Paginator->next('后一页 >', array(), null, array('class' => 'next disabled'));
                ?>
            </div>
        </div>
    </div>
</div>