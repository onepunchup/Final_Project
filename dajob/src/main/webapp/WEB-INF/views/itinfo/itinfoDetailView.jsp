<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>DA JOB : find Direct your job</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/dajob/resources/images/sitelogo2_fix.png" />
<!-- CSS FILES -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>" media="screen"
	data-name="skins">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/flexslider.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/switcher.css'/>" media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
header {
	background: url("/dajob/resources/images/page-header4.jpg") no-repeat;
}
.itinfo .it a{
	color: #fdffc6;
}
.itinfo .it a:hover{
	color: #64eac6;
}
.info-content{
	background-color: rgba(0,0,0,0.5);
}
</style>
</head>
<body>
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2 style="color:#0e1f3d;">IT Info</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li style="color:#0e1f3d;">You are here:</li>
							<li style="color:#0e1f3d;"><a href="index.do">Home</a></li>
							<li style="color:#0e1f3d;">IT info Detail</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<!--End Header-->
	<section class="wrapper">
		<!--start itinfo service-->
		<section class="parallax parallax-1">
			<div class="container">
				<!--<h2 class="center">Testimonials</h2>-->
				<div class="row">
					<div id="parallax-testimonial-carousel"
						class="parallax-testimonial carousel">
						<c:set var="curPage" value="${currentPage}"/>
						<div class="col-md-12">
							<div class="clearfix">
							<div class="dividerHeading">
							<h2 style="color: #e5fff8; line-height: 32pt;">
								${itinfo.itinfo_title}
								&nbsp;&nbsp; &nbsp;&nbsp;
								<c:url var="itupView" value="/itupdateView.do">
									<c:param name="itinfo_no" value="${itinfo.itinfo_no}"/>
								</c:url>
								<c:url var="itdel" value="/itdelete.do">
									<c:param name="itinfo_no" value="${itinfo.itinfo_no}"/>
								</c:url>
								<br>
								<font size="3" style="text-align: left;"><i class="fa fa-calendar"></i>&nbsp;작성일 : ${itinfo.itinfo_date}
								<c:if test="${member.member_type_code eq 'A'}">
								&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
								&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
								<button class="btn btn-social-pinterest btn-sm" onclick="location.href='${itupView}';">수정하기</button>
								&nbsp;&nbsp;&nbsp;
								<button class="btn btn-social-stumbleupon btn-sm" onclick="location.href='${itdel}';">삭제하기</button>
								</c:if>
								</font>
							</h2>
						</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<figure class="post_img">
									<a href="#">
										<img src="${pageContext.request.contextPath}/resources/images/${itinfo.itinfo_img}" style="width:100%;" alt="blog post">
									</a>
								</figure>
						<blockquote class="info-content">
							<p style="font-size: 14pt; line-height: 20pt; text-align: left;"><span class="dropcap_block default">${fn:substring(itinfo.itinfo_content,0,1)}</span>${fn:substring(itinfo.itinfo_content, 1, fn:length(itinfo.itinfo_content))}</p>
						</blockquote>
					</div>
					<p align="center">
							<a href="javascript:history.back();"
								class="btn btn-default btn-lg back_home"><i
								class="fa fa-arrow-circle-o-left"></i> Go to Back </a>
						</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<c:import url="../footer.jsp" />
<!-- 	<script type="text/javascript">
	/* $(function(){
		var height = "<c:out value='fn:length(itinfo.itinfo_content)'/>"+"em";
		$('.info-content').css('height',$(height));
	}); */
	</script> -->
</body>
</html>