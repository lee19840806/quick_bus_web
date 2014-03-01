<div class="row" style="margin-bottom: -15px">
    <ul class="nav nav-pills pull-right">
        <li style="margin-top: 20px">
            <?php
                if (!$this->Session->read('Users.username'))
                {
                    echo '<li style="margin-top: 20px"><a href="/Users/login"><strong>Log&nbsp;In</strong></a></li>';
                }
                else
                {
                    echo '<li style="margin-top: 20px"><a href="/Users/logout"><strong>'
                        . $this->Session->read('Users.username')
                        . ', Log Out</strong></a></li>';
                }
            ?>
        </li>
        <li style="margin-top: 20px"><a href="#"><strong>About</strong></a></li>
        <li style="margin-top: 20px"><a href="#"><strong>Contact Us</strong></a></li>
    </ul>
    <h2><strong>Quick Bus</strong></h2>
</div>
<div class="row">
    <hr />
</div>