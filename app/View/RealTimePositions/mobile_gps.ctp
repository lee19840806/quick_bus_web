<div class="row">
    <div><p id="geo_support">GPS: </p></div>
    <div><p>当前线路ID：<?php echo $routeID; ?></p></div>
    
    <script type="text/javascript">
        var x = document.getElementById("geo_support");
        
        function getLocation()
        {
            if (navigator.geolocation)
            {
                navigator.geolocation.getCurrentPosition(showPosition);
            }
            else
            {
                x.innerHTML = "此浏览器不支持GPS坐标发送。请更换浏览器";
            }
        }
        
        function showPosition(position)
        {
            x.innerHTML = "Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude;	
        }
        
        $(document).ready(getLocation);
    </script>
</div>