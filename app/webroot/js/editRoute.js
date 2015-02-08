function createTrigger(marker)
{
	var trigger = new Object;
	trigger.marker = marker;
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
    	stationMarker.bindPopup("站点: " + (i + 1) + "." + stationsAndTriggersJSON[i].ViewUserRouteDetail.station_name);

    	var triggerMarker = L.marker(L.latLng(stationsAndTriggersJSON[i].ViewUserRouteDetail.trigger_lat, stationsAndTriggersJSON[i].ViewUserRouteDetail.trigger_lng),
            {icon: triggerIcon});
    	triggerMarker.bindPopup("触发点: " + (i + 1));
    	
    	var trigger = createTrigger(triggerMarker);
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



















