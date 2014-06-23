<div class="row">
    <div class="col-xs-12" style="font-size: 18px">
        <p><?php echo $route_name . '的位置：'; ?></p>
        <p id="positionText"></p>
    </div>
</div>
<div class="row">
    <div class="col-xs-12" id="Leaflet_map" style="height: 450px">
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
                var baiduQuery = "http://api.map.baidu.com/geocoder/v2/?ak=jENePgN7TufGt711E1uIb7BA&location=" + 
                        position.ViewUserLatestPosPhone.latitude.toString() + "," + position.ViewUserLatestPosPhone.longitude.toString() + "&output=json";
                
                $.ajax(
                {
                    url: baiduQuery,
                    type: "GET",
                    timeout: 5000,
                    crossDomain: true,
                    dataType: "jsonp",
                    success: function(baidu_position) { $("#positionText").html(baidu_position.result.formatted_address.toString()); },
                    error: function(xhr, status) { $("#positionText").html("百度位置错误，请稍后再试"); }
                });
            },
            error: function(xhr, status) {
                $("#positionText").html("坐标错误，请稍后再试");
            }
        });
    }
    
    $(document).ready(getLatestPosition);
    setInterval(function(){getLatestPosition();}, 5000);
</script>