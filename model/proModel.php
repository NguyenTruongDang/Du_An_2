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
	// hàm show bài viết của người dùng 
	function getNewsByUser($iduser){
		$sql = "SELECT *, tt.deleted as ttdeleted, tt.id as idtt
				FROM tintuc tt
				INNER JOIN theloai tl ON tl.id = id_type
				WHERE id_user = $iduser
				ORDER BY tt.id DESC
		";
		return $this->getMoreRows($sql);
	}
	// Hàm xóa bài viết của người dùng
	function delete($id){
		$sql = "DELETE FROM tintuc 
				WHERE id = $id
		";
		return $this->executeQuery($sql);
	}
	// hàm show người dùng bởi id 
	function getUserById($id){
		$sql = "SELECT * 
				FROM nguoidung
				WHERE id = $id
		";
		return $this->getOneRow($sql);
	}
	// Hàm update người dùng
	function updateUser($ten,$tenko,$mail,$sdt,$id){
		$sql = "UPDATE nguoidung 
				SET ten = '$ten',
					ten_ko = '$tenko',
					mail = '$mail',
					sdt = '$sdt'
				WHERE id = $id
		";
		return $this->executeQuery($sql);
	}
}

?>