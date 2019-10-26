<?php
session_start();
require_once "view/header.php"; 
require_once "controller/newsController.php";
if(!isset($_SESSION['tokenid'])){
	header('location:trang-chu');
}
$ctrl = new newsController;
$data = $ctrl->profile();
$pro = $data['pro'];
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
    <link rel="stylesheet" type="text/css" href="public/template/css/animate.min.css" <link rel="stylesheet" type="text/css"
        href="public/template/css/responsive.css">
    <script src="public/template/js/jquery-3.3.1.slim.min.js"></script>
    <script src="public/template/js/popper.min.js"></script>
    <script src="public/template/js/bootstrap.min.js"></script>
    <script src="public/template/js/style.js"></script>

</head>
<?php require_once "view/header.php"; ?>
	<main>
		<div class="all-proview">
			<div class="container-fluid">
				<div class="container">
					<div class="proview-bg">
						<div class="row">
							<div class="col-md-4 col-sm-12"> 
								<div class="left-proview">
									<div class="img-proview">
										<a href="#">
											<img src="public/template/img/proview.jpg">
										</a>
									</div>
									<div class="word-link">
										<h5>WORK LINK</h5>
										<a href="#">Website Link</a>
										<a href="#">Bootsnipp Profile</a>
										<a href="#">Bootply Profile</a>
									</div>
									<div class="skills">
										<h5>SKILLS</h5>
										<a href="#">Web Designer</a>
										<a href="#">Web Developer</a>
										<a href="#">WordPress</a>
										<a href="#">WooCommerce</a>
										<a href="#">PHP, .Net</a>
									</div>
								</div>
							</div>
							<div class="col-md-8 col-sm-12">
								<div class="right-proview">
									<div class="txt-proview">
										<a href="logout.php">EIT</a>
										<h1><?=$pro->ten?></h1>
										<h2>Web Developer and Designer</h2>
										<h3>Ngày tham gia : <?=$pro->ngay_tao?></h3>
									</div>
									<div class="bot-proview">
										<a href="#home" id="chuyenabout">Giới thiệu</a>
										<a href="#profile" id="chuyentimeline">Dòng thời gian</a>
									</div>
									<div class="all-about">
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>About id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">AboutHIHIHI</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>About id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">AboutHIHIHI</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>About id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">AboutHIHIHI</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>About id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">AboutHIHIHI</p>
												</div>
											</div>
										</div>

									</div>
									<div class="all-timeline">
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>Timeline id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">Timelinehihi</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>Timeline id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">Timelinehihi</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>Timeline id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">Timelinehihi</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>Timeline id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">Timelinehihi</p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="thongtin-prorive">
												<div class="col-md-3 col-xs-3">
												<p>Timeline id</p>
												</div>
												<div class="col-md-9 col-xs-9">
													<p class="thongtin-txt">Timelinehihi</p>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
<?php require_once "view/footer.php"; ?>