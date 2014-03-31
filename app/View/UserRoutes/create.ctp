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
                <li>输入一个唯一的路线名（字母+数字）</li>
                <li>点击地图，添加或修改路线</li>
                <li>点击“下一步，设置报站点”</li>
            </ol>
        </div>
        <div id="divHelpSecondStep" style="display: none">
            <strong>第2步，设置报站点</strong>
            <ol style="padding-left: 20px">
                <li>按途经站点的先后顺序，点击蓝线</li>
                <li>绿色标记为报站点</li>
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
                    <div>
                        <textarea class="form-control input-sm" id="inputStationPoints" rows="6" readonly></textarea>
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
        var map = L.map('Leaflet_map').setView([31.23, 121.5], 13);
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
        
        function updateStationPointBox()
        {
            $("#inputStationPoints").html("");
            
            var stationPoints = [];
            
            var numberOfStations = stationMarkers.length;

            for (var i = 0; i < numberOfStations; i++)
            {
                var stationPoint = {sequence: i + 1, 
                    longitude: stationMarkers[i].getLatLng().lng, latitude: stationMarkers[i].getLatLng().lat};
                stationPoints.push(stationPoint);
                var num = i + 1;
                $("#inputStationPoints").html($("#inputStationPoints").html() + num + ". " + 
                    Math.round(stationMarkers[i].getLatLng().lng * 100000) / 100000 + ", " + 
                    Math.round(stationMarkers[i].getLatLng().lat * 100000) / 100000 + ";\n");
            }

            $("#hiddenStationPoints").val("");
            $("#hiddenStationPoints").val(JSON.stringify(stationPoints));
        }
        
        function getTriggerPonitHeading(lng, lat, latLngs)
        {
            var distances = [];
            var distancesTemp = [];
            var x0 = lng;
            var y0 = lat;
            
            var pathLength = latLngs.length;

            for (var i = 0; i < pathLength - 1; i++)
            {
                var x1 = latLngs[i].lng;
                var y1 = latLngs[i].lat;
                var x2 = latLngs[i + 1].lng;
                var y2 = latLngs[i + 1].lat;
                var dx = x1 - x2;
                var dy = y1 - y2;
                
                var xInTheRange = (x0 >= x1 && x0 < x2) || (x0 > x2 && x0 <= x1);
                var yInTheRange = (y0 >= y1 && y0 < y2) || (y0 > y2 && y0 <= y1);

                if (xInTheRange || yInTheRange)
                {
                    var dist = Math.abs((dy * x0) - (dx * y0) + (x1 * y2) - (x2 * y1)) / Math.sqrt((dx * dx) + (dy * dy));
                    distances.push({index: i, distance: dist});
                    distancesTemp.push(dist);
                }
            }
            
            var minDistance = Math.min.apply(null, distancesTemp);
            var endingPointIndex = 0;
            
            for (var i = 0; i < distances.length; i++)
            {
                var d = distances[i].distance;
                if (distances[i].distance === minDistance)
                {
                    endingPointIndex = distances[i].index + 1;
                }
            }
            
            var endingPoint = latLngs[endingPointIndex];
            var startingPoint = latLngs[endingPointIndex - 1];
            
            var headingY = Math.sin(endingPoint.lng - startingPoint.lng) * Math.cos(endingPoint.lat);
            var headingX = Math.cos(startingPoint.lat) * Math.sin(endingPoint.lat) -
                Math.sin(startingPoint.lat) * Math.cos(endingPoint.lat) * Math.cos(endingPoint.lng - startingPoint.lng);
            var headingInDegrees = (Math.atan2(headingY, headingX) * 180) / Math.PI;
            var headingInDegreesNormalized = (headingInDegrees + 360) % 360;
            
            return headingInDegreesNormalized;
        }
        
        var eventAddingPoints =
            function(e)
            {
                polyline.addLatLng(e.latlng);
                polyline.editing.disable();
                polyline.editing.enable();

                updateNavPointBox();
            };
            
        var eventLineUpdate =
            function(e)
            {
                updateNavPointBox();
            };
            
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
                
                if (polyline.getLatLngs().length < 2)
                {
                    alert("请至少在地图上点取2个导航点，组成有效的线路");
                    $("#Leaflet_map").fadeOut(function(){$("#Leaflet_map").fadeIn();});
                    return;
                }
                
                $("#btnGoToSecondStep").attr("disabled", true);
                
                $.ajax(
                    {
                        url: "/UserRoutes/ajaxCheckRouteName",
                        type: "POST",
                        data: {routeName: $("#inputRouteName").val()},
                        timeout: 5000,
                        success: function(result) {
                            if (result === "yes")
                            {
                                $("#divFirstStep").fadeOut(function() {$("#divSecondStep").fadeIn();} );
                                $("#divHelpFirstStep").fadeOut(function() {$("#divHelpSecondStep").fadeIn();} );
                                
                                polyline.editing.disable();
                                map.removeEventListener("click", eventAddingPoints);
                                polyline.addEventListener("click", eventAddStationPoint);
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
            };
            
        var eventAddStationPoint =
            function(e)
            {
                var marker = L.marker(e.latlng, {icon: stationIcon}).addTo(map);
                stationMarkers.push(marker);
                
                marker.bindPopup("站点" + stationMarkers.length).openPopup();
                
                updateStationPointBox();
            };
            
        var eventResetStationPoints =
            function(e)
            {
                var numberOfStations = stationMarkers.length;
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    map.removeLayer(stationMarkers[i]);
                }
                
                stationMarkers = [];
                
                updateStationPointBox();
            };
            
        var eventRemoveStationPoint =
            function(e)
            {
                if (stationMarkers.length > 0)
                {
                    map.removeLayer(stationMarkers[stationMarkers.length - 1]);
                    stationMarkers.pop();
                    
                    updateStationPointBox();
                }
            };
            
        var eventBackToFirstStep =
            function(e)
            {
                $("#divSecondStep").fadeOut(function() {$("#divFirstStep").fadeIn();} );
                $("#divHelpSecondStep").fadeOut(function() {$("#divHelpFirstStep").fadeIn();} );
                
                map.addEventListener("click", eventAddingPoints);
                polyline.removeEventListener("click", eventAddStationPoint);
                
                polyline.editing.enable();
                
                var numberOfStations = stationMarkers.length;
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    map.removeLayer(stationMarkers[i]);
                }
                
                stationMarkers = [];
                
                updateStationPointBox();
            };
            
        var eventAddTriggerPoint =
            function(e)
            {
                var stationPointIndex = $("#selectStationPoint").val();
                
                if (stationPointIndex <= 0)
                {
                    alert("请在左侧下拉菜单选择站点");
                    $("#labelTriggerPoint").fadeOut(function() {$("#labelTriggerPoint").fadeIn();} );
                    $("#selectStationPoint").fadeOut(
                        function() {$("#selectStationPoint").fadeIn(function() {$("#selectStationPoint").focus();});} );
                    return;
                }
                
                var marker = L.marker(e.latlng, {icon: triggerIcon});

                if (triggerMarkers[stationPointIndex - 1] === undefined)
                {
                    triggerMarkers[stationPointIndex - 1] = marker;
                    marker.addTo(map);
                    marker.bindPopup("触发点" + stationPointIndex).openPopup();
                }
                else
                {
                    map.removeLayer(triggerMarkers[stationPointIndex - 1]);
                    triggerMarkers[stationPointIndex - 1] = marker;
                    marker.addTo(map);
                    marker.bindPopup("触发点" + stationPointIndex).openPopup();
                }

                $("#inputTriggerPoints").html("");
                var eachStationTriggerReady = true;
                var numberOfStations = stationMarkers.length;

                for (var i = 0; i < numberOfStations; i++)
                {
                    if (triggerMarkers[i] === undefined)
                    {
                        eachStationTriggerReady = false;
                    }
                    else
                    {
                        var heading = Math.round(getTriggerPonitHeading(
                        triggerMarkers[i].getLatLng().lng, triggerMarkers[i].getLatLng().lat, polyline.getLatLngs()));

                        $("#inputTriggerPoints").html($("#inputTriggerPoints").html() + 
                            "站" + (i + 1) + ". " +
                            Math.round(stationMarkers[i].getLatLng().lng * 100000) / 100000 + ", " + 
                            Math.round(stationMarkers[i].getLatLng().lat * 100000) / 100000 + ";\n" + 
                            "触" + (i + 1) + ". " +
                            Math.round(triggerMarkers[i].getLatLng().lng * 100000) / 100000 + ", " + 
                            Math.round(triggerMarkers[i].getLatLng().lat * 100000) / 100000 + ", " +
                            "方向" + heading + "°;\n\n");
                    }
                }

                if (eachStationTriggerReady === true)
                {
                    var numberOfStations = stationMarkers.length;
                    var triggerPoints = [];

                    for (var i = 0; i < numberOfStations; i++)
                    {
                        var heading = Math.round(getTriggerPonitHeading(
                            triggerMarkers[i].getLatLng().lng, triggerMarkers[i].getLatLng().lat, polyline.getLatLngs()));
                        var triggerPoint = {sequence: i + 1, longitude: triggerMarkers[i].getLatLng().lng, 
                            latitude: triggerMarkers[i].getLatLng().lat, heading: heading};
                        triggerPoints.push(triggerPoint);
                    }

                    $("#hiddenTriggerPoints").val("");
                    $("#hiddenTriggerPoints").val(JSON.stringify(triggerPoints));
                }
            };
            
        var eventGoToThirdStep =
            function(e)
            {
                if (stationMarkers.length === 0)
                {
                    alert("请在路线上至少设置1个站点（点击地图中的蓝线）");
                    $("#Leaflet_map").fadeOut(function(){$("#Leaflet_map").fadeIn();});
                    return;
                }
                
                $("#divSecondStep").fadeOut(function() {$("#divThirdStep").fadeIn();} );
                $("#divHelpSecondStep").fadeOut(function() {$("#divHelpThirdStep").fadeIn();} );
                
                polyline.removeEventListener("click", eventAddStationPoint);
                polyline.addEventListener("click", eventAddTriggerPoint);
                
                $("#selectStationPoint").empty();
                
                var numberOfStations = stationMarkers.length;
                
                $("#selectStationPoint").append($("<option>", {value: 0, text: "选择1个站点"}));
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    $("#selectStationPoint").append($("<option>", {value: i + 1, text: i + 1 + ". " + 
                        Math.round(stationMarkers[i].getLatLng().lng * 100000) / 100000 + ", " + 
                        Math.round(stationMarkers[i].getLatLng().lat * 100000) / 100000}));
                }
            };
            
        var eventStationPointChange =
            function(e)
            {
                var numberOfStations = stationMarkers.length;
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    stationMarkers[i].setIcon(stationIcon);
                }
                
                if (parseInt(e.target.value) > 0)
                {
                    stationMarkers[parseInt(e.target.value - 1)].setIcon(stationEditingIcon);
                }
            };
            
        var eventGoToSubmit =
            function(e)
            {
                var eachStationTriggerReady = true;
                var numberOfStations = stationMarkers.length;
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    if (triggerMarkers[i] === undefined)
                    {
                        eachStationTriggerReady = false;
                    }
                }
                
                if (eachStationTriggerReady === false)
                {
                    alert("还有未设置触发点的站点。请完成设置，然后再提交线路");
                    $("#labelTriggerPoint").fadeOut(function() {$("#labelTriggerPoint").fadeIn();} );
                    $("#selectStationPoint").fadeOut(
                        function() {$("#selectStationPoint").fadeIn(function() {$("#selectStationPoint").focus();});} );
                    return;
                }
                
                $("#formRouteInfo").submit();
            };
            
        var eventBackToSecondStep =
            function(e)
            {
                polyline.removeEventListener("click", eventAddTriggerPoint);
                polyline.addEventListener("click", eventAddStationPoint);
                
                $("#divThirdStep").fadeOut(function() {$("#divSecondStep").fadeIn();} );
                $("#divHelpThirdStep").fadeOut(function() {$("#divHelpSecondStep").fadeIn();} );
                
                var numberOfStations = stationMarkers.length;
                
                for (var i = 0; i < numberOfStations; i++)
                {
                    stationMarkers[i].setIcon(stationIcon);
                }
                
                var numberOfTriggers = triggerMarkers.length;
                
                for (var i = 0; i < numberOfTriggers; i++)
                {
                    map.removeLayer(triggerMarkers[i]);
                }
                
                $("#inputTriggerPoints").html("");
                $("#hiddenTriggerPoints").val("");
                triggerMarkers = [];
            };
            
        map.addEventListener('click', eventAddingPoints);
        polyline.addEventListener('edit', eventLineUpdate);
        $("#btnReset").click(eventPolylineReset);
        $("#btnRemovePoint").click(eventPolylineRemoveOnePoint);
        $("#btnGoToSecondStep").click(eventGoToSecondStep);
        $("#btnResetStationPoints").click(eventResetStationPoints);
        $("#btnRemoveStationPoint").click(eventRemoveStationPoint);
        $("#btnBackToFirstStep").click(eventBackToFirstStep);
        $("#btnGoToThirdStep").click(eventGoToThirdStep);
        $("#selectStationPoint").change(eventStationPointChange);
        $("#btnBackToSecondStep").click(eventBackToSecondStep);
        $("#btnGoToSubmit").click(eventGoToSubmit);
    </script>
</div>