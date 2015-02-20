<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>关联线路与设备IMEI</strong>
            <ol style="padding-left: 20px">
                <li>输入设备IMEI</li>
                <li>点击按钮“提交关联”</li>
                <li>如果IMEI已被使用，请到相关的线路解除关联，然后再关联此线路与IMEI</li>
            </ol>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showStations" style="height: 520px">
        <div>
            <strong><?php echo $route['UserRoute']['name']; ?>，关联此线路与特定的设备IMEI，或者</strong>
            <a class="btn btn-primary btn-sm" href="/UserRoutes/index" role="button">返回线路管理面板</a>
        </div>
        <div><hr/></div>
        <form class="col-md-6 form-inline" id="formIMEI" action="/UserRouteImeiMappings/submit" method="post">
        	<div class="form-group">
	        	<input type="hidden" name="data[UserRouteID]" value="<?php echo $route['UserRoute']['id']; ?>">
	        	</div>
	        	<div class="form-group">
	        	<label for="data[Imei]">设备IMEI号：</label>
	        	<input type="text" id="inputIMEI" class="form-control" name="data[Imei]" placeholder="输入15位IMEI号码"
	        		value="<?php echo $mapping['UserRouteImeiMapping']['imei'] ?>">
            	<button type="button" id="buttonSubmit" class="btn btn-primary">提交关联</button>
            </div>
        </form>
        <?php echo $this->Form->postLink('解除关联', array('action' => 'delete', $route['UserRoute']['id']), 
        	array('role' => 'button', 'class' => 'btn btn-warning'), '确定解除关联？'); ?>
    </div>
    <script type="text/javascript">
		$("#buttonSubmit").click(
			function()
			{
				$("#buttonSubmit").attr("disabled", true);
				
				var imei = $("#inputIMEI").val();

				var regex = new RegExp("^[0-9]{15}$");
				var result = regex.test(imei);

				if (result === false)
				{
					alert("IMEI号码不符合规范，请根据要求修改后再次提交：\n\n1. 15位数字\n2. 不能带有空格\n3. 不能带有其它字符");
					$("#buttonSubmit").attr("disabled", false);
					return;
				}
				
				$.ajax(
		            {
		                url: "/UserRouteImeiMappings/ajaxCheckIMEI",
		                type: "POST",
		                data: {imei: imei},
		                timeout: 10000,
		                success: function(result) {
	                        if ($.parseJSON(result).available === "yes")
	                        {
	                        	$("#formIMEI").submit();
	                        }
	                        else
	                        {
	                            alert("IMEI号码（" + imei + "）已被（" + $.parseJSON(result).route_name + "）使用\n\n请先解除（"
	    	                        + $.parseJSON(result).route_name + "）的IMEI关联");
	                            $("#labelRouteName").fadeOut(function(){$("#labelRouteName").fadeIn();});
	                            $("#inputRouteName").fadeOut(
	                                function(){$("#inputRouteName").fadeIn(
	                                    function(){$("#inputRouteName").focus();
	                                });
	                            });
	                        }
	                    },
	                    error: function(xhr, status) {
	                        alert("无法提交IMEI号码，请稍后再试，或者联系网站管理员");
	                    }
	                }
	            );
			}
		);
    </script>
</div>











