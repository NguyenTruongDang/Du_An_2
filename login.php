<?php 
require_once "model/newsModel.php";
$model = new newsModel;
if(isset($_POST['sm'])){
    $mail = $_POST['mail'];
    $pass = $_POST['pass'];
    $data = $model->loginAccount($mail,$pass);
    if($data){
        $_SESSION['tokenid'] = $data->token;
        $_SESSION['nameu']=$data->ten;
        header('location:profile.php');
        return;
    }
    else{
        $message = 'Tài khoản không đúng';
    }
}


?>
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
    <li class="breadcrumb-item active" aria-current="page">Đăng nhập</li>
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
                            <label for="username">Tài khoản</label>
                            <input name="mail" type="email" id="username" class="form-control form-control-md">
                        </div>
                        <div class="col-md-12 form-group">
                            <label for="pword">Mật khẩu</label>
                            <input name="pass" type="text" id="pword" class="form-control form-control-md">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px">
                        <div class="col-12">
                            <input type="submit" name="sm" value="Đăng nhập" class="btn btn-primary btn-md px-2">
                        </div>
                    </div>
                    <a  href="forgot_account.php">Quên mật khẩu</a>
                </div>
                <div class="col-md-4"></div>
            </div>
            </form>


    </div>
  
   </div>

<?php require_once "view/footer.php"; ?>