<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<div class="row">
    <div class="col-md-3">
        <strong>如何使用</strong>
        <ol style="padding-left: 20px">
            <li>输入一个唯一的路线名（字母+数字）</li>
            <li>点击地图，添加或修改路线</li>
            <li>点击“提交此路线”</li>
        </ol>
        <div><hr/></div>
        <form class="col-md-12 form-horizontal" id="formRouteInfo" action="/UserRoutes/submit" method="post">
            <div style="display:none;">
                <input type="hidden" name="_method" value="POST"/>
            </div>
            <div class="form-group">
                <label class="pull-left control-label">路线名</label>
                <div>
                    <input type="text" name="data[UserRoute][name]" class="form-control" id="inputRouteName" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="pull-left control-label">已添加以下导航点</label>
                <div>
                    <textarea class="form-control input-sm" id="points" name="data[UserRoute][points]" rows="6" readonly></textarea>
                </div>
            </div>
            <div class="form-group">
                    <button type="button" class="btn btn-warning btn-xs" id="btnReset">重置</button>
                    <button type="button" class="btn btn-warning btn-xs" id="btnRemovePoint">删除一个导航点</button>
            </div>
            <div class="form-group">
                <div>
                    <button type="button" class="btn btn-primary btn-block" id="btnSubmit"><strong>提交此线路</strong></button>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <input type="hidden" name="navPoints" id="hidden_vars"/>
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
        
        var polyline = new BMap.Polyline([], {strokeColor: "blue", strokeWeight: 5, strokeOpacity: 0.5});
        map.addOverlay(polyline);
        
        var disableEventAddingPoints = 0;
        var justRemovedPoint = 0;
        
        var eventReset =
            function(e)
            {
                $("#hidden_vars").val("");
                $("#points").html("");
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

                $("#points").html("");
                
                var navPoints = [];
                
                for (var i = 0; i < pathLength; i++)
                {
                    var myPoint = {sequence: i + 1, longitude: path[i].lng, latitude: path[i].lat};
                    navPoints.push(myPoint);
                    var num = i + 1;
                    $("#points").html($("#points").html() + num + ". " + path[i].lng + ", " + path[i].lat + ";\n");
                }
                
                $("#hidden_vars").val("");
                $("#hidden_vars").val(JSON.stringify(navPoints));
            };
            
        var eventBeforeRouteSubmit =
            function(e)
            {
                if ($("#inputRouteName").val() === "")
                {
                    alert("请填写一个有效的路线名");
                    $("#inputRouteName").fadeOut();
                    $("#inputRouteName").fadeIn();
                    $("#inputRouteName").focus();
                    return;
                }
                
                if (polyline.getPath().length < 2)
                {
                    alert("请至少在地图上点取2个导航点，组成有效的线路");
                    $("#baidu_map").fadeOut();
                    $("#baidu_map").fadeIn();
                    $("#baidu_map").focus();
                    return;
                }
                
                $.ajax(
                    {
                        url: "/UserRoutes/ajaxCheckRouteName",
                        data: {routeName: $("#inputRouteName").val()},
                        type: "POST",
                        timeout: 1500,
                        success: function(result) {
                            if (result === "yes")
                            {
                                $("#formRouteInfo").submit();
                            }
                            else
                            {
                                alert("已存在相同的路线名，请输入一个新的路线名");
                                $("#inputRouteName").fadeOut();
                                $("#inputRouteName").fadeIn();
                                $("#inputRouteName").focus();
                            }
                        },
                        error: function(xhr, status) {
                            alert("无法提交线路，请稍后再试");
                        }
                    }
                );
            };
        
        map.addEventListener("click", eventAddingPoints);
        polyline.addEventListener("lineupdate", lineUpdate);
        $("#btnReset").click(eventReset);
        $("#btnRemovePoint").click(eventRemovePoint);
        $("#btnSubmit").click(eventBeforeRouteSubmit);
    </script>
</div>