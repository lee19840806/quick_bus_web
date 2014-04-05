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
    </div>
    <div class="col-md-9" id="showRoutes" style="height: 520px">
        <div>
            <strong>查看已有的线路，或者</strong>
            <a class="btn btn-primary btn-sm" href="/UserRoutes/create" role="button">创建一条新的线路</a>
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
                    <th><?php echo $this->Paginator->sort('name', '操作'); ?></th>
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
            <div><br/></div>
            <p>
                <?php echo $this->Paginator->counter(array(
                    'format' => __('共 {:pages} 页，目前位于第 {:page} 页，正在显示第 {:start} - {:end} 条记录')));
                ?>
            </p>
            <div class="paging">
                <?php
                    echo $this->Paginator->prev('< ' . __('前一页'), array(), null, array('class' => 'prev disabled'));
                    echo $this->Paginator->numbers(array('separator' => ''));
                    echo $this->Paginator->next(__('后一页') . ' >', array(), null, array('class' => 'next disabled'));
                ?>
            </div>
        </div>
    </div>
</div>