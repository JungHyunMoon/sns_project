<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/static/css/moonstargram.css">
</head>
<body>
	<div id="wrap"
		class="container d-flex justify-content-center align-items-center">
		<div class="d-flex">
			<form id="signUpForm" method="post" action="/moonstargram/sign_up" onsubmit="return false;">
				<div class="signUp">
					<div class="pt-3 text-center">
						<div class="font-italic-bold">Moonstargram</div>
						<small>즐거운 일상을 친구들과 함께!</small>
					</div>
					<div class="d-flex justify-content-center">
						<input type="text" id="email"
							class="form-control mt-4 col-8 d-block" id="email" name="email" placeholder="이메일 주소">
					</div>
					<div class="d-flex justify-content-center">
						<input type="text" id="nickname"
							class="form-control mt-2 col-8 d-block" id="nickname" name="nickname" placeholder="계정 이름">
					</div>
					<div class="d-flex justify-content-center">
						<input type="text" id="loginId"
							class="form-control mt-2 col-8 d-block" id="loginId" name="loginId" placeholder="아이디">
					</div>
					<div class="d-flex justify-content-center">
						<input type="password" id="password"
							class="form-control mt-2 col-8 d-block" id="password" name="password" placeholder="비밀번호">
					</div>
					<div class="mt-3 text-center">
						<small>이 프로젝트는 첫 sns 프로젝트입니다.</small><br> <small>moonstagram에
							가입하고 즐겨보아요!</small>
					</div>
					<div class="d-flex justify-content-center">
						<button type="submit"
							class="signUpBtn btn btn-info border-radius mt-4 col-8">회원가입</button>
					</div>
				</div>
				<div
					class="logup-box d-flex justify-content-center align-items-center mt-3">
					<span class="mr-2">계정이 있으신가요?</span> <a
						href="/moonstargram/sign_in_view">로그인하기</a>
				</div>
			</form>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		$('#signUpForm').on('submit', function(e) {
			let email = $('#email').val().trim();
			let nickname = $('#nickname').val().trim();
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();

			if (email == "") {
				alert("이메일을 입력해 주세요.");
				return false;
			}
			if (nickname == "") {
				alert("계정이름을 입력해 주세요.");
				return false;
			}
			if (loginId == "") {
				alert("아이디를 입력해 주세요.");
				return false;
			}
			if (password == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			
			let url = $(this).attr('action');
			console.log(url);
			let params = $(this).serialize();
			console.log(params);

			$.post(url, params)		// request
			.done(function(data) {	// response
				if (data.code == 1) {	// 성공
					alert("안녕하세요!")
					location.href="/moonstargram/sign_in_view";			
				} else {	// 실패
					alert("회원 가입에 실패하였습니다.");
				}
			});
		});

	});
</script>
</html>