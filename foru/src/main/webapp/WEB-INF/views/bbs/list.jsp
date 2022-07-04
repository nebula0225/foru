<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 800px;
	margin: auto;
}


</style>

<script type="text/javascript">
function searchList() {
	var f = document.searchForm;
	f.submit();
}
</script>

<section class="page-section" id="contact" style="height: 781px;">
<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-heart"></i> 게시판 <small class="fs-6 fw-normal">Board</small></h3>
		</div>
		
		<div class="body-main" style="margin-top: 50px;">
		
		
		
			<div class="row board-list-header">
	            <div class="col-auto me-auto" style="margin-bottom: 10px;">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
	            <div class="col-auto">&nbsp;</div>
	        </div>				
			
			<table class="table table-hover board-list">
				<thead class="table-light" style="border-color: white;">
					<tr>
						<th class="bw-60">번호</th>
						<th class="bw-auto">제목</th>
						<th class="bw-100">작성자</th>
						<th class="bw-100">작성일</th>
						<th class="bw-70">조회수</th>
						<th class="bw-50">파일</th>
					</tr>
				</thead>
				
				<tbody style="border-style: none; border-color: white;">
					<c:forEach var="dto" items="${list}">
						<tr onclick="location.href= '${articleUrl}&num=${dto.num}' " style="cursor: pointer;">
							<td>${dto.listNum}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
								<c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hitCount}</td>
							<td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="${pageContext.request.contextPath}/bbs/download?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-box">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/bbs/list" method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="keyword" value="${keyword}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/write';">글올리기</button>
				</div>
			</div>
			
			
			
			
		</div>
	</div>
</div>
</section>


