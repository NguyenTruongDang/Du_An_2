<?php 
require_once "controller/newsController.php"; 
$ctrl = new newsController;
$data = $ctrl->detail();
$news = $data['news'];
$tags = $data['tags'];
?>
<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="http://localhost/git/Du_An_2/">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.12.0/d3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="public/template/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/slick.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/style.css">
	<link rel="stylesheet" type="text/css" href="public/template/css/animate.min.css" <link rel="stylesheet" type="text/css"
		href="public/template/css/responsive.css">
	<script src="public/template/js/jquery-3.3.1.slim.min.js"></script>
	<script src="public/template/js/popper.min.js"></script>
	<script src="public/template/js/bootstrap.min.js"></script>
	<script src="public/template/js/style.js"></script>
	<script async defer data-pin-hover="true" data-pin-tall="true" src="//assets.pinterest.com/js/pinit.js"></script>

</head>
<?php require_once "view/header.php"; ?>
	<main>
		<div class="slide-trendding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="trendding-right">
							<input type="text" name="" placeholder="Search">
							<button><i class="fa fa-search" aria-hidden="true"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="txt-chitiet">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<div class="row">
							<div class="col-md-12">
								<div class="tieude-chitiet">
									<h1><?=$news->tieude?></h1>
									<p><a href="#">bởi <?=$news->ten?></a></p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="baiviet-chitiet">
									<p><?=$news->noidung?></p>

								</div>
							</div>
							<div class="col-md-12">
								<div class="tags">
									<span class="txt-tag">
										Tags: 
										<?php foreach($tags as $tg): ?>
										<a href="<?=$tg->tags_ko?>.html"><?=$tg->ten_tags?></a> 
										<?php endforeach ?>
									</span>
								</div>
							</div>
							<div class="col-md-12">
								<div class="share">
									<span class="txt-share">
										Share:
									</span>
									<!-- Share Facebook -->
									<div class="btn-share">
										<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
									</div>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>
									<!-- Share Zalo -->
									<script src="https://sp.zalo.me/plugins/sdk.js"></script>
									<div class="btn-share">
										<div class="zalo-share-button" data-href="" data-oaid="579745863508352884" data-layout="2" data-color="blue" data-customize=false></div>
									</div>
									<div class="btn-share">
										<a class="twitter-share-button"
										  href="https://twitter.com/intent/tweet?text=Hello%20world"
										  data-size="large">
										Tweet</a>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="comment">
									<div class="tieude-comment">
										<h3>Bình Luận</h3>
									</div>
									<div class="all-ip">
										<div class="ip-comment">
											<input type="text" name="" placeholder="Comment">
										</div>
									</div>
									<div class="btn-comment">
										<button>Post Comment</button>
									</div>

						<div class="comments-area">
                            <h4>05 Comments</h4>
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c1.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Emilly Blunt</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list left-padding">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c2.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Elsie Cunningham</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list left-padding">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c3.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Annie Stephens</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c4.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Maria Luna</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c5.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Ina Hayes</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	                                             				
                        </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="row">
							<div class="col-md-12">
								<nav class="navbar navbar-default">
									<a class="navbar-brand phobien" href="#">Category</a>
								</nav>
							</div>
							<div class="col-md-12">
								<div class="ul-cate">
									<ul>
										<li><a href="#">Fashion</a></li>
										<li><a href="#">Beauty</a></li>
										<li><a href="#">Street Style</a></li>
										<li><a href="#">Life Style</a></li>
										<li><a href="#">Diy & Crafts</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-12">
								<nav class="navbar navbar-default">
									<a class="navbar-brand phobien" href="#">Archive</a>
								</nav>
								<div class="ul-archive">
									<ul>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
										<li><a href="#">July 2018</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row" style="padding-top: 50px;">
						<div class="col-md-12">
							<nav class="navbar navbar-default">
								<a class="navbar-brand phobien" href="#">Tag</a>
							</nav>
						</div>
					</div>
					<div class="row tags">
						<div class="col-md-12">
							<a href="#" class="tags">Fashion</a>
							<a href="#" class="tags">Lefestyle</a>
							<a href="#" class="tags">Denim</a>
							<a href="#" class="tags">Streetstyle</a>
							<a href="#" class="tags">Crafts</a>
							<a href="#" class="tags">Magazine</a>
							<a href="#" class="tags">News</a>
							<a href="#" class="tags">Blogs</a>

						</div>

					</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div class="zalo-chat-widget" data-oaid="579745863508352884" data-welcome-message="Rất vui khi được hỗ trợ bạn!" data-autopopup="0" data-width="350" data-height="420"></div>

<script src="https://sp.zalo.me/plugins/sdk.js"></script>
<?php require_once "view/footer.php" ?>