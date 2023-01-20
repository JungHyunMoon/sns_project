<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	
	<link rel="stylesheet" type="text/css" href="/static/css/moonstargram.css">
</head>
<body>
	<div id="wrap" class="container d-flex justify-content-center align-items-center">
		<div class="d-flex">
			<div class="image mr-5">
				<img alt="" src="/static/img/cell-phone.jpg" width="100%" height="100%">
			</div>
			<form id="signInForm" method="post" action="/moonstargram/sign_in">
				<div class="login text-center">
					<div class="pt-3 font-italic-bold">Moonstargram</div>
					<div class="d-flex justify-content-center">
						<input type="text" id="loginId" name="loginId" class="form-control mt-3 col-8" placeholder="아이디">
					</div>
					<div class="d-flex justify-content-center">
						<input type="password" id="password" name="password" class="form-control mt-2 col-8" placeholder="비밀번호">
					</div>
					<button type="submit" class="btn btn-info border-radius mt-4 col-8">로그인</button>
					<div class="mt-3"><a href="#"><small>비밀번호를 잊으셨나요?</small></a></div>
				</div>
				<div class="logup-box d-flex justify-content-center align-items-center mt-4">
					<span class="mr-2">계정이 없으신가요?</span>
					<a href="/moonstargram/sign_up_view">가입하기</a>
				</div>
			</form>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		$('#signInForm').on('submit', function(e) {
			e.preventDefault();
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val().trim();

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
					location.href="/moonstargram/timeline_view";			
				} else {	// 실패
					alert(data.errorMessage);
				}
			});
		});

	});
</script>
</html>