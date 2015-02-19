<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>历史轨迹回放</strong>
            <ul style="padding-left: 20px">
                <li>回放已有线路的运行轨迹</li>
                <li>选择60天内最近5次的运行</li>
                <li>或者自定义选择任意日期</li>
            </ul>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showRoutes">
        <div>
            <p>
                <strong>选择一个运行轨迹，或者</strong>
                <a class="btn btn-primary btn-sm" href="/UserRoutes/index" role="button">返回线路管理面板</a>
                <strong class="text-danger"><?php echo $this->Session->flash(); ?></strong>
            </p>
        </div>
        <div><br/></div>
        <div class="table-responsive">
            <table class="table table-hover">
                <tr>
                    <th><?php echo $this->Paginator->sort('user_route_id', '路线ID'); ?></th>
                    <th><?php echo $this->Paginator->sort('name', '路线名称'); ?></th>
                    <th><?php echo $this->Paginator->sort('user_route_id', '最近5次运行'); ?></th>
                    <th><?php echo $this->Paginator->sort('user_route_id', '自定义日期'); ?></th>
                    <th><?php echo $this->Paginator->sort('user_route_id', '回放轨迹'); ?></th>
                </tr>
                <?php foreach ($userRoutesSummary as $route): ?>
                <tr>
                    <td><?php echo $route['ViewUserRouteSummary']['user_route_id']; ?></td>
                    <td><?php echo $route['ViewUserRouteSummary']['name']; ?></td>
                    <td>
                        <div class="radio-inline">
                            <label>
                            <input type="radio" name="radios<?php echo $route['ViewUserRouteSummary']['user_route_id']; ?>" id="radio1" value="option1" checked>
                            <?php echo $this->Html->link('编辑手机号',
                                array('controller' => 'UserStationPoints', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                                array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="radio-inline">
                            <label>
                            <input type="radio" name="radios<?php echo $route['ViewUserRouteSummary']['user_route_id']; ?>" id="radio1" value="option1">
                            <?php echo $this->Html->link('编辑手机号',
                                array('controller' => 'UserStationPoints', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                                array('role' => 'button', 'class' => 'btn btn-primary btn-xs')); ?>
                            </label>
                        </div>
                    </td>
                    <td>
                        <?php echo $this->Html->link('选定此日期',
                            array('controller' => 'UserStationPoints', 'action' => 'edit', $route['ViewUserRouteSummary']['user_route_id']),
                            array('role' => 'button', 'class' => 'btn btn-warning btn-xs')); ?>
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