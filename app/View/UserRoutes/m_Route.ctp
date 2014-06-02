<div class="row">
    <div class="col-xs-12">
        <strong>选择正在运营的线路</strong>
        <div><hr/></div>
    </div>
    <div class="col-xs-12" id="showRoutes" style="height: 520px">
        <div class="table-responsive">
            <table class="table table-hover">
                <tr>
                    <th><?php echo $this->Paginator->sort('name', '路线名称'); ?></th>
                    <th><?php echo $this->Paginator->sort('name', '操作'); ?></th>
                </tr>
                <?php foreach ($userRoutesSummary as $route): ?>
                <tr>
                    <td><?php echo $route['ViewUserRouteSummary']['name']; ?></td>
                    <td>
                        <?php echo $this->Html->link('选择',
                            array('controller' => 'RealTimePositions', 'action' => 'mobile_gps', $route['ViewUserRouteSummary']['user_route_id'])); ?>
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