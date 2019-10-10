<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="public/template/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/slick.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/style.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/responsive.css">
	<script src="public/template/js/jquery-3.3.1.slim.min.js"></script>
	<script src="public/template/js/popper.min.js"></script>
	<script src="public/template/js/bootstrap.min.js"></script>
	<script src="public/template/js/style.js"></script>


</head>

<body>
	
	<header id="header">
		<div class="hd-top">
			<div class="container-fluid">
				<div class="container">
					<div class="all-top">
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<div class="left-top">
								<span class="days-time">
									Việt Nam, 04/10/2019 - 14h08p
								</span>
								<a class="left-li" href="#">About</a>
								<a class="left-li" href="#">Contact</a>
								<?php if(isset($_SESSION['tokenid'])): ?>
								<a class="left-li"  href="profile.php"><?=$_SESSION['nameu']?></a>
								<?php else: ?>
								<a class="left-li" id="dangnhap" href="login.php">Đăng nhập</a>
								<a class="left-li" id="dangky" href="register.php">Đăng ký tài khoản</a>
								<?php endif ?>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<div class="right-top">
								<a class="icon-right" href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
								<a class="icon-right" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
								<a class="icon-right" href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
								<a class="icon-right" href="#"><i class="fa fa-vimeo" aria-hidden="true"></i></a>
								<a class="icon-right" href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="logo-banner">
			<div class="container">
				<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
					<div class="logo">
						<a href="#">
							<img src="public/template/img/logo.png">
						</a>
					</div>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
					<div class="banner">
						<a href="#">
							<img src="public/template/img/banner-01.png">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="menu">
				<div class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</div>
				<nav class="nav-wrap" id="main-nav">
					<div class="nav-overlay"></div>
					<ul class="nav-ul">
						<li><a href="index.html">Trang chủ</a>
						</li>
						<li><a href="about.html">Giải trí</a>
						</li>
						<li><a href="our_product.html">Kinh doanh</a>
						</li>
						<li><a href="cerfiticate.html">Pháp luật</a>
						</li>
						<li><a href="new.html">Thể thao</a>
						</li>
						<li><a href="contactus.html">Đời sống</a>
						</li>
						<li><a href="contactus.html">Sức khỏe</a>
						</li>
						<li class="dropdown "><a href="#">Video</a>
							<div class="sub-menu-wrap">
								<ul class="sub-menu">
									<li><a href="#">Video giải trí</a></li>
									<li><a href="#">Video tin tức</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
