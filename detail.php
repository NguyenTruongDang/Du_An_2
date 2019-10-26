<?php 
require_once "controller/newsController.php"; 
$ctrl = new newsController;
$data = $ctrl->detail();
$news = $data['news']
?>
<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="http://localhost/boots/">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="public/template/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/slick.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/style.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/animate.min.css" <link rel="stylesheet" type="text/css"
		href="public/template/css/responsive.css">
	<script src="public/template/js/jquery-3.3.1.slim.min.js"></script>
	<script src="public/template/js/popper.min.js"></script>
	<script src="public/template/js/bootstrap.min.js"></script>
	<script src="public/template/js/style.js"></script>


</head>
<?php require_once "view/header.php"; ?>
	<main>
		<div class="slide-trendding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="trendding-right">
							<input type="text" name="" placeholder="Search">
							<button><i class="fa fa-search" aria-hidden="true"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="txt-chitiet">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<div class="row">
							<div class="col-md-12">
								<div class="tieude-chitiet">
									<h1><?=$news->tieude?></h1>
									<p><a href="#">bởi <?=$news->ten?></a></p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="baiviet-chitiet">
									<p><?=$news->noidung?></p>

								</div>
							</div>
							<div class="col-md-12">
								<div class="tags">
									<span class="txt-tag">
										Tags: <a href="#">Streetstyle</a><a href="#">Crafts</a>
									</span>
								</div>
							</div>
							<div class="col-md-12">
								<div class="share">
									<span class="txt-share">
										Share:
									</span>
									<div class="btn-share">
										<a class="font color1" href="#"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook</a>
									</div>
									<div class="btn-share">
										<a class="font color2" href="#"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook</a>
									</div>
									<div class="btn-share">
										<a class="font color3" href="#"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook</a>
									</div>
									<div class="btn-share">
										<a class="font color4" href="#"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook</a>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="comment">
									<div class="tieude-comment">
										<h3>Leave a Comment</h3>
									</div>
									<div class="all-ip">
										<div class="ip-comment">
											<input type="text" name="" placeholder="Comment">
										</div>
										<div class="ip-name">
											<input type="text" name="" placeholder="Name">
										</div>
										<div class="ip-email">
											<input type="text" name="" placeholder="Email">
										</div>
										<div class="ip-website">
											<input type="text" name="" placeholder="Website">
										</div>
									</div>
									<div class="btn-comment">
										<button>Post Comment</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="row">
							<div class="col-md-12">
								<nav class="navbar navbar-default">
									<a class="navbar-brand phobien" href="#">Category</a>
								</nav>
							</div>
							<div class="col-md-12">
								<div class="ul-cate">
									<ul>
										<li><a href="#">Fashion</a></li>
										<li><a href="#">Beauty</a></li>
										<li><a href="#">Street Style</a></li>
										<li><a href="#">Life Style</a></li>
										<li><a href="#">Diy & Crafts</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-12">
								<nav class="navbar navbar-default">
									<a class="navbar-brand phobien" href="#">Archive</a>
								</nav>
								<div class="ul-archive">
									<ul>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row" style="padding-top: 50px;">
						<div class="col-md-12">
							<nav class="navbar navbar-default">
								<a class="navbar-brand phobien" href="#">Tag</a>
							</nav>
						</div>
					</div>
					<div class="row tags">
						<div class="col-md-12">
							<a href="#" class="tags">Fashion</a>
							<a href="#" class="tags">Lefestyle</a>
							<a href="#" class="tags">Denim</a>
							<a href="#" class="tags">Streetstyle</a>
							<a href="#" class="tags">Crafts</a>
							<a href="#" class="tags">Magazine</a>
							<a href="#" class="tags">News</a>
							<a href="#" class="tags">Blogs</a>

						</div>

					</div>
					</div>
				</div>
			</div>
		</div>
	</main>
<?php require_once "view/footer.php" ?>