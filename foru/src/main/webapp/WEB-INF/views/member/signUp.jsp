<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
input:read-only {
    background-color: #1abc9c;
}

.email_font {
	font-size: 20px;
	display: inline-block;
	padding: 0 20px 50px 20px; 
	
}

.select_font {
	font-size: 18px;
	font-weight: bold;
	text-align: center;
}

.phone_p_tag {
	display: inline-block;
	font-size: 18px;
	font-weight: bold;
}

.zip_Button{
	width: 200px;
	display: inline-block;
	margin-left: 20px;
	margin-top: 15px;
	font-size: 15px;
}

.box-check {
	margin-bottom: 25px;
	margin-top: 25px;
	
	font-size: 20px;
}

.vip-code-ok {
	color: #1abc9c;
}

.vip-code-fail {
	color: red;
}
</style>

<script type="text/javascript">
function sendLogin() {
	
    var f = document.memberForm;
    
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
    
    str = f.userName.value;
    if(!str) {
    	f.userName.focus();
    	return;
    }
    
    str = f.email.value;
    if(!str) {
    	f.email.focus();
    	return;
    }
    
    str = f.email2.value;
    if(!str) {
    	f.email2.focus();
    	return;
    }
    
    str = f.tel.value;
    if(!str) {
    	f.tel.focus();
    	return;
    }
    
    str = f.tel2.value;
    if(!str) {
    	f.tel2.focus();
    	return;
    }
    
    str = f.birth.value;
    if(!str) {
    	f.birth.focus();
    	return;
    }
    
    str = f.zip.value;
    if(!str) {
    	f.zip.focus();
    	return;
    }
    
    str = f.addr2.value;
    if(!str) {
    	f.addr2.focus();
    	return;
    }
    
    // 약관
    if($("#agree").is(":checked") == false) {
		alert("약관 동의 해주세요");
		return;
	}
    

    f.action = "${pageContext.request.contextPath}/member/signUp";
    f.submit();
}

function changeEmail() {
	var f = document.memberForm;
	
	var str = f.selectEmail.value;
	if(str != "direct") {
		f.email2.value = str;
		f.email2.readOnly = true;
		f.email.focus();
	} else {
		f.email2.value = "";
		f.email2.readOnly = false;
		f.email.focus();
	}
}

// 약관 동의 관련
$(function(){
	$("#agree_Button").click(function(){
		$("#agree").prop("checked", true);
	});
	
	$("#agree_Button2").click(function(){
		$("#agree").prop("checked", true);
	});
});

// vip 코드 체크 관련
$(function(){
	
	$("#vip_check").click(function(){
		var x = $("#vipCode").val();
		if(x != "수진쨩") {
			$("#vip_explain").html("잘못된 코드 입니다.");
			$("#vip_explain").removeClass();
			$("#vip_explain").addClass("vip-code-fail");
			$("#vipCode2").val("0");
		} else {
			$("#vip_explain").html("코드 적용 완료 !");
			$("#vip_explain").removeClass();
			$("#vip_explain").addClass("vip-code-ok");	
			$("#vipCode2").val("1"); // vip 코드 입력시 멤버쉽 1
		}
		
	});
	
	$("#test_check").click(function(){
		var x = $("#vipCode2").val();
		alert(x);
	});
	
});

</script>


<!-- Contact Section-->
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
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
<form id="contactForm" data-sb-form-api-token="API_TOKEN" name="memberForm" method="post">
<!-- ID input-->
<div class="form-floating mb-3">
    <input class="form-control" id="userId" name="userId" type="text" placeholder="Enter your name..." data-sb-validations="required" />
    <label for="userId">아이디</label>
    <div class="invalid-feedback" data-sb-feedback="name:required">ID is required.</div>
</div>
<!-- pwd input-->
<div class="form-floating mb-3">
    <input class="form-control" id="pwd" name="userPwd" type="password" placeholder="Enter your pwd..." data-sb-validations="required" />
    <label for="name">비밀번호</label>
    <div class="invalid-feedback" data-sb-feedback="name:required">Pwd is required.</div>
</div>
<!-- Name input-->
<div class="form-floating mb-3">
    <input class="form-control" id="name" name="userName" type="text" placeholder="Enter your Name..." data-sb-validations="required" />
    <label for="name">이름</label>
    <div class="invalid-feedback" data-sb-feedback="name:required">Name is required.</div>
