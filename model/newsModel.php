<?php require_once "DBConnect.php"; 

class newsModel extends DBConnect{
	//Hàm lấy dữ liệu 
	function select($tb){
		$sql = "SELECT * 
				FROM $tb
		";
		return $this->getMoreRows($sql);
	}
	function selectT(){
		$sql = "SELECT * 
				FROM theloai
				WHERE menu = 1
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
	// Hàm lấy tin đặc biệt
	function getNewsSt(){
		$sql = "SELECT *, u.ten as tenu, tl.tentl as tent, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON id_type = tl.id 
				INNER JOIN nguoidung u ON id_user = u.id 
				WHERE tt.dacbiet = 1
				AND tt.hienthi = 1
				ORDER BY tt.id DESC 
				LIMIT 0,4
		";
		return $this->getMoreRows($sql);
	}
	// Thể loại hiện ở Home
	function getTypeHome(){
		$sql = "SELECT *
				FROM theloai
				WHERE home = 1
			
		";
		return $this->getMoreRows($sql);
	}
		// Tin của thể loại hiện ở Home
	function getNewsType($id){
		$sql = "SELECT *, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON tl.id = id_type
				INNER JOIN nguoidung u ON u.id = id_user
				WHERE tl.id = $id
				AND tt.hienthi = 1
				ORDER BY tt.id DESC
				LIMIT 0,4
		";
		return $this->getMoreRows($sql);
	}
	//Tin mới nhất
	function getNewsNew(){
		$sql = "SELECT *, u.ten as tenu, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON id_type = tl.id 
				INNER JOIN nguoidung u ON id_user = u.id 
				WHERE tt.hienthi = 1
				ORDER BY tt.id DESC 
				LIMIT 0,4
		";
		return $this->getMoreRows($sql);
	}
		// Lấy chi tiết tin
	function getNews($id,$url,$title){
		$sql = "SELECT *
				FROM tintuc tt
				INNER JOIN theloai tl ON tl.id = id_type
				INNER JOIN nguoidung u ON u.id = id_user
				WHERE tt.id = $id
				AND tl.tentl_ko = '$url'
				AND tt.tieude_ko = '$title'
				AND tt.hienthi = 1
		";
		return $this->getOneRow($sql);
	}
		// Tin lấy theo thể loại
	function getNewsByType($url){
		$sql = "SELECT *, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON tl.id = id_type
				INNER JOIN nguoidung u ON u.id = id_user
				WHERE tl.tentl_ko = '$url'
				AND tt.hienthi = 1
				ORDER BY idtt DESC

		";
		return $this->getMoreRows($sql);
	}
		//Tin nhiều view
	function getNewsView(){
		$sql = "SELECT *, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON tl.id = id_type
				WHERE tt.hienthi = 1
				ORDER BY luotxem DESC
				LIMIT 0,8
		";
		return $this->getMoreRows($sql);
	}

}


?>