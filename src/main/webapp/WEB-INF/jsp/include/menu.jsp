<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pt-3 mb-3 text-center font-italic-bold"><a href="/moonstargram/timeline_view" class="text-dark">Moonstargram</a></div>
<nav class="ml-3">
	<ul class="nav flex-column w-100">
		<li class="nav-item"><a class="nav-link mt-1" href="#"><img
				alt="/moonstargram/direct_talk"
				src="https://cdn.pixabay.com/photo/2016/11/17/16/06/icons-1831923_960_720.png"
				width="50px"> Direct Talk</a></li>
		<li class="nav-item"><a class="nav-link mt-1" href="#"><img
				alt="/moonstargram/direct_talk"
				src="https://cdn.pixabay.com/photo/2016/08/19/20/37/time-1606153_960_720.png"
				width="50px"> 알림</a></li>
		<li class="nav-item"><a class="nav-link mt-1" href="/moonstargram/post_create"><img
				alt="/moonstargram/direct_talk"
				src="https://cdn.pixabay.com/photo/2016/03/21/05/05/plus-1270001_960_720.png"
				width="50px"> 글쓰기</a></li>
		<li class="nav-item"><a class="nav-link mt-1" href="#"><img
				alt="/moonstargram/direct_talk"
				src="https://cdn.pixabay.com/photo/2017/01/31/15/12/avatar-2024924_960_720.png"
				width="50px"> 마이 페이지</a></li>
	</ul>
</nav>
<div class="user-data">
	<b>${userId}-${nickName}</b><a href="/moonstargram/sign_out">로그아웃</a>
</div>