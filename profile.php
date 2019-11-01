<?php
session_start();
require_once "view/header.php"; 
require_once "model/proModel.php";
require_once "controller/newsController.php";
require_once "admin/helper/VitoEn.php";
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
    <script type="text/javascript" src="helper/ckeditor/ckeditor.js"></script>

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
												$model = new proModel;
												$a = $model->getType();
												if(isset($_POST['sub'])){
													$idtype = $_POST['type'];
													$iduser = $_SESSION['iduser'];
													$error = array();
														if($_FILES['img']['name'] == null){
															$img = $_FILES['img']['name'];
															$img = 'avatt.jpg';
															$imgname = $img;
															$link_img="upload/".$imgname;
															move_uploaded_file($_FILES['img']['tmp_name'],"upload/".$imgname);
														}
														elseif(($_FILES['img']['type']!="image/png")
															&& ($_FILES['img']['type']!="image/gif")
															&& ($_FILES['img']['type']!="image/jpeg")
															&& ($_FILES['img']['type']!="image/jpg")
															
														){
															echo "File không đúng định dạng";
														}
														elseif($_FILES['img']['size'] > 5000000){
															echo "Ảnh phải nhỏ hơn 1MB";
														}
														
														else{
																$files=$_FILES['img'];
																$img=$files['name'];
																$imgname = time()."-".$img;

																$link_img="../upload/".$imgname;
																move_uploaded_file($files['tmp_name'],"upload/".$imgname);
															
														}

														

													if(empty($_POST['title'])) $error[]='title'; else $title = $_POST['title'];
													if(isset($title)){
											        $titleko = convert_vi_to_en($title);
											        $alt_img = $titleko;
													}
													if(empty($_POST['ndesc'])) $error[]='ndesc'; else $ndesc = $_POST['ndesc'];
													if(empty($_POST['content'])) $error[]='content'; else $content = $_POST['content'];
													if(empty($error)){
														$d = $model->setNews($idtype,$iduser,$imgname,$alt_img,$title,$titleko,$ndesc,$content);
													}	

												}
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