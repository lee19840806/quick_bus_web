<?php
    echo $this->Html->script('jquery-ui');
    echo $this->Html->script('jquery-ui-sliderAccess');
    echo $this->Html->script('jquery-ui-timepicker-addon');
    echo $this->Html->css('jquery-ui');
    echo $this->Html->css('jquery-ui-timepicker-addon');
    echo $this->fetch('script');
    echo $this->fetch('css');
?>
<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>为路线 “<?php echo $route['UserRoute']['name']; ?>” 设定时刻表</strong>
            <ol style="padding-left: 20px">
                <li>选择每一个工作日</li>
                <li>点击“添加班次”按钮增加一个班次</li>
                <li>为每一个班次的站点添加时刻点</li>
                <li>点击“提交时刻表”按钮保存修改</li>
            </ol>
        </div>
        <form class="col-md-12 form-horizontal" id="form1" action="/UserStationPoints/submit_time_table" method="post">
            <div style="display: none">
                <input type="hidden" name="_method" value="POST"/>
                <input type="hidden" name="data[timeTableJson]" id="hiddenData"/>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary btn-block" id="btnGoToSubmit"><strong>提交时刻表</strong></button>
                <div><hr/></div>
                <a class="btn btn-warning btn-block" href="/UserRoutes/index" role="button"><strong>放弃修改，返回线路管理面板</strong></a>
            </div>
        </form>
    </div>
    <div class="col-md-9" style="height: 520px">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1" class="small">星期一</a></li>
                <li><a href="#tabs-2" class="small">星期二</a></li>
                <li><a href="#tabs-3" class="small">星期三</a></li>
                <li><a href="#tabs-4" class="small">星期四</a></li>
                <li><a href="#tabs-5" class="small">星期五</a></li>
                <li><a href="#tabs-6" class="small">星期六</a></li>
                <li><a href="#tabs-7" class="small">星期日</a></li>
            </ul>
            <?php foreach ($timeTablesMatrix as $key => $weekDay): ?>
                <div id="tabs-<?php echo $key; ?>" class="table-responsive" style="overflow: auto; max-height: 450px;">
                    <?php $weekDaysLookUp = array('1' => '星期一', '2' => '星期二', '3' => '星期三', '4' => '星期四', '5' => '星期五', '6' => '星期六', '7' => '星期日', ); ?>
                    <strong><?php echo $weekDaysLookUp[$key] . "，"; ?></strong>
                    <button type="button" class="btn btn-primary btn-xs" id="btnAdd_<?php echo $key; ?>"><strong>增加一个班次</strong></button>
                    <button type="button" class="btn btn-warning btn-xs" id="btnRemove_<?php echo $key; ?>"><strong>减少一个班次</strong></button>
                    <p></p>
                    <table class="table table-hover table-condensed small" id="table1">
                        <thead>
                            <tr>
                                <th nowrap="nowrap">班次</th>
                                <?php foreach ($stations as $station): ?>
                                <?php echo "<th nowrap=\"nowrap\">" . $station['UserStationPoint']['sequence'] . " - " . $station['UserStationPoint']['name'] . "</th>" ?>
                                <?php endforeach; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($weekDay as $run_key => $run): ?>
                                <?php echo "<tr>"; ?>
                                    <?php echo "<td><strong>" . $run_key . "</strong></td>"; ?>
                                    <?php foreach ($stations as $station): ?>
                                        <?php echo "<td>"; ?>
                                        <?php $value = ''; ?>
                                        <?php if (isset($run[$station['UserStationPoint']['id']])): ?>
                                            <?php $value = $run[$station['UserStationPoint']['id']]['UserRouteTimetable']['planned']; ?>
                                        <?php endif; ?>
                                        <?php $timeID = 'time-d' . $key . '-r' . $run_key . '-s' . $station['UserStationPoint']['id']; ?>
                                        <?php echo $this->Html->tag('input', '', array(
                                            'class' => array('form-control', 'input-sm'),
                                            'id' => $timeID,
                                            'placeholder' => '输入时间',
                                            'value' => substr($value, 0, 5)
                                        )); ?>
                                        <?php echo "</td>"; ?>
                                    <?php endforeach; ?>
                                <?php echo "</tr>"; ?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <script type="text/javascript">
        var stations = $.parseJSON('<?php echo $stationsJSON; ?>');

        $('#tabs input').timepicker();
        $( function() {$("#tabs").tabs();} );

        $("#tabs button[id^='btnAdd_']").click(
        	function() {
            	var weekDay = $(this).attr("id").substr(7, 1);
            	var run = $(this).parent("div[id^='tabs-']").children("table").children("tbody").children("tr").length + 1;

            	var tr = $("<tr></tr>");
            	tr.append("<td><strong>" + run + "</strong></td>");
            	
                for (var i = 0; i < stations.length; i++)
                {
                    var td = $("<td></td>");
                    
                    var input = $("<input>", {
                        "class": "form-control input-sm",
                        placeholder: "输入时间",
                        id: "time-d" + weekDay + "-r" + run + "-s" + stations[i]["UserStationPoint"]["id"],
                        value: ""
                    });

                    td.append(input);
                    tr.append(td);
                }

                $(this).parent("div[id^='tabs-']").children("table").children("tbody").append(tr);
                $('#tabs input').timepicker();
        	}
        );

        $("#tabs button[id^='btnRemove_']").click(
            function() {
            	var trs = $(this).parent("div[id^='tabs-']").children("table").children("tbody").children("tr");
            	$(trs[trs.length - 1]).remove();
            }
        );

        var eventGoToSubmit =
        function(e)
        {
            var submitData = new Object();
            var timeInputCollection = $("div[id^='tabs-']").find("input");

            for (var i = 0; i < timeInputCollection.length; i++)
            {
                var key = $(timeInputCollection[i]).attr("id");
                var time = $.trim($(timeInputCollection[i]).val());

                if (time.length === 5)
                {
                	submitData[key] = time;
                }
            }

            $("#hiddenData").val(JSON.stringify(submitData));
            $("#form1").submit();
        };

        $("#btnGoToSubmit").click(eventGoToSubmit);
    </script>
</div>
