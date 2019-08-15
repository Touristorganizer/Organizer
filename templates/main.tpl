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
<body class="preload_body">
<!-- Preloader -->
<div class="preloader">
  <div class="loader"></div>
  <div class="loader"></div>
  <div class="loader"></div>
  <div class="loader"></div>
  <div class="loader"></div>
</div>


<!-- main page -->
  <div class="back_img" style="display: none;">
    <div class="section-organaizer">
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
    </div>
  </div>
</body>
</html>

<script src="/organizer/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJe0Bq1p8kT6s8fJbHX5pBdG8XZoBHVT0&callback=initMap"
        async defer></script>
<script src="/organizer/js/index.js"></script>
<script src="/organizer/js/bootstrap.min.js"></script>