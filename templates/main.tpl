<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Вітаємо в Коломиї</title>
    <meta name="description" content="Туристичний органайзер для гостей міста Коломиї">
    <link rel="stylesheet" href="/images/css/style.css">
    <link rel="stylesheet" href="/images/css/bootstrap.min.css">
    <link rel="stylesheet" href="/images/css/font-awesome.min.css">
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
                </div>
            </div>
        </div>
    </section>
</main>


<script src="/images/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>


<script>
    var map, infoWindow;
    var markers = [];


    function initMap() {

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 48.528344, lng: 25.039988},
            zoom: 14
        });

        infoWindow = new google.maps.InfoWindow;

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                var marker = new google.maps.Marker({
                    position: pos,
                    map: map,
                    title: 'Ваше розташування!',

                });
                marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');




            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    }



    function createMarker(latitude, langitude, title) {
        var marker = new google.maps.Marker({
            position: {lat: latitude, lng: langitude},
            map: map,
            title: title
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



    jQuery('.moveItem').click(function() {


        if (jQuery(this).parents('#selectedList').length) {

            setTimeout(function() {
                deleteMarkers();
                jQuery('#selectedList').find('li').each(function() {
                    var langitude = Number(jQuery(this).attr('data-lng'));
                    var latitude = Number(jQuery(this).attr('data-lat'));

                    createMarker(latitude, langitude, jQuery(this).find('.list_title')[0].innerHTML);
                });
//                console.log(markers);

                showMarkers();
            }, 100);

        } else {

            var langitude = Number(jQuery(this).parents('.group-item').attr('data-lng'));
            var latitude = Number(jQuery(this).parents('.group-item').attr('data-lat'));
            createMarker(latitude, langitude, jQuery(this).siblings('.list_body').children('.list_title').text());

            setMapOnAll(map);

        }
    });

    if (jQuery.cookie('items')) {
        jQuery(window).on('load', function () {
            var arr = JSON.parse(jQuery.cookie('items'));
            console.log("Coookies");
            console.log(arr);

            for (var i = 0; i < arr.length; i++) {
                var langitude = Number(jQuery('#' + arr[i]).attr('data-lng'));
                var latitude = Number(jQuery('#' + arr[i]).attr('data-lat'));
                console.log(langitude);
                console.log(latitude);
                createMarker(latitude, langitude, "");

                setMapOnAll(map);
            }

        });

    }

//    jQuery('#loadMap').click(function() {
//        jQuery('#selectedList').find('li').each(function() {
//            var langitude = Number(jQuery(this).attr('data-lng'));
//            var latitude = Number(jQuery(this).attr('data-lat'));
//
//
//            var infowindow = new google.maps.InfoWindow({
//                content: jQuery(this).find('.list_title')[0].innerHTML
//            });
//
//            var marker = new google.maps.Marker({
//                position: {lat: latitude, lng: langitude},
//                map: map,
//                title: jQuery(this).find('.list_title')[0].innerHTML
//            });
//
//            marker.addListener('click', function() {
//                infowindow.open(map, marker);
//            });
//
//
//        });
//    });





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
<script src="/images/js/index.js"></script>
<script src="/images/js/bootstrap.min.js"></script>
</body>
</html>
