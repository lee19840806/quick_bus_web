<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>更改站点的名称</strong>
            <ol style="padding-left: 20px">
                <li>输入新的站点名称</li>
                <li>点击按钮“保存所有修改”</li>
            </ol>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showStations" style="height: 520px">
        <div>
            <strong><?php echo $route['UserRoute']['name']; ?>，编辑报站手机号码，或者</strong>
            <a class="btn btn-primary btn-sm" href="/UserRoutes/index" role="button">返回线路管理面板</a>
            <strong class="text-danger"><?php echo $this->Session->flash(); ?></strong>
        </div>
        <div><hr/></div>
        <form class="col-md-6" action="/UserStationPoints/submit_station" method="post">
            <?php $i = 0; ?>
            <?php foreach ($route['UserStationPoint'] as $station): ?>
            <div class="form-group">
                <input type="hidden" name="data[stationInfo][<?php echo $i; ?>][stationID]" value="<?php echo $station['id']; ?>">
                <label><?php echo "站点" . $station['sequence'] . "：" . $station['name']; ?></label>
                <input type="text" class="form-control" name="data[stationInfo][<?php echo $i; ?>][stationNewName]" 
                       placeholder="输入新的站点名称" value="<?php echo $station['name']; ?>">
            </div>
            <div><hr/></div>
            <?php $i = $i + 1; ?>
            <?php endforeach; ?>
            <button type="submit" class="btn btn-block btn-primary">保存所有修改</button>
        </form>
    </div>
</div>
