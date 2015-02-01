<?php
    echo $this->Html->script('leaflet-src');
    echo $this->Html->script('Edit.Poly');
    echo $this->fetch('script');
?>
<div class="row">
    <div class="col-md-3">
        <div id="divHelpFirstStep">
            <strong>第1步，设置线路</strong>
            <ol style="padding-left: 20px">
                <li>输入唯一的路线名</li>
                <li>点击地图，添加或修改路线</li>
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
                        <input type="text" name="data[UserRoute][name]" class="form-control" id="inputRouteName" required="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">已添加以下导航点</label>
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
		
		alert(sumLat);
    
        var map = L.map('Leaflet_map').setView([sumLat / route.UserRoutePoint.length, sumLng / route.UserRoutePoint.length], 14);
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

        for (var i = 0; i < route.UserRoutePoint.length; i++)
		{
			polyline.addLatLng(L.latLng(route.UserRoutePoint[i].latitude, route.UserRoutePoint[i].longitude));
		}

        polyline.editing.enable();

        for (var i = 0; i < stationsAndTriggers.length; i++)
        {
        	var marker = L.marker(L.latLng(stationsAndTriggers[i].ViewUserRouteDetail.station_lat, stationsAndTriggers[i].ViewUserRouteDetail.station_lng),
                {icon: stationIcon}).addTo(map);
        	stationMarkers.push(marker);
        	marker.bindPopup("站点" + stationMarkers.length).openPopup();

        	var marker = L.marker(L.latLng(stationsAndTriggers[i].ViewUserRouteDetail.trigger_lat, stationsAndTriggers[i].ViewUserRouteDetail.trigger_lng),
                {icon: triggerIcon}).addTo(map);
        	triggerMarkers.push(marker);
        	marker.bindPopup("触发点" + triggerMarkers.length).openPopup();
        }
    </script>
</div>




























