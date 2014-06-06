<div class="row">
    <div class="col-xs-12">
        <p id="prompt">初始化。请开启手机GPS。</p>
        <p id="warning"></p>
    </div>
    
    <script type="text/javascript">
        var warning = document.getElementById("warning");
        var prompt = document.getElementById("prompt");
        var watchID;
        
        function getLocation()
        {
            if (navigator.geolocation)
            {
                watchID = navigator.geolocation.watchPosition(showPosition, errorHandling, {enableHighAccuracy: true, maximumAge: 50000});
            }
            else
            {
                prompt.innerHTML = "此浏览器不支持GPS坐标发送，请更换浏览器";
            }
        }
        
        function showPosition(position)
        {
            warning.innerHTML = "纬度: " + position.coords.latitude + "<br>经度: " + position.coords.longitude +
                "<br>方向: " + position.coords.heading + "<br>速度: " + position.coords.speed;
            
            $.ajax({
                url: "/RealTimePositions/upload",
                type: "POST",
                data: {
                    "data[RealTimePosition][user_id]": <?php echo $userID; ?>,
                    "data[RealTimePosition][user_route_id]": <?php echo $routeID; ?>,
                    "data[RealTimePosition][latitude]": position.coords.latitude,
                    "data[RealTimePosition][longitude]": position.coords.longitude,
                    "data[RealTimePosition][heading]": position.coords.heading
                },
                timeout: 20000,
                success: function(result) {
                    if (result.toString() !== "0")
                    {
                        prompt.innerHTML = "方位信息上传有误，请联系网站管理员。(返回值非0)";
                    }
                    else
                    {
                        prompt.innerHTML = "方位信息正常。";
                    }
                },
                error: function(xhr, status) {
                    prompt.innerHTML = "方位信息上传有误，请联系网站管理员。(无法上传)";
                }
            });
        }
        
        function errorHandling(err)
        {
            
        }
        
        $(document).ready(getLocation);
    </script>
</div>