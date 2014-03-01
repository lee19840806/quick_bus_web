<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="col-sm-12">
            <div class="bg-warning">
                <?php echo $this->Session->flash(); ?>
            </div>
            <form class="form-horizontal" action="/Users/login" method="post">
                <div style="display:none;">
                    <input type="hidden" name="_method" value="POST"/>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">账号</label>
                    <div class="col-md-9">
                        <input type="text" name="data[User][username]" class="form-control" placeholder="User Name" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">密码</label>
                    <div class="col-md-9">
                        <input type="password" name="data[User][password]" class="form-control" placeholder="Password" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="help-block col-md-offset-3">
                        <p class="help-block" style="margin-left: 15px">临时账号: 账号 - "admin", 密码 - "123456"</p>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-info">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>
