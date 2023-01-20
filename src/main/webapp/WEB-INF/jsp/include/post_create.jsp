<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="write-box border rounded m-3">
	<div id="fileUploadBox" class="image-box d-flex justify-content-center align-items-center">
		<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
		<a href="#" id="fileUploadBtn"><img id="post-image" width="80" height="80"
			src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
	</div>
	<div class="file-upload d-flex">
		<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
		<form id="ajaxform" enctype = "multipart/form-data">
			<input type="file" id="file" class="d-none"
				accept=".gif, .jpg, .png, .jpeg">
		</form>
	</div>
	<textarea id="writeTextArea" placeholder="내용을 입력해주세요"
		class="mt-3 w-100 border-0" rows="5"></textarea>


	<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
	<div class="d-flex justify-content-end">
		<button id="writeBtn" class="btn btn-info">게시</button>
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

			// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
			let formData = new FormData();
			formData.append("file", $('#file')[0].files[0]);
			console.log(formData)
			
			$('#post-image').attr('width', "100%%");
			$('#post-image').attr('height', "300px");
			
			
			$.ajax({
				type : "POST"
				, url : "/moonstargram/uploadImage"
		        , processData: false
		        , contentType: false
				, data : formData
				
				, success : function(data) {
					alert(data.result);
					
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
			
			alert(content);
			alert(image);
			
		});
	});
</script>