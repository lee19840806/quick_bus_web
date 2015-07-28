<div data-role="header" data-position="fixed" data-add-back-btn="true">
    <h1>班车选择</h1>
</div>

<div class="ui-content">
    <ul data-role="listview" data-filter="true" data-filter-placeholder="搜索班车" data-inset="true">
        <?php 
        if (count($routes) == 0)
        {
            echo '<li><strong>本店暂无班车位置查询</strong></li>';
        }
        
        foreach ($routes as $id => $name)
        {
            echo '<li><a href="/QuickBusApp/route_position/' . $id . '">' . $name . '</a></li>';
        }
        ?>
    </ul>
</div>