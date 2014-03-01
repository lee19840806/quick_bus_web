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
                    <label class="col-md-3 control-label">User&nbsp;Name</label>
                    <div class="col-md-9">
                        <input type="text" name="data[User][username]" class="form-control" placeholder="User Name" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Password</label>
                    <div class="col-md-9">
                        <input type="password" name="data[User][password]" class="form-control" placeholder="Password" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <p class="help-block col-md-offset-3">Use this account: User Name "admin", Password "123456"</p>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-info">Log&nbsp;In</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>
