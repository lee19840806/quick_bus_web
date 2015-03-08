<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="col-sm-12">
            <form class="form-horizontal" action="/Users/login" method="post">
                <div style="display:none;">
                    <input type="hidden" name="_method" value="POST"/>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">账号</label>
                    <div class="col-md-9">
                        <input type="text" name="data[User][username]" class="form-control" placeholder="输入账号" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">密码</label>
                    <div class="col-md-9">
                        <input type="password" name="data[User][password]" class="form-control" placeholder="输入密码" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary" name="LogIn">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </div>
                <div class="form-group has-error">
                    <div class="col-md-offset-3">
                        <label class="control-label" style="margin-left: 15px"><?php echo $this->Session->flash(); ?></label>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>
