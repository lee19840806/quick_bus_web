<div class="row">
    <div class="col-xs-12" style="font-size: 18px">
        <p><?php echo $route_name . '的位置：'; ?></p>
        <p id="positionText"></p>
    </div>
</div>
<div class="row">
    <div class="col-xs-12" id="Leaflet_map" style="height: 520px">
    </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<script type="text/javascript">
    function getLatestPosition()
    {
        $.ajax(
        {
            url: "/ViewUserLatestPosPhones/latestPositionInquiry",
            type: "POST",
            data: {route_name: "<?php echo $route_name ?>", phone_num: <?php echo $phone_num ?>},
            timeout: 5000,
            success: function(result) {
                var position = $.parseJSON(result);
                $("#positionText").html(position.ViewUserLatestPosPhone.latitude);
            },
            error: function(xhr, status) {
                alert("无法提交线路，请稍后再试");
            },
            complete: function()
            {
                $("#btnGoToSecondStep").attr("disabled", false);
            }
        });
    }
    
    $(document).ready(getLatestPosition);
    setInterval(function(){getLatestPosition();}, 5000);
</script>