</div>
<!-- Email address input-->
<div class="form-floating mb-3">
    <input class="form-control" style="width: 50%; display: inline-block;" id="email" name="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
    <label for="email">이메일</label>
    <p class="email_font">@</p>
    <input class="form-control" style="width: 30%; height:104px; display: inline-block;" id="email2" name="email2" type="email" data-sb-validations="required,email" value="naver.com" />
    <select class="form-control select_font" id="" name="selectEmail" onchange="changeEmail();">
    	<option value="naver.com" selected="selected">네이버</option>
    	<option value="daum.net">다음</option>
    	<option value="gmail.com">구글</option>
    	<option value="direct">직접입력</option>
    </select>

    <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
    <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
</div>
<!-- Phone number input-->
<div class="form-floating mb-3">
    <input class="form-control" style="width: 16.5%; display: inline-block; background: none" id="" type="tel" readonly="readonly" value="010" data-sb-validations="required" />
    <p class="phone_p_tag">-</p>
    <label for="phone">핸드폰 번호</label>
    <input class="form-control" style="width: 38%; display: inline-block;" id="tel" name="tel" type="tel" data-sb-validations="required" />
    <p class="phone_p_tag">-</p>
	<label for="phone">핸드폰 번호</label>
    <input class="form-control" style="width: 38%; display: inline-block;" id="tel2" name="tel2" type="tel" data-sb-validations="required" />
    <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
</div>

<!-- birht input-->
<div class="form-floating mb-3">
    <input class="form-control" id="birth" name="birth" type="date" placeholder="Enter your birth..." data-sb-validations="required" />
    <label for="name">생일</label>
    <div class="invalid-feedback" data-sb-feedback="name:required">birth is required.</div>
</div>

<!-- zip-->
<div class="form-floating mb-3">
    <input class="form-control" type="text" name="zip" id="zip" placeholder="우편번호" readonly="readonly" style="display: inline; width: 70%;">
    <button class="btn btn-primary btn-xl zip_Button" type="button" onclick="daumPostcode();">우편번호 검색</button>
	<label for="zip">우편번호</label>
</div>
<!-- address -->
<div class="form-floating mb-3">
    <input class="form-control" style="" type="text" name="addr1" id="addr1" data-sb-validations="required" readonly="readonly" placeholder="기본 주소"/>
    <label for="addr1">기본 주소</label>
</div>
<div class="form-floating mb-3">
	<input class="form-control" style="" type="text" name="addr2" id="addr2" data-sb-validations="required" placeholder="상세 주소"/>
	<label for="addr2">상세 주소</label>
</div>

<!-- Message input-->
<div class="form-floating mb-3">
    <input class="form-control" id="vipCode" type="text" placeholder="Enter your VIP Code here..." style="height: 10rem; display: inline-block; width: 80%; margin-right: 50px;" data-sb-validations="required"></input>
    <input id="vipCode2" name="membership" type="hidden" value="0" ></input>
    <label for="message">VIP Code</label>
    <div class="invalid-feedback" data-sb-feedback="message:required">A VIP Code is required.</div>
    <button class="btn btn-primary" id="vip_check" style="display: inline-block; margin-top: 20px;" type="button" >체크</button>
    <button class="btn btn-primary" id="test_check" style="display: none;" type="button">test</button>
</div>
<div id="vip_explain">
	
</div>

<!-- 약관동의 -->
<div class="form-check box-check" data-bs-toggle="modal" data-bs-target="#agreeModal">
    <input class="form-check-input" type="checkbox" id="agree" name="agree" value="" disabled="disabled"></input>
    <label class="form-check-label" style="" for="agree">약관 동의</label>
</div>

<!-- agree Modals-->
<div class="portfolio-modal modal fade" id="agreeModal" tabindex="-1" aria-labelledby="agreeModal" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">약관</h2>
<!-- Icon Divider-->
<div class="divider-custom">
    <div class="divider-custom-line"></div>
    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
    <div class="divider-custom-line"></div>
</div>
<!-- Portfolio Modal - Image-->
<img class="img-fluid rounded mb-5" src="${pageContext.request.contextPath}/resources/assets/img/agree.jpg" alt="agree.jpg" />
<!-- Portfolio Modal - Text-->
                            <p class="mb-4">그녀는 예쁩니다 인정하나요</p>
                            <button class="btn btn-primary" id="agree_Button" type="button" data-bs-dismiss="modal">
								네 인정합니다
                            </button>
                            <button class="btn btn-primary" id="agree_Button2" type="button" data-bs-dismiss="modal">
								선택은 동의뿐
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
<div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
<!-- Submit Button-->
                    <button class="btn btn-primary btn-xl" id="submitButton" type="button" style="float: left;" onclick="sendLogin();">가입하기</button>
                    <button class="btn btn-primary btn-xl" id="submitButton" type="button" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/member/login' ">돌아가기</button>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>