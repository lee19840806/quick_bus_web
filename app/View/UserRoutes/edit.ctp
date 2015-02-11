<?php
    echo $this->Html->script('leaflet-src');
    echo $this->Html->script('Edit.Poly');
    echo $this->Html->script('jquery-ui');
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
                <li>拖动站点列表，按实际站点次序排序</li>
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
                    <p></p>
                    	<small>
                        	<li class="list-unstyled" id="sortable">
                        	</li>
                        </small>
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
    <script type="text/javascript" src="/js/editRoute.js"></script>
    <script type="text/javascript">
		var stationsAndTriggersJSON = $.parseJSON('<?php echo $stationsAndTriggers; ?>');
		var routeJSON = $.parseJSON('<?php echo $route; ?>');
		
		var initializedObject = initializeRoute(routeJSON, stationsAndTriggersJSON);
		var route = initializedObject.route;
		var mapCenter = initializedObject.mapCenter;
		var stationIcon = initializedObject.stationIcon;
		var stationEditingIcon = initializedObject.stationEditingIcon;
		var triggerIcon = initializedObject.triggerIcon;
    	
        var map = L.map('Leaflet_map').setView([mapCenter.lat, mapCenter.lng], 13);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
            {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a>' + ' | ' + '&copy; <a href="http://www.glyphicons.com">GLYPHICONS</a>'}).addTo(map);

        route.polyline.addTo(map);
        route.polyline.editing.enable();

        for (var i = 0; i < route.stations.length; i++)
        {
        	route.stations[i].marker.addTo(map);
        	route.stations[i].trigger.marker.addTo(map);
        }
        
        updateNavPointBox();

        function updateNavPointBox()
        {
            $("#inputNavPoints").html("");

            var navPoints = [];
            latLngs = route.polyline.getLatLngs();
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

            validatePoints();
        }

        function validatePoints()
        {
            var distanceThreshold = 0.0004;
			var numberOfStationMarkers = route.stations.length;
			var numberOfLines = route.polyline.getLatLngs().length - 1;
			var toBeDeleted = [];

			for (var i = 0; i < numberOfStationMarkers; i++)
			{
				var stationPoint = {x: route.stations[i].marker.getLatLng().lng, y: route.stations[i].marker.getLatLng().lat};
				var triggerPoint;

				if (route.stations[i].trigger != undefined)
				{
					triggerPoint = {x: route.stations[i].trigger.marker.getLatLng().lng, y: route.stations[i].trigger.marker.getLatLng().lat};
				}
				else
				{
					triggerPoint = {x: route.stations[i].marker.getLatLng().lng, y: route.stations[i].marker.getLatLng().lat};
				}
				
				var stationOnLine = false;
				var triggerOnLine;
				
				if (route.stations[i].trigger != undefined) {triggerOnLine = false;}
				else {triggerOnLine = true;}
				
				for (var j = 0; j < numberOfLines; j++)
				{
				    var lineStart = {x: route.polyline.getLatLngs()[j].lng, y: route.polyline.getLatLngs()[j].lat};
				    var lineEnd = {x: route.polyline.getLatLngs()[j + 1].lng, y: route.polyline.getLatLngs()[j + 1].lat};
					
					var distanceStation = distToSegment(stationPoint, lineStart, lineEnd);
					var distanceTrigger = distToSegment(triggerPoint, lineStart, lineEnd);

					if (distanceStation <= distanceThreshold)
					{
						stationOnLine = true;
					}

					if (distanceTrigger <= distanceThreshold)
					{
						triggerOnLine = true;
					}
				}

				if (stationOnLine === false || triggerOnLine === false)
				{
					map.removeLayer(route.stations[i].marker);
					
					if (route.stations[i].trigger != undefined)
					{
						map.removeLayer(route.stations[i].trigger.marker);
					}
					
					toBeDeleted[i] = true;
				}
			}

			var showAlert = false;
			var pointRemovedAlert = "受影响线路调整的影响，以下站点和触发点将被删除。\n您需要在下一个页面根据新的路线重新添加：\n\n";

			for (var i = numberOfStationMarkers - 1; i >= 0; i--)
			{
				if (toBeDeleted[i] === true)
				{
					showAlert = true;
					pointRemovedAlert = pointRemovedAlert + "站点" + (i + 1) + " " + route.stations[i].name + ", 触发点" + (i + 1) + ";\n";
					route.stations.splice(i, 1);
				}
			}

			for (var i = 0; i < route.stations.length; i++)
			{
				route.stations[i].sequence = i + 1;
				route.stations[i].marker.bindPopup("站点" + (i + 1) + " " + route.stations[i].name);

				if (route.stations[i].trigger != undefined)
				{
					route.stations[i].trigger.marker.bindPopup("触发点" + (i + 1));
				}
			}

			if (showAlert === true)
			{
				alert(pointRemovedAlert);
			}
        }

        var eventAddingPoints =
        function(e)
        {
            route.polyline.addLatLng(e.latlng);
            route.polyline.editing.disable();
            route.polyline.editing.enable();

            updateNavPointBox();
        };

        var eventPolylineReset =
        function(e)
        {
            route.polyline.spliceLatLngs(0, route.polyline.getLatLngs().length);
            route.polyline.editing.disable();
            route.polyline.editing.enable();
            
            updateNavPointBox();
        };

        var eventPolylineRemoveOnePoint =
        function(e)
        {
            route.polyline.spliceLatLngs(route.polyline.getLatLngs().length - 1, 1);
            route.polyline.editing.disable();
            route.polyline.editing.enable();
            
            updateNavPointBox();
        };

        var eventLineUpdate =
        function(e)
        {
            updateNavPointBox();
        };
        
        var eventGoToSecondStep =
        function(e)
        {
            if ($("#inputRouteName").val() === "")
            {
                alert("请填写一个有效的路线名");
                $("#labelRouteName").fadeOut(function(){$("#labelRouteName").fadeIn();});
                $("#inputRouteName").fadeOut(
                    function(){$("#inputRouteName").fadeIn(
                        function(){$("#inputRouteName").focus();
                    });
                });
                return;
            }
            
            if (route.polyline.getLatLngs().length < 2)
            {
                alert("请至少在地图上点取2个导航点，组成有效的线路");
                $("#Leaflet_map").fadeOut(function(){$("#Leaflet_map").fadeIn();});
                return;
            }
            
            $("#btnGoToSecondStep").attr("disabled", true);
            
            $.ajax(
                {
                    url: "/UserRoutes/ajaxCheckRouteNameAndID",
                    type: "POST",
                    data: {routeName: $("#inputRouteName").val(), routeID: route.id},
                    timeout: 5000,
                    success: function(result) {
                        if (result === "yes")
                        {
                            $("#divFirstStep").fadeOut(function() {$("#divSecondStep").fadeIn();} );
                            $("#divHelpFirstStep").fadeOut(function() {$("#divHelpSecondStep").fadeIn();} );
                            
                            route.polyline.editing.disable();
                            map.removeEventListener("click", eventAddingPoints);
                            route.polyline.addEventListener("click", eventAddStationPoint);
                        }
                        else
                        {
                            alert("已存在相同的路线名，请输入一个新的路线名");
                            $("#labelRouteName").fadeOut(function(){$("#labelRouteName").fadeIn();});
                            $("#inputRouteName").fadeOut(
                                function(){$("#inputRouteName").fadeIn(
                                    function(){$("#inputRouteName").focus();
                                });
                            });
                        }
                    },
                    error: function(xhr, status) {
                        alert("无法提交线路，请稍后再试");
                    },
                    complete: function()
                    {
                        $("#btnGoToSecondStep").attr("disabled", false);
                    }
                }
            );

            updateStationPointBox();
        };

        var eventBackToFirstStep =
        function(e)
        {
            $("#divSecondStep").fadeOut(function() {$("#divFirstStep").fadeIn();} );
            $("#divHelpSecondStep").fadeOut(function() {$("#divHelpFirstStep").fadeIn();} );
            
            map.addEventListener("click", eventAddingPoints);
            route.polyline.removeEventListener("click", eventAddStationPoint);

            route.polyline.editing.enable();

            updateStationPointBox();
        };

        var eventAddStationPoint =
        function(e)
        {
            var marker = L.marker(e.latlng, {icon: stationIcon}).addTo(map);
            var station = createStation(marker, route.stations.length + 1, "", undefined);
            marker.bindPopup("站点" + (route.stations.length + 1)).openPopup();

            route.stations.push(station);
            updateStationPointBox();
        };

        function updateStationPointBox()
        {
            var stationPoints = [];
            var numberOfStations = route.stations.length;

            $("#sortable").empty();

            for (var i = 0; i < numberOfStations; i++)
            {
                var stationPoint = {sequence: i + 1, 
                    longitude: route.stations[i].marker.getLatLng().lng, latitude: route.stations[i].marker.getLatLng().lat, name: route.stations[i].name};
                stationPoints.push(stationPoint);
                var num = i + 1;
                var pointString = num + ".&nbsp;" +
                    Math.round(route.stations[i].marker.getLatLng().lng * 100000) / 100000 + ",&nbsp;" +
                    Math.round(route.stations[i].marker.getLatLng().lat * 100000) / 100000;
                
                var inputValue = route.stations[i].name;

                $("#sortable").append("<li id=\"" + (i + 1) + "\">" + "站名：<input type=\"text\" value=\"" + inputValue + "\" style=\"width: 58px\" />&nbsp;&nbsp;"
                    + "<kbd>" + pointString + "</kbd>" + "</li>");
            }

            $("#sortable li").hover(
                function()
                {
                    route.stations[parseInt($(this).attr("id")) - 1].marker.setIcon(stationEditingIcon);
                },
                function()
                {
                	route.stations[parseInt($(this).attr("id")) - 1].marker.setIcon(stationIcon);
                });

            $("#hiddenStationPoints").val("");
            $("#hiddenStationPoints").val(JSON.stringify(stationPoints));
        }

        var eventResetStationPoints =
        function(e)
        {
            var numberOfStations = stationMarkers.length;
            
            for (var i = 0; i < numberOfStations; i++)
            {
                map.removeLayer(stationMarkers[i]);

                if (triggerMarkers[i] != undefined)
                {
                	map.removeLayer(triggerMarkers[i]);
                }
            }
            
            stationMarkers = [];
            triggerMarkers = [];
            
            updateStationPointBox();
        };

        function sqr(x)
        {
        	return x * x;
        }

        function dist2(v, w)
        {
        	return sqr(v.x - w.x) + sqr(v.y - w.y);
        }

        function distToSegmentSquared(p, v, w)
        {
            var l2 = dist2(v, w);
            
           	if (l2 == 0) return dist2(p, v);
            
          	var t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
            
          	if (t < 0) return dist2(p, v);
          	if (t > 1) return dist2(p, w);
            
          	return dist2(p, { x: v.x + t * (w.x - v.x), y: v.y + t * (w.y - v.y) });
        }

        function distToSegment(p, v, w)
        {
        	return Math.sqrt(distToSegmentSquared(p, v, w));
        }

        map.addEventListener('click', eventAddingPoints);
        route.polyline.addEventListener('edit', eventLineUpdate);
        $("#btnReset").click(eventPolylineReset);
        $("#btnRemovePoint").click(eventPolylineRemoveOnePoint);
        $("#btnGoToSecondStep").click(eventGoToSecondStep);
        $("#btnBackToFirstStep").click(eventBackToFirstStep);
        //$("#btnResetStationPoints").click(eventResetStationPoints);
        
        $(function()
        {
            $("#sortable").sortable({
                update:
                function (event, ui)
                {
            		var newOrder = $("#sortable").sortable("toArray");

            		for (var i = 0; i < newOrder.length; i++)
            		{
						route.stations[i].sequence = parseInt(newOrder[i]);
            		}

            		route.stations.sort(sortStation);

            		for (var i = 0; i < newOrder.length; i++)
            		{
						route.stations[i].marker.bindPopup("站点" + route.stations[i].sequence + " " + route.stations[i].name);

						if (route.stations[i].trigger != undefined)
						{
							route.stations[i].trigger.marker.bindPopup("触发点" + route.stations[i].sequence);
						}

						route.stations[i].marker.setIcon(stationIcon);
            		}

            		updateStationPointBox();
                }
            });
            
            $("#sortable").disableSelection();
        });

        function sortStation(a, b)
        {
			return parseInt(a.sequence) - parseInt(b.sequence);
        }
    </script>
</div>




























