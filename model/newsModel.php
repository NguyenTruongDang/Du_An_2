<?php require_once "DBConnect.php"; 

class newsModel extends DBConnect{
	//Hàm lấy dữ liệu 
	function select($tb){
		$sql = "SELECT * 
				FROM $tb
		";
		return $this->getMoreRows($sql);
	}
	
	//Hàm kiểm tra mail có tồn tại
	function checkAccount($mail){
		$sql = "SELECT * 
				FROM nguoidung
				WHERE mail = '$mail'
		";
		return $this->getOneRow($sql);
	} 
	//Hàm kiểm tra token có tồn tại
	function checkToken($token){
		$sql = "SELECT * 
				FROM nguoidung
				WHERE token = '$token'
		";
		return $this->getOneRow($sql);
	}
	//Hàm đăng nhập
	function loginAccount($mail,$pass){
		$sql = "SELECT * 
				FROM nguoidung
				WHERE mail = '$mail'
				AND mat_khau = '$pass'
				AND trang_thai = 0
		";
		return $this->getOneRow($sql);
	}
	//Hàm đăng kí 
	function register($token,$name,$mail,$pass){
		$sql = "INSERT INTO nguoidung(token,ten,mail,mat_khau) 
				VALUES('$token','$name','$mail','$pass')
		";
		return $this->executeQuery($sql);
	}

	// Hàm thay đổi mật khẩu 
	function updatePass($pass,$token){
		$sql = "UPDATE nguoidung 
				SET mat_khau = '$pass'
				WHERE token= '$token'

		";
		return $this->executeQuery($sql);
	} 

}


?>