<?php require_once "view/header.php";
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