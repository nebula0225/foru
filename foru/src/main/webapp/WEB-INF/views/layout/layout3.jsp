<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	
	
	<title><tiles:insertAttribute name="title"/></title>
	
	<link rel="icon" type="${pageContext.request.contextPath}/resources/image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
        
     
</head>

<body id="page-top">

<header>
    <tiles:insertAttribute name="header"/>
</header>
	
<main>
    <tiles:insertAttribute name="body"/>
</main>

<footer>
    <tiles:insertAttribute name="footer"/>
</footer>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<!-- Login Modal -->
<script type="text/javascript">
	function dialogLogin() {
	    $("form[name=modelLoginForm] input[name=userId]").val("");
	    $("form[name=modelLoginForm] input[name=userPwd]").val("");
	    
		$("#loginModal").modal("show");	
		
	    $("form[name=modelLoginForm] input[name=userId]").focus();
	}

	function sendModelLogin() {
	    var f = document.modelLoginForm;
		var str;
		
		str = f.userId.value;
	    if(!str) {
	        f.userId.focus();
	        return;
	    }
	
	    str = f.userPwd.value;
	    if(!str) {
	        f.userPwd.focus();
	        return;
	    }
	
	    f.action = "${pageContext.request.contextPath}/member/login";
	    f.submit();
	}
</script>
<div class="modal fade" id="loginModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false" 
		aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginViewerModalLabel">Login</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
                <div class="p-3">
                    <form name="modelLoginForm" action="" method="post" class="row g-3">
                    	<div class="mt-0">
                    		 <p class="form-control-plaintext">계정으로 로그인 하세요</p>
                    	</div>
                        <div class="mt-0">
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div>
                            <input type="password" name="userPwd" class="form-control" placeholder="패스워드">
                        </div>
                        <div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMeModel">
                                <label class="form-check-label" for="rememberMeModel"> 아이디 저장</label>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary w-100" onclick="sendModelLogin();">Login</button>
                        </div>
                        <div>
                    		 <p class="form-control-plaintext text-center">
                    		 	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">패스워드를 잊으셨나요 ?</a>
                    		 </p>
                    	</div>
                    </form>
                    <hr class="mt-3">
                    <div>
                        <p class="form-control-plaintext mb-0">
                        	아직 회원이 아니세요 ?
                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
                        </p>
                    </div>
                </div>
        
			</div>
		</div>
	</div>
</div>

</body>
</html>