<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jENePgN7TufGt711E1uIb7BA"></script>
<div class="row">
    <div class="col-md-3">
        <h4>How to use?</h4>
        <ol style="padding-left: 20px">
            <li>Set a <strong>unique</strong> route name</li>
            <li><strong>Click the map</strong> to add navigation points (at least 2 points)</li>
            <li>Click the button <strong>"Submit"</strong></li>
        </ol>
        <div><hr/></div>
        <form class="form-horizontal" action="/UserRoutes/submit" method="post">
            <div style="display:none;">
                <input type="hidden" name="_method" value="POST"/>
            </div>
            <div class="form-group">
                <label class="col-md-5 control-label">Route&nbsp;Name</label>
                <div class="col-md-7">
                    <input type="text" name="data[UserRoute][name]" class="form-control" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="pull-left control-label" style="margin-left: 15px">Points&nbsp;Selected</label>
                <div class="col-md-12">
                    <textarea class="form-control input-sm" id="points" name="data[UserRoute][points]" rows="6" readonly></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <button type="button" class="btn btn-warning btn-xs" id="btnReset">Reset</button>
                    <button type="button" class="btn btn-warning btn-xs" id="btnRemovePoint">Remove&nbsp;Last&nbsp;Point</button>
                </div>
            </div>
            <div><hr/></div>
            <div class="form-group">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary btn-block">Submit The Route</button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
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
        
        map.addEventListener("click", eventAddingPoints);
        polyline.addEventListener("lineupdate", lineUpdate);
        $("#btnReset").click(eventReset);
        $("#btnRemovePoint").click(eventRemovePoint);
    </script>
</div>