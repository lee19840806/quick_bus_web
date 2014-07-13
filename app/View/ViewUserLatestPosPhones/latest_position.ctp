<div class="row">
    <div class="col-xs-12" style="font-size: 18px">
        <p><?php echo $route_name . '的位置：'; ?></p>
        <p id="positionText"></p>
    </div>
</div>
<div class="row">
    <div class="col-xs-12" id="baidu_map" style="height: 450px">
    </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript">
    var map = new BMap.Map("baidu_map");
    
    //坐标转换完之后的回调函数
    translateCallback = function (point)
    {
        map.clearOverlays();
        map.centerAndZoom(point, 15);
        
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);
        var label = new BMap.Label("最新位置", {offset: new BMap.Size(-18, -23)});
        marker.setLabel(label);
        map.setCenter(point);
    }
    
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
                var baiduQuery = "http://api.map.baidu.com/geocoder/v2/?ak=jENePgN7TufGt711E1uIb7BA&coordtype=wgs84ll&location=" + 
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
                
                var gpsPoint = new BMap.Point(position.ViewUserLatestPosPhone.longitude, position.ViewUserLatestPosPhone.latitude);
                BMap.Convertor.translate(gpsPoint, 0, translateCallback);
//                setTimeout(function() { BMap.Convertor.translate(gpsPoint, 0, translateCallback); }, 500);
            },
            error: function(xhr, status) {
                $("#positionText").html("坐标错误，请稍后再试");
            }
        });
    }
    
    $(document).ready(getLatestPosition);
    setInterval(function(){getLatestPosition();}, 5000);
</script>