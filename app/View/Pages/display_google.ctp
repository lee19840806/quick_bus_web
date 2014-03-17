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
                <input type="hidden" name="triggerPoints" id="hiddenTriggerPoints"/>
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
    <div class="col-md-9" id="baidu_map" style="height: 520px">
    </div>
    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBF3ULx-evRPfmbZnXWQ5wGVoRYZnAjjfc&sensor=false"></script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-34.397, 150.644),
          zoom: 8
        };
        var map = new google.maps.Map(document.getElementById("baidu_map"), mapOptions);
      }
      
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</div>