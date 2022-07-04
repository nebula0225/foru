<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.b_box {
	text-align: center;
	margin-top: 5rem;
}

.back_B {
	width: 300px;
}
</style>

<script type="text/javascript">
function move() {
	location.href = "${pageContext.request.contextPath}/member/login";
}

</script>


<!-- Contact Section-->
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">가입완료</h2>
<!-- Icon Divider-->
<div class="divider-custom">
    <div class="divider-custom-line"></div>
    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
    <div class="divider-custom-line"></div>
</div>
<!-- Contact Section Form-->
<div class="row justify-content-center b_box">
		<div class="form-floating mb-3">
			<button class="btn btn-primary btn-xl back_B" id="back" type="button" onclick="move();">돌아가기</button>
	</div>
</div>
</div>
</section>