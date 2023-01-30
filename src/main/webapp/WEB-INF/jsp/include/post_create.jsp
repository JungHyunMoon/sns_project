<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="write-box border rounded m-3">
	<div id="fileUploadBox" class="image-box d-flex justify-content-center align-items-center">
		<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
		<a href="#" id="fileUploadBtn"><img id="post-image" width="80" height="80"
			src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
	</div>
	<div class="file-upload">
		<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
		<form id="ajaxform" enctype = "multipart/form-data">
			<input type="file" id="file" class=""
				accept=".gif, .jpg, .png, .jpeg">
		<textarea id="writeTextArea" placeholder="내용을 입력해주세요"
			class="mt-3 w-100 border-0" rows="5"></textarea>
	
		<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
		<div class="d-flex justify-content-end">
			<button id="writeBtn" class="btn btn-info">게시</button>
		</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#fileUploadBtn').on('click', function() {
			$('#file').click();
		});

		$('#file').on('change', function(e) {
			//alert("파일 선택");
			let fileName = e.target.files[0].name; // 07_30_01.png
			//alert(fileName);

			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일 태그에 실제 파일 제거
				return;
			}

			// 유효성 통과한 이미지는 상자에 업로드 된 파일 노출
			let formData = new FormData();
			formData.append("file", $('#file')[0].files[0]);
			
			$('#post-image').attr('width', "100%%");
			$('#post-image').attr('height', "300px");
			
			console.log($('#file').val());
			
			$.ajax({
				type : "POST"
				, url : "/uploadImage"
		        , processData: false
		        , contentType: false
				, data : formData
				
				, success : function(data) {
					alert($('#file').val());
					$('#post-image').attr('src', data.imagePath);
					$('#post-image').attr('src', data.imagePath);

				}
				, error : function(e) {
					alert('실패');
				}
			});
			
		});
		
		$('#writeBtn').on('click', function() {

			let content = $('#writeTextArea').val();
			let image = $('#file').val();
			
			if (content.length < 1) {
				alert("글 내용을 입력해주세요");
				return;
			}
			
			let file = $('#file').val();
			if (file == '') {
				alert('파일을 업로드 해주세요');
				return;
			}
			
			let formData = new FormData();
			formData.append("content", content);
			formData.append("imagePath", $('#file')[0].files[0]); // $('#file')[0]은 첫번째 input file 태그를 의미, files[0]는 업로드된 첫번째 파일
			
			alert(formData.get('imagePath'));

			$.ajax({
				type: "post"
				, url: "/post_create"
				, data: formData
				, enctype: "multipart/form-data"    // 파일 업로드를 위한 필수 설정
				, processData: false   
				, contentType: false  
				
				, success: function(data) {
					if (data.code == 1) {
						location.href = "/moonstargram/timeline_view"
					} else if (data.code == 500) { // 비로그인 일 때
						location.href = "/moonstargram/sign_in_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("글 저장에 실패했습니다. 관리자에게 문의해주세요." + e);
				}
			});  // --- ajax 끝
			
		});
	});
</script>