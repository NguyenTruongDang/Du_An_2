<?php require_once "view/header.php"; 
if(!isset($_SESSION['tokenid'])){
	header('location:trang-chu');
}
?>
<a href="logout.php">Đăng Xuất</a>