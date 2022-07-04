<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	.msgFont {
		font-size: 18px;
		font-style: bold;
		color: red;
	}
</style>

<script type="text/javascript">
function sendLogin() {
    var f = document.loginForm;
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


<!-- Contact Section-->
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">로그인</h2>
<!-- Icon Divider-->
<div class="divider-custom">
    <div class="divider-custom-line"></div>
    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
    <div class="divider-custom-line"></div>
</div>
<!-- Contact Section Form-->
<div class="row justify-content-center">
    <div class="col-lg-8 col-xl-7">
        <!-- * * * * * * * * * * * * * * *-->
<!-- * * SB Forms Contact Form * *-->
<!-- * * * * * * * * * * * * * * *-->
<!-- This form is pre-integrated with SB Forms.-->
<!-- To make this form functional, sign up at-->
<!-- https://startbootstrap.com/solution/contact-forms-->
<!-- to get an API token!-->
<form id="contactForm" name="loginForm" method="post" data-sb-form-api-token="API_TOKEN">
    <!-- Name input-->
<div class="form-floating mb-3">
    <input class="form-control" id="userId" name="userId" type="text" placeholder="Enter your Id..." data-sb-validations="required" />
    <label for="name">아이디</label>
    <div class="invalid-feedback" data-sb-feedback="name:required">Id is required.</div>
</div>
<!-- Email address input-->
<div class="form-floating mb-3">
    <input class="form-control" id="userPwd" name="userPwd" type="password" placeholder="password" data-sb-validations="required,email" />
    <label for="email">비밀번호</label>
    <div class="invalid-feedback" data-sb-feedback="email:required">Pwd is required.</div>
    <div class="invalid-feedback" data-sb-feedback="email:email">Pwd is not valid.</div>
</div>
<!-- Submit success message-->
<!---->
<!-- This is what your users will see when the form-->
<!-- has successfully submitted-->
<div class="d-none" id="submitSuccessMessage">
    <div class="text-center mb-3">
        <div class="fw-bolder">Form submission successful!</div>
        To activate this form, sign up at
        <br />
        <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
    </div>
</div>
<!-- Submit error message-->
<!---->
<!-- This is what your users will see when there is-->
<!-- an error submitting the form-->
<div class="d-none" id="submitErrorMessage">
	<div class="text-center text-danger mb-3">Error sending message!</div>
</div>
					<!-- Submit Button-->
					<div style="">
	                    <button class="btn btn-primary btn-xl" id="submitButton" type="button" style="float: left;" onclick="sendLogin();">로그인</button>
	                    <button class="btn btn-primary btn-xl" id="submitButton" type="button" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/member/signUp' ">회원가입</button>
                    </div>
                    <div style="clear: both;">
                    	<p class="msgFont">${msg}</p>
                    </div>
                    
</form>
            </div>
        </div>
    </div>
</section>