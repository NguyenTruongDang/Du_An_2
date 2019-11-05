<?php ob_start(); ?>
<?php 

 require_once "view/header.php" ;
 require_once "model/adminModel.php";
 require_once "helper/VitoEn.php";
 require_once "helper/PHPMailer/sendmail.php";
 $model = new adminModel;

  if(isset($_GET['com'])){
    $com = $_GET['com'];
  }
  else{
    $com = '';

  }

  switch ($com) {
    case 'theloai':
      require_once "controller/theloai.php";
      break;

    case 'tintuc':
      require_once "controller/tintuc.php";
      break;

    case 'kiemduyet':
      require_once "controller/kiemduyet.php";
      break;

    case 'cauhinh':
      require_once "controller/cauhinh.php";
      break;

    case 'comment':
      require_once "controller/comment/index.php";
      break;

    case 'user':
      require_once "controller/user/index.php";
      break;

    default:
      require_once "view/null.html";
      break;

    
  }


?>






<?php require_once "view/footer.php" ?>
 <?php ob_end_flush(); ?>