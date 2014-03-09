<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
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
                <li>红色标记为报站点</li>
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
                <input type="hidden" name="navPoints" id="hiddenNavPoints"/>
                <input type="hidden" name="stationPoints" id="hiddenStationPoints"/>
                <input type="hidden" name="TriggerPoints" id="hiddenTriggerPoints"/>
            </div>
            <div id="divFirstStep">
                <div class="form-group">
                    <label class="control-label">路线名</label>
                    <div>
                        <input type="text" name="data[UserRoute][name]" class="form-control" id="inputRouteName" required="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">已添加以下导航点</label>
                    <div>
                        <textarea class="form-control input-sm" id="inputNavPoints" name="data[UserRoute][navPoints]" rows="6" readonly></textarea>
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
                        <textarea class="form-control input-sm" id="inputStationPoints" name="data[UserRoute][stationPoints]" rows="6" readonly></textarea>
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
                    <label class="control-label">选择站点，然后添加触发点</label>
                    <div>
                        <select class="form-control input-sm" id="selectStationPoint">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">已设置的“站点-触发点”</label>
                    <div>
                        <textarea class="form-control input-sm" id="inputTriggerPoints" name="data[UserRoute][triggerPoints]" rows="6" readonly></textarea>
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
    <div class="col-md-9" id="baidu_map" style="height: 520px">
    </div>
    
    <script type="text/javascript">
        var map = new BMap.Map("baidu_map");
        map.centerAndZoom("上海", 13);
        map.enableScrollWheelZoom();
        map.addControl(new BMap.NavigationControl());
        map.addControl(new BMap.ScaleControl());
        map.disableDoubleClickZoom();
        
        var polyline = new BMap.Polyline([], {strokeColor: "blue", strokeWeight: 5, strokeOpacity: 0.5});
        map.addOverlay(polyline);
        
        var stationMarkers = [];
        
        var disableEventAddingPoints = 0;
        var justRemovedPoint = 0;
        
        var eventReset =
            function(e)
            {
                $("#hiddenNavPoints").val("");
                $("#inputNavPoints").html("");
                polyline.setPath([]);
                
                disableEventAddingPoints = 0;
                justRemovedPoint = 0;
            };
            
        var eventRemovePoint =
            function(e)
            {
                justRemovedPoint = 1;
                disableEventAddingPoints = 0;
                
                var path = polyline.getPath();
                path.pop();
                polyline.setPath(path);
            };
            
        var eventAddingPoints =
            function(e)
            {
                if (disableEventAddingPoints === 0)
                {
                    var path = polyline.getPath();
                    path.push(new BMap.Point(e.point.lng, e.point.lat));
                    polyline.setPath(path);
                    polyline.enableEditing();
                }
                
                disableEventAddingPoints = 0;
            };
        
        var lineUpdate =
            function(e)
            {
                var path = polyline.getPath();
                pathLength = path.length;
                
                if (pathLength !== 0)
                {
                    if (justRemovedPoint !== 1)
                    {
                        disableEventAddingPoints = 1;
                    }
                }
                
                justRemovedPoint = 0;

                $("#inputNavPoints").html("");
                
                var navPoints = [];
                
                for (var i = 0; i < pathLength; i++)
                {
                    var myPoint = {sequence: i + 1, longitude: path[i].lng, latitude: path[i].lat};
                    navPoints.push(myPoint);
                    var num = i + 1;
                    $("#inputNavPoints").html($("#inputNavPoints").html() + num + ". " + path[i].lng + ", " + path[i].lat + ";\n");
                }
                
                $("#hiddenNavPoints").val("");
                $("#hiddenNavPoints").val(JSON.stringify(navPoints));
            };
            
        var eventGoToSecondStep =
            function(e)
            {
                if ($("#inputRouteName").val() === "")
                {
                    alert("请填写一个有效的路线名");
                    $("#inputRouteName").fadeOut(
                        function(){$("#inputRouteName").fadeIn(
                            function(){$("#inputRouteName").focus();
                        });
                    });
                    return;
                }
                
                if (polyline.getPath().length < 2)
                {
                    alert("请至少在地图上点取2个导航点，组成有效的线路");
                    $("#baidu_map").fadeOut(function(){$("#baidu_map").fadeIn();});
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
                                
                                polyline.disableEditing();
                                map.removeEventListener("click", eventAddingPoints);
                                polyline.removeEventListener("lineupdate", lineUpdate);
                                polyline.addEventListener("click", eventAddStationPoint);
                            }
                            else
                            {
                                alert("已存在相同的路线名，请输入一个新的路线名");
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
        
        var eventBackToFirstStep =
            function(e)
            {
                $("#divSecondStep").fadeOut(function() {$("#divFirstStep").fadeIn();} );
                $("#divHelpSecondStep").fadeOut(function() {$("#divHelpFirstStep").fadeIn();} );
                
                map.addEventListener("click", eventAddingPoints);
                polyline.removeEventListener("click", eventAddStationPoint);
                polyline.addEventListener("lineupdate", lineUpdate);
                
                polyline.enableEditing();
                
                disableEventAddingPoints = 0;
                justRemovedPoint = 0;
                
                $("#hiddenStationPoints").val("");
                $("#inputStationPoints").html("");
                
                var stationMarkersLength = stationMarkers.length;
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    map.removeOverlay(stationMarkers[i]);
                }
                
                stationMarkers = [];
            };
        
        var eventGoToThirdStep =
            function(e)
            {
                if (stationMarkers.length === 0)
                {
                    alert("请在路线上至少设置1个站点（点击地图中的蓝线）");
                    $("#baidu_map").fadeOut(function(){$("#baidu_map").fadeIn();});
                    return;
                }
                
                polyline.removeEventListener("click", eventAddStationPoint);
                
                $("#divSecondStep").fadeOut(function() {$("#divThirdStep").fadeIn();} );
                $("#divHelpSecondStep").fadeOut(function() {$("#divHelpThirdStep").fadeIn();} );
                
                $("#selectStationPoint").empty();
                
                var stationMarkersLength = stationMarkers.length;
                
                $("#selectStationPoint").append($("<option>", {value: 0, text: "选择1个站点"}));
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    $("#selectStationPoint").append($("<option>", {value: i + 1,
                        text: i + 1 + ". " + stationMarkers[i].getPosition().lng + ", " + stationMarkers[i].getPosition().lat}));
                }
            };
        
        var eventBackToSecondStep =
            function(e)
            {
                polyline.removeEventListener("click", eventAddTriggerPoint);
                polyline.addEventListener("click", eventAddStationPoint);
                
                $("#divThirdStep").fadeOut(function() {$("#divSecondStep").fadeIn();} );
                $("#divHelpThirdStep").fadeOut(function() {$("#divHelpSecondStep").fadeIn();} );
                
                var stationMarkersLength = stationMarkers.length;
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    stationMarkers[i].setAnimation(null);
                }
            };
        
        var eventAddStationPoint =
            function(e)
            {
                var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
                var label = new BMap.Label((stationMarkers.length + 1).toString());
                label.setOffset(new BMap.Size(-13, 2));
                marker.setLabel(label);
                map.addOverlay(marker);
                
                stationMarkers.push(marker);
                var stationMarkersLength = stationMarkers.length;
                
                $("#inputStationPoints").html("");
                
                var stationPoints = [];
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    var stationPoint = {sequence: i + 1, 
                        longitude: stationMarkers[i].getPosition().lng, latitude: stationMarkers[i].getPosition().lat};
                    stationPoints.push(stationPoint);
                    var num = i + 1;
                    $("#inputStationPoints").html($("#inputStationPoints").html() + 
                        num + ". " + stationMarkers[i].getPosition().lng + ", " + stationMarkers[i].getPosition().lat + ";\n");
                }
                
                $("#hiddenStationPoints").val("");
                $("#hiddenStationPoints").val(JSON.stringify(stationPoints));
            };
        
        var eventResetStationPoints =
            function(e)
            {
                $("#hiddenStationPoints").val("");
                $("#inputStationPoints").html("");
                
                var stationMarkersLength = stationMarkers.length;
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    map.removeOverlay(stationMarkers[i]);
                }
                
                stationMarkers = [];
            };
        
        var eventRemoveStationPoint =
            function(e)
            {
                if (stationMarkers.length > 0)
                {
                    map.removeOverlay(stationMarkers[stationMarkers.length - 1]);
                    stationMarkers.pop();
                    
                    var stationMarkersLength = stationMarkers.length;
                    
                    $("#inputStationPoints").html("");
                    
                    var stationPoints = [];
                
                    for (var i = 0; i < stationMarkersLength; i++)
                    {
                        var stationPoint = {sequence: i + 1, 
                            longitude: stationMarkers[i].getPosition().lng, latitude: stationMarkers[i].getPosition().lat};
                        stationPoints.push(stationPoint);
                        var num = i + 1;
                        $("#inputStationPoints").html($("#inputStationPoints").html() + 
                            num + ". " + stationMarkers[i].getPosition().lng + ", " + stationMarkers[i].getPosition().lat + ";\n");
                    }

                    $("#hiddenStationPoints").val("");
                    $("#hiddenStationPoints").val(JSON.stringify(stationPoints));
                }
            };
        
        var eventStationPointChange =
            function(e)
            {
                var stationMarkersLength = stationMarkers.length;
                
                for (var i = 0; i < stationMarkersLength; i++)
                {
                    stationMarkers[i].setAnimation(null);
                }
                
                if (parseInt(e.target.value) === 0)
                {
                    polyline.removeEventListener("click", eventAddTriggerPoint);
                }
                else if (parseInt(e.target.value) > 0)
                {
                    polyline.removeEventListener("click", eventAddTriggerPoint);
                    polyline.addEventListener("click", eventAddTriggerPoint);
                    stationMarkers[parseInt(e.target.value - 1)].setAnimation(BMAP_ANIMATION_BOUNCE);
                }
            };
        
        var eventAddTriggerPoint =
            function(e)
            {
                alert("trigger point");
            };
        
        map.addEventListener("click", eventAddingPoints);
        polyline.addEventListener("lineupdate", lineUpdate);
        
        $("#btnReset").click(eventReset);
        $("#btnRemovePoint").click(eventRemovePoint);
        $("#btnGoToSecondStep").click(eventGoToSecondStep);
        $("#btnBackToFirstStep").click(eventBackToFirstStep);
        $("#btnGoToThirdStep").click(eventGoToThirdStep);
        $("#btnBackToSecondStep").click(eventBackToSecondStep);
        $("#btnResetStationPoints").click(eventResetStationPoints);
        $("#btnRemoveStationPoint").click(eventRemoveStationPoint);
        $("#selectStationPoint").change(eventStationPointChange);
    </script>
</div>