<?php 
$connect = new PDO('mysql:host=localhost;dbname=cuacuon','root', '');
$error = '';
$comment_content = '';

if(empty($_POST['comment_content']){
	$error .="Bạn chưa nhập comment";
}
else{
	$comment_content = $_POST['comment_content'];
}

?>