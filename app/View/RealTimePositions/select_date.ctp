<?php
    echo $this->Html->script('jquery-ui');
    echo $this->Html->script('datepicker-zh-CN');
    echo $this->Html->css('jquery-ui');
    echo $this->fetch('script');
    echo $this->fetch('css');
?>
<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>选择历史轨迹日期</strong>
            <ol style="padding-left: 20px">
                <li>从最近5次运行轨迹中选择</li>
                <li>或者选择一个自定义日期</li>
            </ol>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showStations" style="height: 520px">
        <div>
            <strong><?php echo $history[0]['ViewUserRouteHistoryDay']['name']; ?>，选择要回放的日期，或者</strong>
            <a class="btn btn-primary btn-sm" href="/UserRoutes/index" role="button">返回线路管理面板</a>
        </div>
        <div><hr/></div>
        <form class="col-md-5" id="formReplayDate" action="/RealTimePositions/show_track" method="post">
	        <input type="hidden" name="data[UserRouteID]" value="<?php echo $history[0]['ViewUserRouteHistoryDay']['user_route_id']; ?>">
            <div class="form-group">
                <div class="radio">
                    <label>
                        <input type="radio" name="data[radioNum]" id="radio1" value="option1" checked>最近5次运行日期
                    </label>
                </div>
                <select class="form-control input-sm" name="data[SelectDate]" id="selectDate">
                    <?php foreach ($history as $date): ?>
                        <?php if ($date['ViewUserRouteHistoryDay']['replay_day'] == NULL): ?>
                        <?php echo '<option>最近60天无运行记录，请使用自定义日期</option>'; ?>
                        <?php endif; ?>
                        <?php echo '<option>' . $date['ViewUserRouteHistoryDay']['replay_day'] . '</option>'; ?>
                    <?php endforeach; ?>
                </select>
            </div>
            <div><hr/></div>
            <div class="form-group">
                <div class="radio">
                    <label>
                        <input type="radio" name="data[radioNum]" id="radio2" value="option2">任意日期
                    </label>
                </div>
                <input type="text" class="form-control input-sm" name="data[SelectDate]" id="datepicker" disabled>
            </div>
            <div><hr/></div>
            <div class="form-group">
                <button type="submit" id="buttonSubmit" class="btn btn-primary">回放轨迹</button>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        $(function()
        {
            $("#datepicker").datepicker($.datepicker.regional["zh-CN"]);
            $("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
        });
        
		$("#radio1").click(function () {
		    $("#datepicker").attr("disabled", true);
		    $("#selectDate").attr("disabled", false);
		});

		$("#radio2").click(function () {
		    $("#selectDate").attr("disabled", true);
		    $("#datepicker").attr("disabled", false);
		});
    </script>
</div>











