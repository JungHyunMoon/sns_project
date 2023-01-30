<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		<%-- 타임라인 영역 --%>
		<div class="timeline-box my-5">
			<%-- 반목문 --%>
			<c:forEach var="card" items="${cardList}">
				<div class="card border rounded mt-3">
					<%-- 글쓴이, 더보기(삭제) --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${card.user.nickname}</span>
						<%-- 내 게시물에만 더보기 노출 --%>
						<c:if test="${userId eq card.post.userId}">
							<%-- 더보기 --%>
							<button class="btn more-btn" data-toggle="modal" data-target="#modal" style="background-color:transparent" data-post-id="${card.post.id}">
								<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLongTitle">게시물 더보기</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body text-center" data-post-id="${card.post.id}">
								    <button type="button" class="delete-btn btn btn-danger" data-post-id="${card.post.id}">삭제하기</button>
								    <button type="button" class="modify-btn btn btn-primary" data-post-id="${card.post.id}">수정하기</button>
								    <!-- data-dismiss 클래스로 모달 닫기 -->
								  	<button type="button" class="btn btn-secondary" data-dismiss="modal">팝업닫기</button>
							      </div>
							      <div class="modal-footer">
							      </div>
							    </div>
							  </div>
							</div>
						</c:if>	
					</div>
	
					<%-- 카드 이미지 --%>
					<div class="card-img">
						<img src="${card.post.imagePath}" class="w-100" alt="본문 이미지">
					</div>
	
					<%-- 좋아요 --%>
					<div class="card-like m-3">
						<button type="button" class="like-btn btn" style="background-color:transparent" data-post-id="${card.post.id}">
							<c:choose>
								<c:when test="${card.alreadyLike eq true}">
									<img src="https://u7.uidownload.com/vector/149/516/vector-heart-svg.jpg" id="${card.post.id}fiiledHeart" width="18" height="18" alt="filled heart" class="">
									<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" id="${card.post.id}vacantHeart" width="18" height="18" alt="empty heart" class="d-none">
								</c:when>
								<c:when test="${card.alreadyLike eq false}">
									<img src="https://u7.uidownload.com/vector/149/516/vector-heart-svg.jpg" id="${card.post.id}fiiledHeart" width="18" height="18" alt="filled heart" class="d-none">
									<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" id="${card.post.id}vacantHeart" width="18" height="18" alt="empty heart" class="">
								</c:when>
							</c:choose>
							좋아요 ${card.filledLike}개
						</button>
					</div>
	
					<%-- 글 --%>
					<div class="card-post m-3">
						<span class="font-weight-bold">${card.user.nickname}: </span>
						<span>${card.post.content}</span>
					</div>
	
					<%-- 댓글 --%>
					<div class="card-comment-desc border-bottom">
						<div class="ml-3 mb-1 font-weight-bold">댓글</div>
					</div>
	
					<%-- 댓글 목록 --%>
					<div class="card-comment-list m-2">
						
						<c:forEach var="commentView" items="${card.commentList}">
							<div class="card-comment m-1">
								<span class="font-weight-bold">${commentView.user.nickname}</span>
								<span>${commentView.comment.content}</span>

								<%-- 댓글 삭제 버튼 --%>
								<c:if test="${userId eq card.post.userId}">
									<a href="#"> <img class="commentDelBtn"
										src="https://www.iconninja.com/files/603/22/506/x-icon.png"
										width="10px" height="10px" data-comment-id="${commentView.comment.id}">
									</a>
								</c:if>
							</div>
						</c:forEach>
	
						<%-- 댓글 쓰기 --%>
						<c:if test="${not empty userId}">
							<div class="comment-write d-flex border-top mt-2">
								<input type="text" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
								<button type="button" class="comment-btn btn btn-light" data-post-id="${card.post.id}" data-user-id="${card.user.id}">게시</button>
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
		
		/* 더보기 버튼 */
		$('.more-btn').on('click', function() {
			let postId = $(this).data('post-id');
			
			/* 삭제하기 */
			$('.delete-btn').on('click', function() {
				$.ajax({
					type:"DELETE"
					, url:"/delete_post"
					, data: {"postId":postId}
					
					, success : function(data) {
						alert("삭제 되었습니다")
						window.location.reload(true);
					}
					, error : function(e) {
						alert(e);
					}
				});
			});
		});
		
		/* 댓글 추가 */
		$('.comment-btn').on('click', function() {
			let postId = $(this).data('post-id');
			let comment = $(this).siblings('input').val().trim();
			
			$.ajax({
				type:"POST"
				, url:"/comment_create"
				, data: {"postId":postId, "content":comment}
			
				, success : function(data) {
					window.location.reload(true);
				}
				, error : function(e) {
					alert("AJAX실패");
				}
			});
		});
		
		/* 댓글 삭제 */
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
		
		/* 좋아요 버튼 */
		$('.like-btn').on('click', function() {
			let userId = ${userId}
			let postId = $(this).data('post-id');
			let target = $(this).children().last().attr('id');
			console.log(target);
// 			$('.like-btn').children().attr('id', target).addClass('d-none');
			
			$.ajax({
				type:"POST"
				, url:"/like"
				, data: {"userId":userId, "postId":postId}
				, context: this
			
				, success : function(data) {
					if (data.result == true) {
						// 첫번째 노드 꽉찬 하트
						// 마지막 노드 빈 하트
						$(this).children().first().addClass('d-none')
						$(this).children().last().removeClass('d-none')
						document.location.reload(true);
					} else if (data.result == false ) {
						$(this).children().first().removeClass('d-none')
						$(this).children().last().addClass('d-none')
						document.location.reload(true);
					} else {
						alert("code 잘못들어왔음")
					}
				}
				, error : function(e) {
					alert("실패");
				}
			});
		});
	});
</script>