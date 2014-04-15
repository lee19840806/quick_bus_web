<div class="row">
    <div class="col-md-3">
        <div id="welcome">
            <strong>编辑站点及接受短信的手机号码</strong>
            <ol style="padding-left: 20px">
                <li>点击站点对应的“编辑”按钮</li>
                <li>输入手机号码，以逗号分隔</li>
                <li>点击按钮“保存所作修改”</li>
            </ol>
        </div>
        <div><hr/></div>
    </div>
    <div class="col-md-9" id="showStations" style="height: 520px">
        <div>
            <strong><?php echo $route['UserRoute']['name']; ?>，编辑报站手机号码，或者</strong>
            <a class="btn btn-primary btn-sm" href="/UserRoutes/index" role="button">返回线路管理面板</a>
        </div>
        <div><hr/></div>
        <form class="col-md-12" action="/UserStationPoints/submitPhoneNumbers" method="post">
            <?php $i = 0; ?>
            <?php foreach ($route['UserStationPoint'] as $station): ?>
            <div class="form-group">
                <input type="hidden" name="data[stationInfo][<?php echo $i; ?>][stationID]" value="<?php echo $station['id']; ?>">
                <label><?php echo "站点" . $station['sequence'] . "：" . $station['name']; ?></label>
                <input type="text" class="form-control input-sm" name="data[stationInfo][<?php echo $i; ?>][phoneNumbers]" placeholder="多个手机号码，使用逗号分隔">
            </div>
            <div><hr/></div>
            <?php $i = $i + 1; ?>
            <?php endforeach; ?>
            <button type="submit" class="btn btn-block btn-primary">提交所有手机号</button>
        </form>
    </div>
</div>
