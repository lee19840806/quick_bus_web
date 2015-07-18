<div class="row">
    <div class="page-header">
        <h4>Example page header <small>Subtext for header</small></h4>
    </div>
</div>
<div class="row" id="maps_display" style="height: 100%; display: none;">
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript">
    var NumMapsPerScreen = 2;
    var mapHandlers = {};
    
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

    function initialize()
    {
        $.ajax(
        {
            url: "/ViewUserLatestPositions/get_carrefour_buses",
            type: "GET",
            timeout: 15000,
            success: function(result) {
                var numberOfBuses = JSON.parse(result).length;
                var columnClass = "col-xs-" + parseInt(12 / NumMapsPerScreen);
                var numberOfScreens = Math.ceil(numberOfBuses / NumMapsPerScreen);

                for (var i = 0; i < numberOfScreens; i++)
                {
                    screenID = "screen" + (i + 1);
                    var screen = $("<div>").addClass("row").attr("id", screenID).attr("style", "height: 100%; display: none;");

                    for (var j = 0; j < NumMapsPerScreen; j++)
                    {
                        mapID = "map" + ((i * NumMapsPerScreen) + j + 1);
                        var column = $("<div>").addClass(columnClass).attr("style", "height: 100%;");
                        var mapArea = $("<div>").addClass("col-xs-12").attr("id", mapID).attr("style", "height: 100%;");
                        
                        column.append(mapArea);
                        screen.append(column);
                    }

                    $("#maps_display").append(screen);
                }

                $("div[id='screen1']").show();

                for (var i = 0; i < numberOfBuses; i++)
                {
                    mapID = "map" + (i + 1);
                    var baiduMap = new BMap.Map(mapID);
                    mapHandlers[mapID] = baiduMap;

                    mapHandlers[mapID].centerAndZoom(new BMap.Point(116.404, 39.915), 15);
                }
            },
            error: function(xhr, status) {
                $("#positionText").html("坐标错误，请稍后再试");
            }
        });

        $("#maps_display").show();
        //$("#screen1").show();
    }

    $(document).ready(initialize);
</script>
