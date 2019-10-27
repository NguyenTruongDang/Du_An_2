<?php 
session_start();
require_once "model/newsModel.php";
require_once "helper/PHPMailer/sendmail.php";
require_once "helper/functions.php";
$model = new newsModel;

if(isset($_POST['sm'])){
    $error = array();
    if(empty($_POST['name'])) $error[]='name'; else $_SESSION['re_name'] = $_POST['name'];
    if(empty($_POST['mail'])) $error[]='mail'; else $_SESSION['re_mail'] = $_POST['mail'];
    if(empty($_POST['pass'])) $error[]='pass'; else $_SESSION['re_pass'] = $_POST['pass'];
    if(empty($_POST['rpass'])) $error[]='rpass'; else $rpass = $_POST['rpass'];
   
    if(!empty($error)){
        $message = 'Bạn cần nhập đủ thông tin';
    }
    else{
        $d = $model->checkAccount($_SESSION['re_mail']);
        if(strlen($_SESSION['re_pass']) < 6){
            $message = 'Mật khẩu trên 6 kí tự';
        }
        elseif($_SESSION['re_pass'] != $rpass){
            $message = 'Mật khẩu không giống nhau';
        }
        elseif($d){
            $message = 'Mail đã tồn tại';
        }
        
        else{
            $_SESSION['re_idtk'] = createToken(6);
            $m = sendMail($_SESSION['re_mail'],$_SESSION['re_idtk']);
            if($m){
                header('location:accept_register.php');

            }

            
            

        }
    }
    
}

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
<div class="container">

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
    <li class="breadcrumb-item active" aria-current="page">Đăng ký tài khoản</li>
  </ol>
</nav>
    <div class="site-section" style="margin:50px">
            <?php if(isset($message)) echo $message; ?>

            <form method="POST">
            <div class="row justify-content-center">
            	<div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label for="username">Tên</label>
                            <input name="name" value="<?php if(isset($_POST['name'])){ echo $_POST['name']; } ?>" type="text" id="username" class="form-control form-control-md">
                        </div>
                        <div class="col-md-12 form-group">
                            <label for="username">Mail</label>
                            <input name="mail" value="<?php if(isset($_POST['mail'])){ echo $_POST['mail']; } ?>" type="email" id="username" class="form-control form-control-md">
                        </div>
                        <div class="col-md-12 form-group">
                            <label for="pword">Mật khẩu</label>
                            <input name="pass" value="<?php if(isset($_POST['pass'])){ echo $_POST['pass']; } ?>" type="password" id="pword" class="form-control form-control-md">
                        </div>
                        <div class="col-md-12 form-group">
                            <label for="username">Nhập lại mật khẩu</label>
                            <input name="rpass" value="<?php if(isset($_POST['rpass'])){ echo $_POST['rpass']; } ?>" type="password" id="username" class="form-control form-control-md">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px">
                        <div class="col-12">
                            <input type="submit" name="sm" value="Đăng ký" class="btn btn-primary btn-md px-2">
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
            </form>
    </div>
  
   </div>

<?php require_once "view/footer.php"; ?>