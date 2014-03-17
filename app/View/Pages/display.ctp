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
                    <label class="control-label" id="labelRouteName">路线名</label>
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
                    <label class="control-label" id="labelTriggerPoint">依次选择站点，然后添加触发点</label>
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
    <div class="col-md-9" id="Leaflet_map" style="height: 520px">
    </div>
    
    <script type="text/javascript">
        var map = L.map('Leaflet_map').setView([31.23, 121.5], 13);
        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
            {attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a>'}).addTo(map);
            
        var myIcon = L.icon({
            iconUrl: '/img/marker-icon.png',
            iconRetinaUrl: '/img/marker-icon-2x.png',
            iconSize: [25, 41],
            iconAnchor: [15, 40],
            popupAnchor: [-3, -35],
            shadowUrl: '/img/marker-shadow.png',
            shadowRetinaUrl: '/img/marker-shadow.png',
            shadowSize: [41, 41],
            shadowAnchor: [15, 40]
        });

        L.marker([31.23, 121.5], {icon: myIcon}).addTo(map);
        
        var latlngs = [L.latLng(31.23, 121.5), L.latLng(31.23, 121.6)];
        var polyline = L.polyline(latlngs, {color: 'blue', opacity: 0.6});
        polyline.addTo(map);
        polyline.editing.enable();
        
        var stationMarkers = [];
        var triggerMarkers = [];
        
        var disableEventAddingPoints = 0;
        var justRemovedPoint = 0;
        
        function getTriggerPonitHeading(lng, lat, path)
        {
            var distances = [];
            var distancesTemp = [];
            var x0 = lng;
            var y0 = lat;
            
            var pathLength = path.length;

            for (var i = 0; i < pathLength - 1; i++)
            {
                var x1 = path[i].lng;
                var y1 = path[i].lat;
                var x2 = path[i + 1].lng;
                var y2 = path[i + 1].lat;
                var dx = x1 - x2;
                var dy = y1 - y2;
                
                var xInTheRange = (x0 >= x1 && x0 < x2) || (x0 > x2 && x0 <= x1);
                var yInTheRange = (y0 >= y1 && y0 < y2) || (y0 > y2 && y0 <= y1);

                if (xInTheRange && yInTheRange)
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
            
            var endingPoint = path[endingPointIndex];
            
            var headingY = Math.sin(endingPoint.lng - x0) * Math.cos(endingPoint.lat);
            var headingX = Math.cos(y0) * Math.sin(endingPoint.lat) -
                Math.sin(y0) * Math.cos(endingPoint.lat) * Math.cos(endingPoint.lng - x0);
            var headingInDegrees = (Math.atan2(headingY, headingX) * 180) / Math.PI;
            var headingInDegreesNormalized = (headingInDegrees + 360) % 360;
            
            return headingInDegreesNormalized;
        }
    </script>
</div>