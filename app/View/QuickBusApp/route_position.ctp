<div data-role="header" data-position="fixed">
    <a href="http://www.lishicheng.net/QuickBusApp/store_select" rel="external" class="ui-btn-left ui-btn ui-btn-inline ui-mini ui-corner-all ui-btn-icon-left ui-icon-back">Back</a>
    <h1><?php echo $routeName; ?></h1>
</div>

<div data-role="tabs">
    <div data-role="navbar">
        <ul>
            <li><a href="#map_tab" data-icon="navigation" class="ui-btn-active">详细地图</a></li>
            <li><a href="#station_tab" data-icon="star">站点示意图</a></li>
        </ul>
    </div>
    
    <div id="map_tab" class="ui-content">
        <div id="map" style="height: 300px;"></div>
    </div>
    
    <div id="station_tab" class="ui-content">
        <ul id="stations" data-role="listview" data-inset="true">
            <li id="station1" data-icon="check"><a>站点名</a></li>
            <li id="station2" data-icon="minus"><a>站点名</a></li>
            <li id="station1" data-icon="minus"><a>1. 家乐福始发站</a></li>
        </ul>
    </div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<script type="text/javascript">
var mapHandler;

function initialize()
{
    $("#map").attr("style", "height: " + (window.innerHeight - 130) + "px;");
    
    var route = JSON.parse('<?php echo $route; ?>');

    mapHandler = new BMap.Map("map");

    var convertRoutePoints = "";
    
    for (var i = 0; i < route["UserRoutePoint"].length; i++)
    {
        convertRoutePoints += route["UserRoutePoint"][i]["longitude"] + "," + route["UserRoutePoint"][i]["latitude"] + ";";
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

            mapHandler.setViewport(routePoints);
            mapHandler.addOverlay(new BMap.Polyline(routePoints, {strokeOpacity: 1}));
        },
        "jsonp"
    );

    var convertStationPoints = "";
    
    for (var i = 0; i < route["UserStationPoint"].length; i++)
    {
        convertStationPoints += route["UserStationPoint"][i]["longitude"] + "," + route["UserStationPoint"][i]["latitude"] + ";";
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
                    mapHandler.addOverlay(carrefourMarker);
                }
                
                var myIcon = new BMap.Icon(imgUrl, new BMap.Size(12, 12));
                myIcon.setImageSize(new BMap.Size(12, 12));
                myIcon.setAnchor(new BMap.Size(6, 6));
                var label = new BMap.Label(i + 1, {offset: new BMap.Size(0, -24)});
                var stationMarker = new BMap.Marker(new BMap.Point(data.result[i].x, data.result[i].y), {icon: myIcon});
                stationMarker.setLabel(label);
                mapHandler.addOverlay(stationMarker);
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

    mapHandler.setMapStyle({styleJson: styleGoogleLite});

    var stations = $("#stations");
    stations.empty();

    for (var k = 0; k < route["UserStationPoint"].length; k++)
    {
        stationSequence = route["UserStationPoint"][k]["sequence"];
        stationName = route["UserStationPoint"][k]["name"];
        stationText = stationSequence + ". " + stationName;

        $("<li>").attr("id", "station" + stationSequence).append($("<a>")).find("a").addClass("ui-btn ui-btn-icon-left ui-icon-minus")
            .html(stationText).end().appendTo(stations);
    }
}

$(document).ready(initialize);
</script>
















