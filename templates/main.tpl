<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Вітаємо в Коломиї</title>
    <meta name="description" content="Туристичний органайзер для гостей міста Коломиї">
    <link rel="stylesheet" href="/organizer/css/style.css">
    <link rel="stylesheet" href="/organizer/css/bootstrap.min.css">
    <link rel="stylesheet" href="/organizer/css/font-awesome.min.css">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123733885-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-123733885-1');
    </script>
</head>
<body>

<main class="back_img">
    <section class="section-organaizer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12 left-list">
                    %CONTENT%
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="panel" style="background-color: springgreen;">
                        <div class="panel-heading">
                        <p class="panel_text">Ваш вибір:</p>
                        </div>
                        <div class="panel-body" style="padding: 0;">
                            <ul class="list-group" style="margin: 0;" id="selectedList"></ul>
                        </div>
                        <div class="panel-footer panel_footer">Загальна тривалість маршруту <span id="summBox"></span> год.
                        </div>
                    </div>
                    <div id="map"></div>

                 <a href="?offer_info=1" class="btn btn-success btn-lg active center-block" role="button" style="margin-top: 5%">_{OFFER}_</a>
                </div>
            </div>
            
        </div>
    </section>
</main>


<script src="/organizer/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>


<script>
    
    var map, infoWindow;
    var markers = [];

    var userPosition;


    function initMap() {

        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 48.528344, lng: 25.039988},
            zoom: 14
        });

        directionsDisplay.setMap(map);

        infoWindow = new google.maps.InfoWindow;

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                userPosition = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                calculateAndDisplayRoute(directionsService, directionsDisplay, userPosition);

                console.log("User Position");
                console.log(userPosition);

                var marker = new google.maps.Marker({
                    position: userPosition,
                    map: map,
                    title: 'Ваше розташування!',

                });
                marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');




            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            userPosition = {lat: 48.528344, lng: 25.039988};
            handleLocationError(false, infoWindow, map.getCenter());
            calculateAndDisplayRoute(directionsService, directionsDisplay, userPosition);
        }

        jQuery('.moveItem').click(function() {
            calculateAndDisplayRoute(directionsService, directionsDisplay, userPosition);
        });

        if (localStorage.getItem('items')) {
            jQuery(window).on('load', function () {
                var arr = JSON.parse(localStorage.getItem('items'));
                console.log("Coookies");
                console.log(arr);

                for (var i = 0; i < arr.length; i++) {
                    var langitude = Number(jQuery('#' + arr[i]).attr('data-lng'));
                    var latitude = Number(jQuery('#' + arr[i]).attr('data-lat'));
                    console.log("Longitude");
                    console.log(langitude);
                    console.log("Latitude");
                    console.log(latitude);
                    createMarker(latitude, langitude, jQuery('#' + arr[i]).find('.list_title')[0].innerHTML);
                    setMapOnAll(map);
                }

            });

        }

    }

    function createMarker(latitude, langitude, title) {
        var marker = new google.maps.Marker({
            position: {lat: latitude, lng: langitude},
            map: map,
            title: title,
            icon: "https://codeshare.co.uk/images/blue-pin.png"
        });

        var infowindow = new google.maps.InfoWindow({
            content: title
        });

        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });

        markers.push(marker);
    }

    function clearMarkers() {
        setMapOnAll(null);
    }

    function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }

    function deleteMarkers() {
        clearMarkers();
        markers = [];
    }

    function showMarkers() {
        setMapOnAll(map);
    }

    function calculateAndDisplayRoute(directionsService, directionsDisplay, userPosition) {

        var waypts = [];
        deleteMarkers();
        jQuery('#selectedList').find('li').each(function() {
            var langitude = Number(jQuery(this).attr('data-lng'));
            var latitude = Number(jQuery(this).attr('data-lat'));

            createMarker(latitude, langitude, jQuery(this).find('.list_title')[0].innerHTML);

            waypts.push({
                location: {lat: latitude, lng: langitude},
                stopover: true
            });

        });
        showMarkers();






        console.log("Точки");
        console.log(waypts);

        directionsService.route({
            origin: userPosition,
            destination: waypts[waypts.length - 1].location,
            waypoints: waypts,
            optimizeWaypoints: false,
            travelMode: 'WALKING'
        }, function(response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
                var route = response.routes[0];
                var summaryPanel = document.getElementById('directions-panel');
                summaryPanel.innerHTML = '';
                // For each route, display summary information.
                for (var i = 0; i < route.legs.length; i++) {
                    var routeSegment = i + 1;
                    summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                        '</b><br>';
                    summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                    summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                    summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                }
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });

    }

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
    }


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJe0Bq1p8kT6s8fJbHX5pBdG8XZoBHVT0&callback=initMap"
        async defer></script>
<script src="/organizer/js/index.js"></script>
<script src="/organizer/js/bootstrap.min.js"></script>
</body>
</html>
