<html lang="ua" class="mdl-js">
<!--<style type="text/css" id="block-image-video"></style>-->
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Вітаємо в Коломиї</title>
	<meta name="description" content="Туристичний органайзер для гостей міста Коломиї">
	<link rel="shortcut icon" href="">
	<link rel="stylesheet" href="/images/css/bootstrap.min.css">
	<link href="/images/css/header.css" rel="stylesheet">
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
<body data-spy="scroll" data-offset="0" data-target="#theMenu" style="" class="">
<div id="headerwrap">
	<div class="darkbg">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<h1 class="title">Вітаємо в Коломиї</h1>
					<h2>Сплануй свій час в нашому місті</h2>
					<div class="btn-group btn-group-md" role="group">
					  <a href="/organizer.cgi" class="btn btn-primary btn-lg for_group" role="button">
					  		<i style="font-size: 20px;padding-bottom: 8px;" class="fa fa-cutlery"></i>
					  		<br> Їжа
					  </a>
	  				  <a href="/organizer.cgi" class="btn btn-info btn-lg for_group" role="button">
	  				  		<i style="font-size: 20px;padding-bottom: 8px;" class="fa fa-futbol-o"></i><br> Розваги
	  				  </a>
    					<a href="/organizer.cgi" class="btn btn-warning btn-lg for_group" role="button">
    							<i style="font-size: 20px;padding-bottom: 8px;" class="fa fa-bed"></i><br> Нічліг
    					</a>
					  <a href="/organizer.cgi" class="btn btn-danger btn-lg for_group" role="button">
					  		<i style="font-size: 20px;padding-bottom: 8px;" class="fa fa-calendar"></i><br> Події
					  </a>
				    </div>
					<div class="icon">
						<a target="_blank" href="https://www.facebook.com/%D0%A2%D1%83%D1%80%D0%B8%D1%81%D1%82%D0%B8%D1%87%D0%BD%D0%B8%D0%B9-%D0%BE%D1%80%D0%B3%D0%B0%D0%BD%D0%B0%D0%B9%D0%B7%D0%B5%D1%80-1871874569784871/" class=" favicon"><i class="fa fa-facebook"></i>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- --/row ---->
		

	</div>
	<!-- --/container ---->

</div>
<!-- --/headerwrap ---->
<script src='/images/js/jquery.min.js'></script>
<script src="/images/js/bootstrap.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/lettering.js/0.7.0/jquery.lettering.min.js'></script>
<script>
    jQuery(document).ready(function () {
        jQuery(".title").lettering();
        jQuery(".button").lettering();
		jQuery("#headerwrap").fadeIn(100);
    });

    jQuery(document).ready(function () {
        animation();
    }, 1000);

    function animation() {
        var title1 = new TimelineMax();
        title1.to(".button", 0, { visibility: 'hidden', opacity: 0 });
        title1.staggerFromTo(".title span", 0.5,
            { ease: Back.easeOut.config(1.7), opacity: 0, bottom: -80 },
            { ease: Back.easeOut.config(1.7), opacity: 1, bottom: 0 }, 0.05);
        title1.to(".button", 0.2, { visibility: 'visible', opacity: 1 });
    }
	

</script>
</body>
</html>