function getTriggerPonitHeading(lng, lat, latLngs)
{
    var distances = [];
    var distancesTemp = [];
    var x0 = lng;
    var y0 = lat;
    
    var pathLength = latLngs.length;

    for (var i = 0; i < pathLength - 1; i++)
    {
        var x1 = latLngs[i].lng;
        var y1 = latLngs[i].lat;
        var x2 = latLngs[i + 1].lng;
        var y2 = latLngs[i + 1].lat;
        var dx = x1 - x2;
        var dy = y1 - y2;
        
        var xInTheRange = (x0 >= x1 && x0 < x2) || (x0 > x2 && x0 <= x1);
        var yInTheRange = (y0 >= y1 && y0 < y2) || (y0 > y2 && y0 <= y1);

        if (xInTheRange || yInTheRange)
        {
            var dist = Math.abs((dy * x0) - (dx * y0) + (x1 * y2) - (x2 * y1)) / Math.sqrt((dx * dx) + (dy * dy));
            distances.push({index: i, distance: dist});
            distancesTemp.push(dist);
        }
    }
    
    var minDistance = Math.min.apply(null, distancesTemp);
    var endingPointIndex = 0;
    
    for (var i = 0; i < distances.length; i++)
    {
        var d = distances[i].distance;
        if (distances[i].distance === minDistance)
        {
            endingPointIndex = distances[i].index + 1;
        }
    }
    
    var endingPoint = latLngs[endingPointIndex];
    var startingPoint = latLngs[endingPointIndex - 1];
    
    var headingY = Math.sin(endingPoint.lng - startingPoint.lng) * Math.cos(endingPoint.lat);
    var headingX = Math.cos(startingPoint.lat) * Math.sin(endingPoint.lat) -
        Math.sin(startingPoint.lat) * Math.cos(endingPoint.lat) * Math.cos(endingPoint.lng - startingPoint.lng);
    var headingInDegrees = (Math.atan2(headingY, headingX) * 180) / Math.PI;
    var headingInDegreesNormalized = (headingInDegrees + 360) % 360;
    
    return headingInDegreesNormalized;
}

function sqr(x)
{
	return x * x;
}

function dist2(v, w)
{
	return sqr(v.x - w.x) + sqr(v.y - w.y);
}

function distToSegmentSquared(p, v, w)
{
    var l2 = dist2(v, w);
    
   	if (l2 == 0) return dist2(p, v);
    
  	var t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
    
  	if (t < 0) return dist2(p, v);
  	if (t > 1) return dist2(p, w);
    
  	return dist2(p, { x: v.x + t * (w.x - v.x), y: v.y + t * (w.y - v.y) });
}

function distToSegment(p, v, w)
{
	return Math.sqrt(distToSegmentSquared(p, v, w));
}

function createTrigger(marker, heading)
{
	var trigger = new Object;
	trigger.marker = marker;
	trigger.heading = heading;
	return trigger;
}

function createStation(marker, sequence, name, trigger)
{
	var station = new Object;
	station.marker = marker;
	station.sequence = sequence;
	station.name = name;
	station.trigger = trigger;
	return station;
}

function createRoute(id, name, polyline, stations)
{
	var route = new Object;
	route.id = id;
	route.name = name;
	route.polyline = polyline;
	route.stations = stations;
	return route;
}

function initializeRoute(routeJSON, stationsAndTriggersJSON)
{
	var stationIcon = L.icon({
	    iconUrl: '/img/station.png', 
	    iconSize: [32, 32], 
	    iconAnchor: [16, 31], 
	    popupAnchor: [0, -30]});

	var stationEditingIcon = L.icon({
	    iconUrl: '/img/station_editing.png', 
	    iconSize: [32, 32], 
	    iconAnchor: [16, 31], 
	    popupAnchor: [0, -30]});

	var triggerIcon = L.icon({
	    iconUrl: '/img/trigger.png', 
	    iconSize: [32, 32], 
	    iconAnchor: [16, 31], 
	    popupAnchor: [0, -30]});
	
	var polyline = L.polyline([], {color: 'blue', opacity: 0.6});
	var stations = new Array();
	
	for (var i = 0; i < stationsAndTriggersJSON.length; i++)
    {
    	var stationMarker = L.marker(L.latLng(stationsAndTriggersJSON[i].ViewUserRouteDetail.station_lat, stationsAndTriggersJSON[i].ViewUserRouteDetail.station_lng),
    		{icon: stationIcon});
    	stationMarker.bindPopup("站点" + (i + 1) + " " + stationsAndTriggersJSON[i].ViewUserRouteDetail.station_name);

    	var triggerMarker = L.marker(L.latLng(stationsAndTriggersJSON[i].ViewUserRouteDetail.trigger_lat, stationsAndTriggersJSON[i].ViewUserRouteDetail.trigger_lng),
            {icon: triggerIcon});
    	triggerMarker.bindPopup("触发点" + (i + 1));
    	
    	var trigger = createTrigger(triggerMarker, stationsAndTriggersJSON[i].ViewUserRouteDetail.trigger_heading);
    	var station = createStation(stationMarker, stationsAndTriggersJSON[i].ViewUserRouteDetail.station_sequence,
			stationsAndTriggersJSON[i].ViewUserRouteDetail.station_name, trigger);
    	
    	stations.push(station);
    	
    	sumLat = sumLat + parseFloat(routeJSON.UserRoutePoint[i].latitude);
    	sumLng = sumLng + parseFloat(routeJSON.UserRoutePoint[i].longitude);
    }
	
	var sumLat = 0;
	var sumLng = 0;
	var numberOfRoutePoints = routeJSON.UserRoutePoint.length;
	
	for (var i = 0; i < numberOfRoutePoints; i++)
	{
		polyline.addLatLng(L.latLng(routeJSON.UserRoutePoint[i].latitude, routeJSON.UserRoutePoint[i].longitude));
		
		sumLat = sumLat + parseFloat(routeJSON.UserRoutePoint[i].latitude);
    	sumLng = sumLng + parseFloat(routeJSON.UserRoutePoint[i].longitude);
	}
	
	var mapCenter = new Object();
	mapCenter.lat = sumLat / numberOfRoutePoints;
	mapCenter.lng = sumLng / numberOfRoutePoints;
	
	var route = createRoute(routeJSON.UserRoute.id, routeJSON.UserRoute.name, polyline, stations);
	
	var returnObject = new Object();
	returnObject.route = route;
	returnObject.mapCenter = mapCenter;
	returnObject.stationIcon = stationIcon;
	returnObject.stationEditingIcon = stationEditingIcon;
	returnObject.triggerIcon = triggerIcon;

	return returnObject;
}







