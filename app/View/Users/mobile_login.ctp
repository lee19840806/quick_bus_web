<div class="row">
    <div class="col-xs-12">
        <form class="form" action="/Users/mobile_login" method="post">
            <div class="form-group">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><strong>账号</strong></span>
                    <input type="text" name="data[User][username]" class="form-control" placeholder="输入账号" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><strong>密码</strong></span>
                    <input type="password" name="data[User][password]" class="form-control" placeholder="输入密码" required="required">
                </div>
            </div>
            <div class="btn-group btn-group-justified">
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary btn-lg" name="LogIn"><strong>登&nbsp;&nbsp;&nbsp;&nbsp;录</strong></button>
                </div>
                <a href="/Users/register" class="btn btn-success btn-lg" role="button" style="margin-left: 30px"><strong>注&nbsp;&nbsp;&nbsp;&nbsp;册</strong></a>
            </div>
            <div class="form-group has-error">
                <label class="control-label" style="margin-left: 15px"><?php echo $this->Session->flash(); ?></label>
            </div>
        </form>
    </div>
</div>
