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
function sendOk() {
    var f = document.boardForm;
	var str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/bbs/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(num) {
		if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
			return;
		}
		var url = "${pageContext.request.contextPath}/bbs/deleteFile?num=" + num + "&page=${page}";
		location.href = url;
	}
</c:if>
</script>

<section class="page-section" id="contact">
<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-heart"></i> 게시판 <small class="fs-6 fw-normal">Board</small></h3>
		</div>
		
		<div class="body-main">
		
			<form name="boardForm" method="post" enctype="multipart/form-data">
				<table class="table write-form mt-5">
					<tr>
						<td class="table-light col-sm-2 " style="background-color: white;" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="table-light col-sm-2 " style="background-color: white;" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2 " style="background-color: white;" scope="row">내 용</td>
						<td>
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2 table-custom" style="background-color: white;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td> 
							<input type="file" name="selectFile" class="form-control" style="color: gray;">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td class="table-light col-sm-2" scope="row">첨부된파일</td>
							<td> 
								<p class="form-control-plaintext">
									<c:if test="${not empty dto.saveFilename}">
										<a href="javascript:deleteFile('${dto.num}');"><i class="bi bi-trash"></i></a>
										${dto.originalFilename}
									</c:if>
									&nbsp;
								</p>
							</td>
						</tr>
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-light" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2-circle"></i></button>
							<button type="reset" class="btn btn-light">원상복귀&nbsp;<i class="bi bi-arrow-repeat"></i></button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
								<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
</section>