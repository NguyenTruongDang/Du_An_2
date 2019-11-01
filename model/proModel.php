<?php 
require_once "DBConnect.php";

class proModel extends DBConnect{
	// Hàm show thể loại
	function getType(){
		$sql = "SELECT * 
				FROM theloai

		";
		return $this->getMoreRows($sql);
	}
	// Hàm thêm bài viết 
	function setNews($id_type,$id_user,$ava_img,$alt_img,$tieude,$tieude_ko,$mota,$noidung){
		$sql = "INSERT INTO tintuc(id_type,id_user,ava_img,alt_img,tieude,tieude_ko,mota,noidung) 
				VALUES($id_type,$id_user,'$ava_img','$alt_img','$tieude','$tieude_ko','$mota','$noidung')
		";
		return $this->executeQuery($sql);
	}
}

?>