<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.main-img {
	height: 833px;
	object-fit: contain;
}

.main-back {
	background-image: url("${pageContext.request.contextPath}/resources/assets/img/main-back5.jpg");
	background-size: cover;
	background-position: center center;
}
</style>

<script type="text/javascript">

$(function(){
	
	$('#menuButton').click(function(){
		if( $('#navbarResponsive').css('display') === 'none' ) {
			$("#navbarResponsive").show();
		} else {
			$("#navbarResponsive").hide();
		}
	});
	
	
});

</script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Only for you</title>
<!-- Favicon-->
<link rel="icon" type="resources/image/x-icon" href="resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
    
        
<!-- Masthead-->
<!-- header class remove -> masthead -->
<!-- 배경색 제거함 header 클래스 bg-primary -->
<header class="main-back text-white text-center">

<!-- Navigation-->
<div style="min-height: 100px;">
	<nav class="navbar navbar-expand-lg text-uppercase fixed-top" id="mainNav">
	    <div class="container">
	        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Only for you</a>
	        <button id="menuButton" class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	            Menu
	            <i class="fas fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	            <ul class="navbar-nav ms-auto">
	                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">포토그래피</a></li>
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
	                <c:choose>
		                <c:when test="${member.userId != null && member.membership == 0}">
		                	<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/member/logout">안녕하세요 ${member.userId} 님</a></li>
		                </c:when>
		                <c:when test="${member.userId != null && member.membership == 1}">
		                	<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/member/logout"> [VIP] ${member.userId} 님</a></li>
		                </c:when>
	                </c:choose>
	            </ul>
	        </div>
	    </div>
	</nav>
</div>


    <div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
		<!-- <img class="masthead-avatar mb-5" src="${pageContext.request.contextPath}/resources/assets/img/main.JPG" alt="main.jpg" />  -->
		<!-- 부트스트랩 캐러셀 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	
	<div class="carousel-indicators">
	  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>

	<div class="carousel-inner">
	
	<div class="carousel-item">
	  <img src="${pageContext.request.contextPath}/resources/assets/img/main1.jpg" class="d-block w-100 masthead-avatar mb-5 main-img" alt="main-1">
	</div>

	<div class="carousel-item">
	  <img src="${pageContext.request.contextPath}/resources/assets/img/main2.jpg" class="d-block w-100 masthead-avatar mb-5 main-img" alt="main-2">
	</div>
	
	<div class="carousel-item active">
	  <img src="${pageContext.request.contextPath}/resources/assets/img/main3.JPG" class="d-block w-100 masthead-avatar mb-5 main-img" alt="main-3">
	</div>
	    
	</div>
  
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
    <!-- Masthead Heading-->
	<h1 class="masthead-heading text-uppercase mb-0">해보고 후회 하자</h1>
	<!-- Icon Divider-->
	<div class="divider-custom divider-light">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
<!-- Masthead Subheading-->
        <p class="masthead-subheading font-weight-light mb-0" style="padding-bottom: 35px;">오늘의 한마디</p>
    </div>
</header>



	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
	    <div class="container">
	        <!-- Portfolio Section Heading-->
	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Photography</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Grid Items-->
	<div class="row justify-content-center">
    <!-- Portfolio Item 1-->
	<div class="col-md-6 col-lg-4 mb-5">
	    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
	        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	        </div>
	        <img class="img-fluid" src="resources/assets/img/one.JPG" alt="..." />
	    </div>
	</div>
	<!-- Portfolio Item 2-->
	<div class="col-md-6 col-lg-4 mb-5">
	    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
	        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	        </div>
	        <img class="img-fluid" src="resources/assets/img/two.JPG" alt="..." />
	    </div>
	</div>
	<!-- Portfolio Item 3-->
	<div class="col-md-6 col-lg-4 mb-5">
	    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
	        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	        </div>
	        <img class="img-fluid" src="resources/assets/img/three.JPG" alt="..." />
	    </div>
	</div>
	<!-- Portfolio Item 4-->
	<div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
	    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
	        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	        </div>
	        <img class="img-fluid" src="resources/assets/img/four.JPG" alt="..." />
	    </div>
	</div>
	<!-- Portfolio Item 5-->
	<div class="col-md-6 col-lg-4 mb-5 mb-md-0">
	    <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
	        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
	            <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
	        </div>
	        <img class="img-fluid" src="resources/assets/img/five.JPG" alt="..." />
	    </div>
	</div>
	<!-- Portfolio Item 6-->
            <div class="col-md-6 col-lg-4">
                <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                    <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                    </div>
                    <img class="img-fluid" src="resources/assets/img/six.JPG" alt="..." />
                </div>
            </div>
        </div>
    </div>
</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
	    <div class="container">
	        <!-- About Section Heading-->
	<h2 class="page-section-heading text-center text-uppercase text-white">About her</h2>
	<!-- Icon Divider-->
	<div class="divider-custom divider-light">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- About Section Content-->
	<div class="row">
		<!-- 지운 클래스 col-lg-4 me-auto -->
	    <div class=""><p class="lead" style="text-align: center;">개인 프로젝트 홈페이지</p></div>
	    <div class=""><p class="lead" style="text-align: center;">Made by Hyeok</p></div>
	</div>
	<!-- About Section Button-->
	        <div class="text-center mt-4">
	            <a class="btn btn-xl btn-outline-light" href="https://www.instagram.com/twicetagram/">
	                <i class="fas fa-download me-2"></i>
	                Instagram~
	            </a>
	        </div>
	    </div>
	</section>
	
	
	<!-- Portfolio Modals-->
	<!-- Portfolio Modal 1-->
	<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Log Cabin</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/one.JPG" alt="category1-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Portfolio Modal 2-->
	<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Tasty Cake</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/two.JPG" alt="category2-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Portfolio Modal 3-->
	<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Circus Tent</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/three.JPG" alt="category3-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Portfolio Modal 4-->
	<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Controller</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/four.JPG" alt="category4-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Portfolio Modal 5-->
	<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Locked Safe</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/five.JPG" alt="category5-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Portfolio Modal 6-->
	<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
	    <div class="modal-dialog modal-xl">
	        <div class="modal-content">
	            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
	            <div class="modal-body text-center pb-5">
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-lg-8">
	                            <!-- Portfolio Modal - Title-->
	<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">서면역에서</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
	    <div class="divider-custom-line"></div>
	    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	    <div class="divider-custom-line"></div>
	</div>
	<!-- Portfolio Modal - Image-->
	<img class="img-fluid rounded mb-5" src="resources/assets/img/six.JPG" alt="category6-modal" />
	<!-- Portfolio Modal - Text-->
	                            <p class="mb-4" style="font-weight: bold;">너와 함께하는 순간 하나하나가<br>너를 사랑하기에 좋은 시간이다</p><p style="font-weight: bold;">중의적 - 흔글</p>
	                            <button class="btn btn-primary" type="button" data-bs-dismiss="modal">
	                                <i class="fas fa-times fa-fw"></i>
									창 닫기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

