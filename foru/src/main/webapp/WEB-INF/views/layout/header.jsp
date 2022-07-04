<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

        <!-- Navigation-->
        <div style="min-height: 76px;">
	        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
	            <div class="container">
	                <a class="navbar-brand" href="${pageContext.request.contextPath}/">Only for you</a>
	                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	                    Menu
	                    <i class="fas fa-bars"></i>
	                </button>
	                <div class="collapse navbar-collapse" id="navbarResponsive">
	                    <ul class="navbar-nav ms-auto">
	                        <!-- <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Portfolio</a></li> -->
	                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/bbs/list">게시판</a></li>
	                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/chat/main">채팅</a></li>
	                        
	                        <c:choose>
			                	<c:when test="${member.userId == null}">
			                		<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
			                	</c:otherwise>
	                		</c:choose>
	                    </ul>
	                </div>
	            </div>
	        </nav>
		</div>
	
<script type="text/javascript">
	$(function(){
		var isLogin = "${not empty sessionScope.member ? 'true':'false'}";
		var timer = null;
		
		if(isLogin === "true") {
			newNoteCount();
			
			// 10분 후 10분 마다 한번씩 호출
			// timer = setInterval("newNoteCount();", 1000 * 60 * 10);
		}
		
		function newNoteCount() {
			var url = "${pageContext.request.contextPath}/note/newNoteCount";
			var query = "tmp=" + new Date().getTime();
			
			$.ajax({
				type : "get",
				url : url,
				data : query,
				dataType : "json",
				success : function(data){
					var newCount = parseInt(data.newCount);
					if(newCount === 0) {
						$(".new-noteCount").hide();
						return false;
					}
					if(newCount >= 10) {
						$(".new-noteCount").text("9+");
					} else {
						$(".new-noteCount").text(newCount);
					}
				},
				error : function(jqXHR){
					if(timer != null) {
						clearInterval(timer); // 타이머 종료
						timer = null;
					}
					console.log(jqXHR.responseText);
				}
				
			});
		}
		
	});
</script>
