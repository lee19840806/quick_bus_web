<div class="row" style="margin-bottom: -15px">
    <ul class="nav nav-pills pull-right">
        <li style="margin-top: 20px">
            <?php
                if (!$this->Session->read('Users.username'))
                {
                    echo '<li style="margin-top: 20px"><a href="/Users/login"><strong>登录系统</strong></a></li>';
                }
                else
                {
                    echo '<li style="margin-top: 20px"><a href="/Users/logout"><strong>'
                        . $this->Session->read('Users.username')
                        . ', 退出</strong></a></li>';
                }
            ?>
        </li>
        <li style="margin-top: 20px"><a href="/UserRoutes/index"><strong>路线管理</strong></a></li>
        <li style="margin-top: 20px"><a href="#"><strong>联系我们</strong></a></li>
    </ul>
    <h2><strong><a href="/">Quick Bus</a></strong></h2>
</div>
<div class="row">
    <hr />
</div>