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
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                        <p class="panel_text">Ваш вибір:</p>
                        </div>
                        <div class="panel-body" style="padding: 0;">
                            <ul class="list-group" style="margin: 0;" id="selectedList"></ul>
                        </div>
                        <div class="panel-footer panel_footer">Загальна тривалість маршруту <span id="summBox"></span> год. </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script src="/images/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/images/js/index.js"></script>
<script src="/images/js/bootstrap.min.js"></script>
</body>
</html>
