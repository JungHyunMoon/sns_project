<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		<%-- 타임라인 영역 --%>
		<div class="timeline-box my-5">
			<%-- 반목문 --%>
			<c:forEach var="post" items="${postList}">
				<div class="card border rounded mt-3">
					<%-- 글쓴이, 더보기(삭제) --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${nickName}</span>
	
						<%-- 더보기 --%>
						<a href="#" class="more-btn" data-toggle="modal" data-target="#modal" data-post-id="${card.post.id}">
							<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
						</a>
					</div>
	
					<%-- 카드 이미지 --%>
					<div class="card-img">
						<img src="${post.imagePath}" class="w-100" alt="본문 이미지">
					</div>
	
					<%-- 좋아요 --%>
					<div class="card-like m-3">
						<a href="#" class="like-btn">
						<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18" height="18" alt="empty heart">
							좋아요 10개
						</a>
					</div>
	
					<%-- 글 --%>
					<div class="card-post m-3">
						<span class="font-weight-bold">${nickName}: </span>
						<span>${post.content}</span>
					</div>
	
					<%-- 댓글 --%>
					<div class="card-comment-desc border-bottom">
						<div class="ml-3 mb-1 font-weight-bold">댓글</div>
					</div>
	
					<%-- 댓글 목록 --%>
					<div class="card-comment-list m-2">
						
						<c:forEach var="comment" items="${commentList}">
							<c:if test="${comment.postId eq post.id}">
							<div class="card-comment m-1">
								<span class="font-weight-bold">${comment.postId}</span>
								<span>${comment.content}</span>
		
								<%-- 댓글 삭제 버튼 --%>
								<a href="#">
									<img class="commentDelBtn" src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px" data-comment-id="${comment.id}">
								</a>
							</div>
							</c:if>
						</c:forEach>
	
						<%-- 댓글 쓰기 --%>
						<c:if test="${not empty userId}">
						<div class="comment-write d-flex border-top mt-2">
							<input type="text" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
							<button type="button" class="comment-btn btn btn-light" data-post-id="${post.id}">게시</button>
						</div>
						</c:if>
					</div>
					<%--// 댓글 목록 끝 --%>
				</div>
			</c:forEach>
			<%-- 반목문 끝 --%>
		</div>
		<%--// 타임라인 영역 끝  --%>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.comment-btn').on('click', function() {
			let userId = ${userId};
			let postId = $(this).data('post-id');
			
			// 지금 클릭된 게시버튼의 input 태그를 가져온다.
			let comment = $(this).siblings('input').val().trim();
			
			console.log("아이디: " + userId + " 번호는: " + postId + " 내용: " + comment);
			
			$.ajax({
				type:"POST"
				, url:"/comment_create"
				, data: {"userId":userId, "postId":postId, "content":comment}
			
				, success : function(data) {
					window.location.reload(true);
				}
				, error : function(e) {
					alert(e);
				}
			});
		});
		
		$('.commentDelBtn').on('click', function() {
			let commentId = $(this).data('comment-id');
			console.log(commentId);
			
			$.ajax({
				type:"POST"
				, url:"/comment_delete"
				, data: {"id":commentId}
			
				, success : function(data) {
					window.location.reload(true);
				}
				, error : function(e) {
					alert(e);
				}
			});
		});
	});
</script>