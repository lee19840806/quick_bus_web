<div class="row">
    <div class="page-header" style="margin-top: 20px;">
        <h4 class="text-center"><strong>快巴士班车位置查询</strong></h4>
    </div>
</div>
<div class="row" id="maps_display" style="height: 100%;">
</div>
<div class="row" style="display: none">
    <div id="infoArea" class="col-xs-12" style="height: 100%;">
        <div class="col-xs-3">
            <h4 id="title">欢迎光临家乐福万里店</h4>
            <hr>
            <h4><strong>班车状态</strong></h4>
            <ul id="busStatus" class="list-unstyled">
                <li>家乐福万里店1号班车</li>
                <li>正常运营</li>
            </ul>
            <hr>
            <h4><strong>站点信息</strong></h4>
            <ul id="stations" class="list-unstyled">
                <li id="station1"><span class="glyphicon glyphicon-unchecked" aria-hidden="true"></span> 1. 家乐福始发站</li>
                <li id="station2"><span class="glyphicon glyphicon-unchecked" aria-hidden="true"></span> 2. 大华路455弄</li>
            </ul>
            <hr>
            <h4><strong>公告</strong></h4>
            <ul id="announcement" class="list-unstyled">
                <li>家乐福万里店4号班车停运</li>
            </ul>
            <hr>
            <h4><strong>显示下一条线路</strong></h4>
            <div class="progress">
                <div id="progresBar" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
            </div>
            <hr>
            <img src="/img/wanli_qr_code.png" class="img-responsive center-block" alt="Responsive image">
            <h4 class="text-center"><strong>微信扫码，查班车更方便</strong></h4>
        </div>
        <div class="col-xs-9" style="height: 100%;">
            <div id="map" style="height: 100%;"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript">
    var NumMapsPerScreen = 1;
    var screenSwitchInterval = 10000;
    var getGpsInterval = 10000;
    var progressUpdateFrequency = 2000;
    
    var progressValue = 0;
    var mapHandlers = {};
    var numberOfScreens = 0;
    var currentScreen = 0;

    function BaiduMapInitialize(bus, map)
    {
        var convertRoutePoints = "";
        
        for (var i = 0; i < bus["UserRoutePoint"].length; i++)
        {
            convertRoutePoints += bus["UserRoutePoint"][i]["longitude"] + "," + bus["UserRoutePoint"][i]["latitude"] + ";";
        }

        convertRoutePoints = convertRoutePoints.substring(0, convertRoutePoints.length - 1);
        var baiduConvertUrl = "http://api.map.baidu.com/geoconv/v1/?coords=" + convertRoutePoints + "&ak=jENePgN7TufGt711E1uIb7BA";
        
        $.get(
            baiduConvertUrl,
            "",
            function(data) {
                var routePoints = [];
                
                for (var i = 0; i < data.result.length; i++)
                {
                    routePoints.push(new BMap.Point(data.result[i].x, data.result[i].y));
                }

                map.setViewport(routePoints);
                map.addOverlay(new BMap.Polyline(routePoints, {strokeOpacity: 1}));
            },
            "jsonp"
        );

        var convertStationPoints = "";
        
        for (var i = 0; i < bus["UserStationPoint"].length; i++)
        {
            convertStationPoints += bus["UserStationPoint"][i]["longitude"] + "," + bus["UserStationPoint"][i]["latitude"] + ";";
        }

        convertStationPoints = convertStationPoints.substring(0, convertStationPoints.length - 1);
        var baiduConvertUrl = "http://api.map.baidu.com/geoconv/v1/?coords=" + convertStationPoints + "&ak=jENePgN7TufGt711E1uIb7BA";

        $.get(
            baiduConvertUrl,
            "",
            function(data) {
                var stationPoints = [];
                
                for (var i = 0; i < data.result.length; i++)
                {
                    var imgUrl = "";
                    (i == 0) ? imgUrl = "/img/circle.png" : imgUrl = "/img/circle.png";

                    if (i == 0)
                    {
                        var carrefourIcon = new BMap.Icon("/img/carrefour_logo.jpg", new BMap.Size(36, 36));
                        carrefourIcon.setImageSize(new BMap.Size(36, 36));
                        carrefourIcon.setAnchor(new BMap.Size(-8, 18));
                        var carrefourMarker = new BMap.Marker(new BMap.Point(data.result[i].x, data.result[i].y), {icon: carrefourIcon});
                        map.addOverlay(carrefourMarker);
                    }
                    
                    var myIcon = new BMap.Icon(imgUrl, new BMap.Size(12, 12));
                    myIcon.setImageSize(new BMap.Size(12, 12));
                    myIcon.setAnchor(new BMap.Size(6, 6));
                    var label = new BMap.Label(i + 1, {offset: new BMap.Size(0, -24)});
                    var stationMarker = new BMap.Marker(new BMap.Point(data.result[i].x, data.result[i].y), {icon: myIcon});
                    stationMarker.setLabel(label);
                    map.addOverlay(stationMarker);
                }
            },
            "jsonp"
        );

        var styleGoogleLite = [
            {"featureType": "road", "elementType": "all", "stylers": {"lightness": 20}},
            {"featureType": "highway", "elementType": "geometry", "stylers": {"color": "#f49935"}},
            {"featureType": "railway", "elementType": "all", "stylers": {"visibility": "off"}},
            {"featureType": "local", "elementType": "labels", "stylers": {"visibility": "off"}},
            {"featureType": "water", "elementType": "all", "stylers": {"color": "#d1e5ff"}},
            {"featureType": "poi", "elementType": "labels", "stylers": {"visibility": "off"}}
        ];

        map.setMapStyle({styleJson: styleGoogleLite});
    }

    function initialize()
    {
        $.ajax(
        {
            url: "/ViewUserLatestPositions/get_carrefour_buses",
            type: "GET",
            timeout: 15000,
            success: function(result) {
                var buses = JSON.parse(result);
                var numberOfBuses = buses.length;
                var columnClass = "col-xs-" + parseInt(12 / NumMapsPerScreen);
                numberOfScreens = Math.ceil(numberOfBuses / NumMapsPerScreen);
                
                for (var i = 0; i < numberOfScreens; i++)
                {
                    var screenID = "screen" + (i + 1);
                    var screen = $("<div>").addClass("row").attr("id", screenID).attr("style", "height: 100%;");

                    for (var j = 0; j < NumMapsPerScreen; j++)
                    {
                        var column = $("<div>").addClass(columnClass).attr("style", "height: 100%;");
                        
                        if (buses[(i * NumMapsPerScreen) + j] !== undefined)
                        {
                            var infoArea = $("div[id='infoArea']").clone();
                            infoArea.attr("id", "infoArea" + ((i * NumMapsPerScreen) + j + 1));
                            
                            infoArea.find("#title").html("<strong>欢迎光临家乐福万里店</strong>");
                            
                            var busStatus = infoArea.find("#busStatus");
                            busStatus.empty();
                            $("<li>").html(buses[(i * NumMapsPerScreen) + j]["UserRoute"]["name"]).appendTo(busStatus);
                            $("<li>").html(buses[(i * NumMapsPerScreen) + j]["ViewUserLatestPosition"]["run_status"]).appendTo(busStatus);

                            var stations = infoArea.find("#stations");
                            stations.empty();

                            for (var k = 0; k < buses[(i * NumMapsPerScreen) + j]["UserStationPoint"].length; k++)
                            {
                                stationSequence = buses[(i * NumMapsPerScreen) + j]["UserStationPoint"][k]["sequence"];
                                stationName = buses[(i * NumMapsPerScreen) + j]["UserStationPoint"][k]["name"];
                                stationText = " " + stationSequence + ". " + stationName;

                                $("<li>").attr("id", "station" + stationSequence).html(stationText).prepend($("<span>")).find("span")
                                    .addClass("glyphicon glyphicon-unchecked").attr("aria-hidden", "true").end().appendTo(stations);
                            }

                            infoArea.find("#announcement").empty();
                            
                            infoArea.find("#map").attr("id", "map" + ((i * NumMapsPerScreen) + j + 1));

                            var row = $("<div>").addClass("row").attr("style", "height: 100%;");
                            infoArea.children().appendTo(row);
                            row.appendTo(column);
                            column.appendTo(screen);
                        }
                    }

                    $("#maps_display").append(screen);
                }

                for (var i = 0; i < numberOfBuses; i++)
                {
                    var mapID = "map" + (i + 1);
                    mapHandlers[mapID] = new BMap.Map(mapID);
                    //mapHandlers[mapID].disableDoubleClickZoom();

                    BaiduMapInitialize(buses[i], mapHandlers[mapID]);
                }

                setTimeout(function() {setInterval(UpdateProgressBar, progressUpdateFrequency);}, 5000);
            },
            error: function(xhr, status) {
                alert("初始化错误，请重新打开浏览器");
            }
        });
    }

    function UpdateProgressBar()
    {
        $(".progress-bar").each(function(index) {
            $(this).attr("aria-valuenow", Math.floor((progressValue / screenSwitchInterval) * 100))
                .attr("style", "width: " + Math.floor(((progressValue / screenSwitchInterval) * 100)) + "%");
        });
        
        if (progressValue == 0)
        {
            $("div[id^='screen']").hide(0, function() {$("div[id='screen" + (currentScreen + 1) + "']").show(0);});

            currentScreen++;
            currentScreen = (currentScreen % numberOfScreens);
        }

        progressValue += progressUpdateFrequency;
        progressValue = progressValue % (screenSwitchInterval);
    }

    $(document).ready(initialize);
</script>












