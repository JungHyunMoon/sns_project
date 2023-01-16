<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
	<script 
		src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous">
	</script>

	<!-- bootstrap -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous">
	</script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous">
	</script>
	
	<link rel="stylesheet" type="text/css" href="/static/css/moonstargram.css">
</head>
<body>
	<div id="wrap" class="d-flex">
		<div class="nav-box pl-2">
			<div class="pt-3 mb-3 text-center font-italic-bold">Moonstargram</div>
			<nav class="ml-3">
				<ul class="nav flex-column w-100">
					<li class="nav-item"><a class="nav-link mt-1" href="#"><img alt="/moonstargram/direct_talk" src="https://cdn.pixabay.com/photo/2016/11/17/16/06/icons-1831923_960_720.png" width="50px">  Direct Talk</a></li>
					<li class="nav-item"><a class="nav-link mt-1" href="#"><img alt="/moonstargram/direct_talk" src="https://cdn.pixabay.com/photo/2016/08/19/20/37/time-1606153_960_720.png" width="50px">  알림</a></li>
					<li class="nav-item"><a class="nav-link mt-1" href="#"><img alt="/moonstargram/direct_talk" src="https://cdn.pixabay.com/photo/2016/03/21/05/05/plus-1270001_960_720.png" width="50px">  글쓰기</a></li>
					<li class="nav-item"><a class="nav-link mt-1" href="#"><img alt="/moonstargram/direct_talk" src="https://cdn.pixabay.com/photo/2017/01/31/15/12/avatar-2024924_960_720.png" width="50px">  마이 페이지</a></li>
				</ul>
			</nav>
			<div class="user-data">
				<b>${nickName}</b>
				<a href="/moonstargram/sign_out">로그아웃</a>
			</div>
		</div>
		<section id="contents" class="d-flex justify-content-around mt-5">
			<div id="timeline">
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
				<div class="text-info">test</div>
			</div>
			<div id="chat-box">
				
			</div>
		</section>
	</div>
</body>
</html>