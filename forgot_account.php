<?php require_once "view/header.php" ;
require_once "model/newsModel.php";
require_once "helper/PHPMailer/sendmail.php";
$model = new newsModel;

if(isset($_POST['c'])){

    $mail = $_POST['mail'];
    $d = $model->checkAccount($mail);
    $name = $d->ten;
    if($d){
        $body =" Xin chào tài khoản : $name <br>

        <a href='http://localhost/boots/changed_password.php?token=".$d->token."'>Thay đổi mật khẩu</a>";
        $m = sendMail($mail,$body);
        if($m){
            $message = 'mail đã được gửi';
        }
    }
    else{
        $message = 'Mail chưa đăng ký';
    }
}

?>
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
                            <label for="username">Mail đã đăng ký</label>
                            <input name="mail" type="email" id="username" class="form-control form-control-md">
                        </div>

                    </div>
                    <div class="row" style="margin-bottom: 10px">
                        <div class="col-12">
                            <input type="submit" name="c" value="Gửi" class="btn btn-primary btn-md px-2">
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
            </form>


    </div>
  
   </div>
