<div data-role="header" data-position="fixed" data-add-back-btn="true">
    <h1>门店选择</h1>
</div>

<div class="ui-content">
    <ul data-role="listview" data-filter="true" data-filter-placeholder="搜索门店" data-inset="true">
        <?php 
        foreach ($stores as $store)
        {
            echo '<li><a data-transition="slide" data-prefetch="true" href="/QuickBusApp/route_select/' . $store['name'] . '">' . $store['store'] . '</a></li>';
        }
        ?>
    </ul>
</div>