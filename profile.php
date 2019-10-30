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
    <script src="https://ajax.googleapis.com/ajax/libs/d3js/5.12.0/d3.min.js"></script>
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
							<?php require_once "profile/view/sidebar.php"; ?>
							<div class="col-md-8 col-sm-12">
								<div class="right-proview">
									<div class="txt-proview">
										<a href="logout.php">EIT</a>
										<h1><?=$pro->ten?></h1>
										<h2>Web Developer and Designer</h2>
										<h3>Ngày tham gia : <?=$pro->ngay_tao?></h3>
									</div>
									
									<?php 
										if(isset($_GET['act'])){
											$act = $_GET['act'];
										}
										else{
											$act = '';
										}

										switch ($act) {
											case 'dangbai':
												
												require_once "profile/view/dangbai.php";
												break;
											
											default:
												require_once "profile/view/index.php";
												break;
										}
									?>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
<?php require_once "view/footer.php"; ?>