<div class="row">
    <div class="col-xs-12">
        <h4><strong>选择正在运营的线路</strong></h4>
        <br/>
    </div>
    <div class="col-xs-12" id="showRoutes">
        <table class="table" style="font-size: 18px">
            <tr>
                <th><?php echo $this->Paginator->sort('route_name', '路线名称'); ?></th>
                <th><?php echo $this->Paginator->sort('route_name', '操作'); ?></th>
            </tr>
            <?php foreach ($latestPositions as $pos): ?>
            <tr>
                <td><?php echo $pos['ViewUserLatestPosPhone']['route_name']; ?></td>
                <td>
                    <?php echo $this->Html->link('查看位置', array(
                        'controller' => 'ViewUserLatestPosPhones', 
                        'action' => 'latestPosition', 
                        $pos['ViewUserLatestPosPhone']['route_name'],
                        $phone_num)); ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <div><br/></div>
        <p style="font-size: 18px">
            <?php echo $this->Paginator->counter(array(
                'format' => '正在显示第 {:start} - {:end} 条记录'));
            ?>
        </p>
        <div class="paging" style="font-size: 18px">
            <?php
                echo $this->Paginator->prev('< 前一页', array(), null, array('class' => 'prev disabled'));
                echo $this->Paginator->numbers(array('separator' => ''));
                echo $this->Paginator->next('后一页 >', array(), null, array('class' => 'next disabled'));
            ?>
        </div>
    </div>
</div>