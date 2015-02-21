<?php
    echo $this->Html->script('leaflet-src');
    echo $this->Html->script('Edit.Poly');
    echo $this->fetch('script');
?>
<div class="row">
    <div class="col-md-3">
        <div id="divHelpFirstStep">
            <strong>回放历史轨迹</strong>
            <ol style="padding-left: 20px">
                <li>输入路线名称</li>
                <li>绿标为站点，黄标为触发点</li>
            </ol>
        </div>
        <div><hr/></div>
        <p><strong><?php echo json_decode($route)->{'UserRoute'}->{'name'}; ?></strong></p>
        <p>
            <input type="text" class="form-control input-sm" id="inputTime" required="required"/>
        </p>
        <select class="form-control input-sm" id="selectReplaySpeed">
            <option value="1">1倍速</option>
            <option value="4">4倍速</option>
            <option value="8">8倍速</option>
            <option value="16" selected="selected">16倍速</option>
            <option value="32">32倍速</option>
            <option value="64">64倍速</option>
            <option value="128">128倍速</option>
        </select>
        <br/>
        <button type="button" class="btn btn-primary btn-block" id="btnStartReplay"><strong>开始回放</strong></button>
        <div><hr/></div>
        <a class="btn btn-warning btn-block" href="/UserRoutes/index" role="button"><strong>返回线路管理面板</strong></a>
    </div>
    <div class="col-md-9" id="Leaflet_map" style="height: 520px">
    </div>
    <script type="text/javascript" src="/js/editRoute.js"></script>
    <script type="text/javascript">
		var stationsAndTriggersJSON = $.parseJSON('<?php echo $stationsAndTriggers; ?>');
		var routeJSON = $.parseJSON('<?php echo $route; ?>');
		var positions = $.parseJSON('<?php echo $positions; ?>');
		var beginTime = positions[0].RealTimePosition.created;
		var currentTime = beginTime;
		var beginIndex = 0;
		var currentIndex = beginIndex;
		var endIndex = positions.length - 1;
		
		var timerBase = 5000;
		var timerFactor = 1;

		var loopHandler;
		
		$("#inputTime").val(beginTime);
		
		var initializedObject = initializeRoute(routeJSON, stationsAndTriggersJSON);
		var route = initializedObject.route;
		var mapCenter = initializedObject.mapCenter;
		var stationIcon = initializedObject.stationIcon;
		var triggerIcon = initializedObject.triggerIcon;

		var busIcon = L.icon({
		    iconUrl: '/img/bus.ico', 
		    iconSize: [32, 32], 
		    iconAnchor: [16, 31], 
		    popupAnchor: [0, -30]});
    	
        var map = L.map('Leaflet_map').setView([mapCenter.lat, mapCenter.lng], 12);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
            {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a>' + ' | ' + '&copy; <a href="http://www.glyphicons.com">GLYPHICONS</a>'}).addTo(map);

        route.polyline.addTo(map);

        for (var i = 0; i < route.stations.length; i++)
        {
        	route.stations[i].marker.addTo(map);
        	route.stations[i].trigger.marker.addTo(map);
        }

        var busMarker = L.marker(L.latLng(positions[0].RealTimePosition.latitude, positions[0].RealTimePosition.longitude), {icon: busIcon});
        busMarker.addTo(map);

        var run = function ()
        {
        	$("#inputTime").val(positions[currentIndex].RealTimePosition.created);
            busMarker.setLatLng(L.latLng(positions[currentIndex].RealTimePosition.latitude, positions[currentIndex].RealTimePosition.longitude));
            
        	currentIndex++;
        };
        
        $("#btnStartReplay").click(function () {
            clearInterval(loopHandler);

            busMarker.setLatLng(L.latLng(positions[0].RealTimePosition.latitude, positions[0].RealTimePosition.longitude));
            map.panTo(busMarker.getLatLng());
            
        	currentTime = beginTime;
        	currentIndex = beginIndex;
        	timerCount = 0;
        	loopHandler = setInterval(run, timerBase / parseInt($("#selectReplaySpeed").val()));
        });

        $("#selectReplaySpeed").change(function () {
        	clearInterval(loopHandler);
        	loopHandler = setInterval(run, timerBase / parseInt($(this).val()));
        });
    </script>
</div>







