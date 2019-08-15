// maps

    
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
// maps end
// preloader
  
    var myVar = setTimeout(showPage, 4000);
  function showPage() {
    jQuery(".preloader").hide();
    jQuery("body").removeClass("preload_body");
    jQuery(".back_img").show();
    jQuery("body").addClass("image");
  }
// preloader end

   
jQuery('.panel_header').click(function() {
    jQuery(this).siblings('.panel-body').slideToggle();
    jQuery(this).children('.toggleIcons').children().siblings().toggle();
});

dragDrop('.moveItem', '', '');

function dragDrop(item, firstParent, secondParent) {
    var arr = [];

    if (localStorage.getItem('items')) {
        var arr = JSON.parse(localStorage.getItem('items'));
        console.log(arr);

        for (var i = 0; i < arr.length; i++) {
            jQuery('#selectedList').append(jQuery('#' + arr[i]));
        }
    }

    jQuery( window ).on('load', (function() {
      var url = '';
      url = getUrlParams('events');
      jQuery( ".panel_header").each( function( index, element) {
       if ( jQuery(url).attr("event") === jQuery( element).attr( "id")) {
         jQuery(this).trigger( "click" );
      }
      // console.log(jQuery(url).attr("event") == jQuery( element).attr( "id"));
      });
           // console.log();
    }));
    

function getUrlParams( prop ) {
    var params = {};
    var search = decodeURIComponent( window.location.href.slice( window.location.href.indexOf( '?' ) + 1 ) );
    var definitions = search.split( '&' );

    definitions.forEach( function( val, key ) {
        var parts = val.split( '=', 2 );
        params[ parts[ 0 ] ] = parts[ 1 ];
    } );

    return ( prop && prop in params ) ? params[ prop ] : params;
}

    jQuery('#summBox').html(reculcPrice());
    // jQuery(this).children().siblings().toggle();

    jQuery(item).click(function() {
        var height = jQuery(this).parents('.group-item').outerHeight( true );

        if (jQuery(this).parents('#selectedList').length) {
            var parent = '#' + jQuery(this).parents('.group-item').attr('data-parent');
            jQuery(parent).append(jQuery(this).parents('.group-item').css({height: 0}).animate({height: height}));

            var indexOfItem = arr.indexOf(jQuery(this).parents('.group-item').attr('id'));
            arr.splice(indexOfItem);
            // console.log(arr);
        } else {
            jQuery('#selectedList').append(jQuery(this).parents('.group-item').css({height: 0}).animate({height: height}));

            arr.push(jQuery(this).parents('.group-item').attr('id'));
            // console.log(arr);
        }
        localStorage.setItem('items', JSON.stringify(arr));




        jQuery(this).children().siblings().toggle();
        jQuery('#summBox').html(reculcPrice());


    });

}


function reculcPrice() {
    var price = 0;
    jQuery('#selectedList').find('li').each(function() {
        price += +jQuery(this).attr('price') || 0;
    });
    return price;
}