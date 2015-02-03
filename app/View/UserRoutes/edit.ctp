<?php
    echo $this->Html->script('leaflet-src');
    echo $this->Html->script('Edit.Poly');
    echo $this->fetch('script');
?>
<div class="row">
    <div class="col-md-3">
        <div id="divHelpFirstStep">
            <strong>第1步，修改线路</strong>
            <ol style="padding-left: 20px">
                <li>输入唯一的路线名</li>
                <li>点击地图，添加或修改路线（绿色标记为站点，黄色标记为触发点）</li>
                <li>点击“下一步，设置报站点”</li>
            </ol>
        </div>
        <div id="divHelpSecondStep" style="display: none">
            <strong>第2步，设置报站点</strong>
            <ol style="padding-left: 20px">
                <li>按途经站点的先后顺序，点击蓝线</li>
                <li>为每个站点设置一个名称</li>
                <li>点击“下一步，设置触发点”</li>
            </ol>
        </div>
        <div id="divHelpThirdStep" style="display: none">
            <strong>第3步，设置触发点</strong>
            <ol style="padding-left: 20px">
                <li>选择相应的报站点</li>
                <li>在路线上点击，选择触发点</li>
                <li>点击“完成，提交此路线配置”</li>
            </ol>
        </div>
        <div><hr/></div>
        <form class="col-md-12 form-horizontal" id="formRouteInfo" action="/UserRoutes/submit" method="post">
            <div style="display: none">
                <input type="hidden" name="_method" value="POST"/>
                <input type="hidden" name="data[UserRoute][navPoints]" id="hiddenNavPoints"/>
                <input type="hidden" name="data[UserRoute][stationPoints]" id="hiddenStationPoints"/>
                <input type="hidden" name="data[UserRoute][triggerPoints]" id="hiddenTriggerPoints"/>
            </div>
            <div id="divFirstStep">
                <div class="form-group">
                    <label class="control-label" id="labelRouteName">路线名</label>
                    <div>
                        <input type="text" name="data[UserRoute][name]" class="form-control" id="inputRouteName" required="required"
                        	value="<?php $a = json_decode($route); echo $a->{'UserRoute'}->{'name'}; ?>"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">已存在的导航点</label>
                    <div>
                        <textarea class="form-control input-sm" id="inputNavPoints" rows="6" readonly></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-default btn-xs" id="btnReset">重置</button>
                    <button type="button" class="btn btn-default btn-xs" id="btnRemovePoint">删除一个导航点</button>
                </div>
                <div class="form-group">
                    <div>
                        <button type="button" class="btn btn-primary btn-block" id="btnGoToSecondStep"><strong>下一步，设置报站点</strong></button>
                    </div>
                </div>
            </div>
            <div id="divSecondStep" style="display: none">
                <div class="form-group">
                    <label class="control-label">已添加以下报站点</label>
                    <div style="height: 200px; overflow-y: scroll">
                        <table class="table small" id="tblStationName">
                            <tr>
                                <th>站点</th>
                                <th>名称</th>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-default btn-xs" id="btnResetStationPoints">清除所有站点</button>
                    <button type="button" class="btn btn-default btn-xs" id="btnRemoveStationPoint">删除一个站点</button>
                </div>
                <div class="form-group">
                    <div>
                        <button type="button" class="btn btn-warning btn-block" id="btnBackToFirstStep"><strong>上一步，设置线路</strong></button>
                        <button type="button" class="btn btn-primary btn-block" id="btnGoToThirdStep"><strong>下一步，设置触发点</strong></button>
                    </div>
                </div>
            </div>
            <div id="divThirdStep" style="display: none">
                <div class="form-group">
                    <label class="control-label" id="labelTriggerPoint">依次选择站点，然后添加触发点</label>
                    <div>
                        <select class="form-control input-sm" id="selectStationPoint">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">已设置的“站点-触发点”</label>
                    <div>
                        <textarea class="form-control input-sm" id="inputTriggerPoints" rows="6" readonly></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <button type="button" class="btn btn-warning btn-block" id="btnBackToSecondStep"><strong>上一步，设置报站点</strong></button>
                        <button type="button" class="btn btn-primary btn-block" id="btnGoToSubmit"><strong>完成，提交此路线配置</strong></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-9" id="Leaflet_map" style="height: 520px">
    </div>
    
    <script type="text/javascript">
		var stationsAndTriggers = $.parseJSON('<?php echo $stationsAndTriggers; ?>');
		var route = $.parseJSON('<?php echo $route; ?>');

		var sumLat = 0;
		var sumLng = 0;
		
	    for (var i = 0; i < route.UserRoutePoint.length; i++)
		{
	    	sumLat = sumLat + parseFloat(route.UserRoutePoint[i].latitude);
	    	sumLng = sumLng + parseFloat(route.UserRoutePoint[i].longitude);
	    }
    
        var map = L.map('Leaflet_map').setView([sumLat / route.UserRoutePoint.length, sumLng / route.UserRoutePoint.length], 13);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
            {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a>' + ' | ' +
                '&copy; <a href="http://www.glyphicons.com">GLYPHICONS</a>'}).addTo(map);
            
        var stationIcon = L.icon({
            iconUrl: '/img/station.png', 
            iconSize: [32, 32], 
            iconAnchor: [16, 31], 
            popupAnchor: [0, -30]});
        
        var stationEditingIcon = L.icon({
            iconUrl: '/img/station_editing.png', 
            iconSize: [32, 32], 
            iconAnchor: [16, 31], 
            popupAnchor: [0, -30]});
        
        var triggerIcon = L.icon({
            iconUrl: '/img/trigger.png', 
            iconSize: [32, 32], 
            iconAnchor: [16, 31], 
            popupAnchor: [0, -30]});

        var polyline = L.polyline([], {color: 'blue', opacity: 0.6});
        polyline.addTo(map);
        
        var stationMarkers = [];
        var triggerMarkers = [];

        for (var i = 0; i < stationsAndTriggers.length; i++)
        {
        	var marker = L.marker(L.latLng(stationsAndTriggers[i].ViewUserRouteDetail.station_lat, stationsAndTriggers[i].ViewUserRouteDetail.station_lng),
                {icon: stationIcon}).addTo(map);
        	stationMarkers.push(marker);
        	marker.bindPopup("站点: " + (i + 1) + "." + stationsAndTriggers[i].ViewUserRouteDetail.station_name);

        	var marker = L.marker(L.latLng(stationsAndTriggers[i].ViewUserRouteDetail.trigger_lat, stationsAndTriggers[i].ViewUserRouteDetail.trigger_lng),
                {icon: triggerIcon}).addTo(map);
        	triggerMarkers.push(marker);
        	marker.bindPopup("触发点: " + (i + 1));
        }

        for (var i = 0; i < route.UserRoutePoint.length; i++)
		{
			polyline.addLatLng(L.latLng(route.UserRoutePoint[i].latitude, route.UserRoutePoint[i].longitude));
		}

        polyline.editing.enable();
        updateNavPointBox();

        function updateNavPointBox()
        {
            $("#inputNavPoints").html("");

            var navPoints = [];
            latLngs = polyline.getLatLngs();
            numberOfPoints = latLngs.length;

            for (var i = 0; i < numberOfPoints; i++)
            {
                var navPoint = {sequence: i + 1, longitude: latLngs[i].lng, latitude: latLngs[i].lat};
                navPoints.push(navPoint);
                var num = i + 1;
                $("#inputNavPoints").html($("#inputNavPoints").html() + num + ". " + 
                    Math.round(latLngs[i].lng * 100000) / 100000 + ", " + Math.round(latLngs[i].lat * 100000) / 100000 + ";\n");
            }

            $("#hiddenNavPoints").val("");
            $("#hiddenNavPoints").val(JSON.stringify(navPoints));
        }

        function validatePoints()
        {
            var distanceThreshold = 0.0003;
			var numberOfStationMarkers = stationMarkers.length;
			var numberOfTriggerMarkers = triggerMarkers.length;
			var numberOfLines = polyline.getLatLngs().length - 1;
			var toBeDeleted = [];

			for (var i = 0; i < numberOfStationMarkers; i++)
			{
				var point = {x: stationMarkers[i].getLatLng().lng, y: stationMarkers[i].getLatLng().lat};
				var pointOnLine = false;
				
				for (var j = 0; j < numberOfLines; j++)
				{
				    var lineStart = {x: polyline.getLatLngs()[j].lng, y: polyline.getLatLngs()[j].lat};
				    var lineEnd = {x: polyline.getLatLngs()[j + 1].lng, y: polyline.getLatLngs()[j + 1].lat};
					
					var distance = distToSegment(point, lineStart, lineEnd);

					if (distance <= distanceThreshold)
					{
						pointOnLine = true;
					}
				}

				if (pointOnLine === false)
				{
					map.removeLayer(stationMarkers[i]);
					map.removeLayer(triggerMarkers[i]);
					toBeDeleted[i] = true;
				}

				var point = {x: triggerMarkers[i].getLatLng().lng, y: triggerMarkers[i].getLatLng().lat};
				var pointOnLine = false;
				
				for (var j = 0; j < numberOfLines; j++)
				{
				    var lineStart = {x: polyline.getLatLngs()[j].lng, y: polyline.getLatLngs()[j].lat};
				    var lineEnd = {x: polyline.getLatLngs()[j + 1].lng, y: polyline.getLatLngs()[j + 1].lat};
					
					var distance = distToSegment(point, lineStart, lineEnd);

					if (distance <= distanceThreshold)
					{
						pointOnLine = true;
					}
				}

				if (pointOnLine === false)
				{
					map.removeLayer(stationMarkers[i]);
					map.removeLayer(triggerMarkers[i]);
					toBeDeleted[i] = true;
				}
			}

			for (var i = numberOfStationMarkers - 1; i >= 0; i--)
			{
				if (toBeDeleted[i] === true)
				{
					stationMarkers.splice(i, 1);
					triggerMarkers.splice(i, 1);
				}
			}
        }

        var eventPolylineReset =
        function(e)
        {
            polyline.spliceLatLngs(0, polyline.getLatLngs().length);
            polyline.editing.disable();
            polyline.editing.enable();
            
            updateNavPointBox();
        };

        var eventPolylineRemoveOnePoint =
        function(e)
        {
            polyline.spliceLatLngs(polyline.getLatLngs().length - 1, 1);
            polyline.editing.disable();
            polyline.editing.enable();
            
            updateNavPointBox();
        };

        var eventLineUpdate =
        function(e)
        {
            updateNavPointBox();
            validatePoints();
        };

        function sqr(x) { return x * x; }
        
        function dist2(v, w) { return sqr(v.x - w.x) + sqr(v.y - w.y); }
        
        function distToSegmentSquared(p, v, w) {
            var l2 = dist2(v, w);
            
           	if (l2 == 0) return dist2(p, v);
            
          	var t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
            
          	if (t < 0) return dist2(p, v);
          	if (t > 1) return dist2(p, w);
            
          	return dist2(p, { x: v.x + t * (w.x - v.x), y: v.y + t * (w.y - v.y) });
        }

        function distToSegment(p, v, w) { return Math.sqrt(distToSegmentSquared(p, v, w)); }

        polyline.addEventListener('edit', eventLineUpdate);
        $("#btnReset").click(eventPolylineReset);
        $("#btnRemovePoint").click(eventPolylineRemoveOnePoint);
        
    </script>
</div>




























