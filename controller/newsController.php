<?php 
require_once "model/newsModel.php";


class newsController{
	//Xử lí trang index
	public function index(){
		$model = new newsModel;
		$st = $model->getNewsSt(); // Tin đặc biệt
		$view = $model->getNewsView(); // Tin xem nhiều
		$home = $model->getTypeHome(); // Thể loại hiển thị Home
		$new = $model->getNewsNew(); // Tin mới nhất


		return array(
			'st' => $st,
			'view' => $view,
			'home' => $home,
			'new' => $new

		);
	}

	//Xử lí trang thể loại tin
	public function type(){
		$model = new newsModel;
		if(isset($_GET['url'])){
			$url = $_GET['url'];
		}
		$type = $model->getNewsByType($url);
		if(!$type){
			header("location:trang-chu");
			return;
		}
		return array(
			'type' => $type
		);
	}

	// Xử lí trang chi tiết tin
	public function detail(){
		$model = new newsModel;
		if(isset($_GET['id']) && isset($_GET['url']) && isset($_GET['title'])){
			$id = $_GET['id'];
			$url = $_GET['url'];
			$title = $_GET['title'];
			
		}
		$news = $model->getNews($id,$url,$title);

		return array(
			'news' => $news
		);
	}
	// Xử lí trang cá nhân
	public function profile(){
		$model = new newsModel;
		if($_SESSION['tokenid']){
			$token = $_SESSION['tokenid'];
			$pro = $model->getProfile($token);
		}
		return array(
			'pro' => $pro,
		);
	}

}
?>