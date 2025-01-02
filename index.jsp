<%@page import="aiwa.entity.Country"%>
<%@page import="aiwa.entity.Category"%>
<%@page import="aiwa.entity.Main"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Welcome to Nepal and Myanmar</title>
<%
ArrayList<Main> mains = (ArrayList<Main>) request.getAttribute("mains");
String word = (String) request.getAttribute("word");
ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
ArrayList<Country> countrys = (ArrayList<Country>) request.getAttribute("country");
Integer categoryid = (Integer) request.getAttribute("categoryid");
Integer countryid = (Integer) request.getAttribute("countryid");
%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="ここにサイト説明を入れます">
<link rel="stylesheet" href="css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<style>
	.img{
		height:300px;
		object-fit:cover;	
	}
	body {
  background-color: lightblue;
}
</style>
<body>

	<div id="container">

		<div id="contents">

			<header>

				<!--ロゴ-->
				<h1 >Welcome to Nepal and Myanmar<i class="bi bi-flag-fill"></i>
					
				</h1>



				<!--文字サイズ変更ボタン-->
				<div id="f-size">
					<p>Fontsize (文字サイズ)</p>
					<ul>
						<li id="f-small"></li>
						<li id="f-large"></li>
					</ul>
				</div>

				<!--言語ボタン-->
				<ul id="lang">
					<li ><a href="#">English</a></li>
					<li><a href="#">Japanese</a></li>
				</ul>

			</header>

			<!--開閉ブロック-->
			<aside class="mainimg">
				<div>
					<img src="images/1.jpg" alt="">
				</div>
				<div>
					<img src="images/2.jpg" alt="">
				</div>
				<div>
					<img src="images/3.jpg" alt="">
				</div>
			</aside>

			<form action="MainListController">
				<nav class="navbar navbar-expand-lg bg-body-tertiary">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">Welcome</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					
								<li class="nav-item"> <select name="categoryid">
											<option value="0" <%=categoryid == 0 ? "selected" : ""%>>Category</option>
											<% for (Category c : categories) { %>
												<option value="<%=c.getCategoryId()%>" <%=categoryid == c.getCategoryId() ? "selected" : ""%>>
												<%=c.getCategoryName()%>
												</option>
											<%} %>
										
									</select>
								</li>
									<li class="nav-item"> <select name="countryid">
											<option value="0" <%=countryid == 0 ? "selected" : ""%>>Country</option>
											<%
											for (Country c : countrys) {
											%>
											<option value="<%=c.getCountryId()%>"
												<%=countryid == c.getCountryId() ? "selected" : ""%>><%=c.getCountryName()%></option>
											<%
											}
											%>
									</select>
								</li>
								

							</ul>
							<form class="d-flex" role="search" action="MainListController">
								<input class="form-control me-2" type="search" name="word"
									placeholder="Search" aria-label="Search" value=<%=word %>>
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
						
					</div>
				</nav>
			</form>
			
			<main>

				<section>

					<h2>Welcome to Myanmar<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Flag_of_Myanmar.svg/1200px-Flag_of_Myanmar.svg.png" width="50" > and Nepal <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/640px-Flag_of_Nepal.svg.png" width="30" ></h2>

					<div class="list-grid">
					<%for(Main m:mains){ %>

						<div class="list" style="background-color:LightGray;">
						
	<figure><img class="img" src="<%=m.getImage() %>" alt=""></figure>
	<div class="text">
	
	<div class="d-grid gap-2">
  <a href="detail.jsp?mainid=<%=m.getMainId() %>"><button class="btn btn-primary" type="button"><%=m.getMainName() %></button></a>
 <a href="mainVideoView.jsp?mainid=<%=m.getMainId() %>"> <button onclick="enableAutoplay()"class="btn btn-primary" type="button"> Watch Video</button></a>
</div>
	
	
	</div>
	<!--/.text-->
	</div>
	<!--/.list-->
	<%} %>
						
					</div>
					<!--/.list-grid-->

				</section>

			</main>



			<!--ページの上部へ戻るボタン-->
			<div class="pagetop">
				<a href="#"><i class="fas fa-angle-double-up"></i></a>
			</div>

		</div>
		<!--/#container-->

		<!--開閉ボタン（ハンバーガーアイコン）-->
		<div id="menubar_hdr">
			<span></span><span></span><span></span>
		</div>

		<!--jQueryの読み込み-->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

		<!--文字サイズチェンジ用のスクリプト-->
		<script src="js/fontSizeChanger.js"></script>

		<!--このテンプレート専用のスクリプト-->
		<script src="js/main.js"></script>

		<!--スライドショー（slick）-->
		<script
			src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="js/slick.js"></script>
<script>
let vid = document.getElementById("myVideo");
function enableAutoplay() { 
  vid.autoplay = true;
  vid.load();
}
function checkAutoplay() { 
	  alert(vid.autoplay);
	}
</script>
</body>
</html>
