<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>DA JOB : find Direct your job</title>
	<link rel="shortcut icon" type="image/x-icon" href="/dajob/resources/images/sitelogo2_fix.png"/>
	<!-- CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/interview/interviewlist.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">

    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>
	<c:set var="workhere" value="${workhere}"/>
	<c:forEach var="workjob" items="${joblist}">
	 <c:if test="${workjob.job_code eq workhere.work_job}">
	 	<c:set var="wJob" value="${workjob.job_name}"/>
	 </c:if>
	</c:forEach>
	<c:forEach var="workskill" items="${skilllist}">
	 <c:if test="${workskill.skill_code eq workhere.work_skill}">
	 	<c:set var="wSkill" value="${workskill.skill_name}"/>
	 </c:if>
	</c:forEach>
	<c:set var="skill" value="${skill}"/>
	<c:set var="member" value="${member}"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
       header{
       	background: url("/dajob/resources/images/page-header3.jpg") no-repeat;
       }
    </style>
</head>
<body>

	<!--Start Header-->
	<header>
	<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2 style="color:#0c1830;">${workhere.company_name}</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li style="color:#0c1830;">You are here:</li>
                            <li style="color:#0c1830;"><a href="index.do">Home</a></li>
                            <li style="color:#0c1830;">workhere</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>

  <div class="container">
        <!-- ===========================
        HEADER
        ============================ -->
        <div id="header" class="row">

            <div class="col-lg-10">
                <div class="cv-title">
                    <c:url var="wdel" value="/workhereDelete.do">
									<c:param name="workhere_no" value="${workhere.work_no}"/>
								</c:url>
					<h2>${workhere.work_title} : [${wJob}]</h2>
                    <%-- <h2>${workhere.work_job }</h2> --%>
                    <c:if test="${member.member_type_code eq 'U' }">
                    <c:url var="interviewinsert" value="/interviewInsertView.do">
			        	<c:param name="workhere_no" value="${workhere.work_no}"/>
			        </c:url>
                    <a class="btn btn-success" href="${interviewinsert}"><span class="glyphicon glyphicon-edit"></span>인터뷰 신청하기</a>
                	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                	<a class="btn btn-danger" onclick="likeAdd();"><span class="fa fa-heart"></span> 선호 기업 정보 등록</a>
                	</c:if>
                	<c:if test="${member.member_type_code eq 'C' }">
                    <a class="btn btn-success" href="${wdel}"><span class="glyphicon glyphicon-edit"></span>삭제하기</a>
                	</c:if>
                </div><!-- Title end-->

            </div><!-- header right end-->
        </div><!-- header end-->

        <hr class="firsthr">

        <!-- ===========================
        BODY LEFT PART
        ============================ -->
        <div class="col-md-8 mainleft">
            <div id="statement" class="row mobmid">
                <div class="col-sm-1">
                    <span class="secicon fa fa-user"></span>
                </div><!--icon end-->

                <div class="col-sm-11">
                    <h3>${workhere.work_title } </h3>
                    <blockquote>
                    <p>${workhere.work_content }</p>
                    </blockquote>
                </div><!--info end-->
            </div><!--personal statement end-->

            <hr>
            <!-- ===========================
            JOB EXPERIENCES
            ============================ -->
            <div id="job" class="row mobmid">
                <div class="col-sm-1">
                    <span class="secicon fa fa-briefcase"></span>
                </div><!--icon end-->

                <div class="col-sm-11">
                    <h3>Job Experiences</h3>

                    <div class="row">
                        <div class="col-md-9">
                            <h4>Lead Graphic Designer</h4>
                            <p class="sub"><a href="">Lifeview Media Ltd.</a>
                            </p>
                            <p>Adipiscing elit. Nullam dapibus vehicula condimentum. Curabitur elit enim, accumsan vitae tristique ut, mollis at orci. Fusce cursus interdum neque nec aliquam. Proin turpis leo, laoreet non ultricies non, dictum nec nulla.</p>
                        </div>

                        <div class="year col-md-3">
                            <p>2008 - present</p>
                        </div>
                    </div><!--Job 1 end-->
                </div><!--Job experiences end-->
            </div><!--Job experiences end-->
        </div><!--left end-->
        
        <!-- ===========================
        SIDEBAR
        =========================== -->
        <div class="col-md-4 mainright">
            <div class="row">
                <div class="col-sm-1 col-md-2 mobmid">
                    <span class="secicon fa fa-magic"></span>
                </div><!--icon end-->

                <div class="col-sm-11 col-md-10">
                    <h3 >필요한 기술 </h3>
                    <h4><span class="glyphicon glyphicon-star">${wSkill}</span></h4>
                    <%-- <c:forEach var="skill" items="${skill}">
                    <h4><span class="glyphicon glyphicon-star">${skill}</span></h4>
                    </c:forEach> --%>
					
                </div><!--info end-->
            </div><!--tech skills end-->
            
            <hr>

            <div class="row mobmid">
                <div class="col-sm-1 col-md-2">
                    <span class="secicon fa fa-trophy"></span>
                </div><!--icon end-->

                <div class="col-sm-11 col-md-10 ">
                    <h3>Awards</h3>

                    <div class="award">
                        <h4>Best Designer 2012</h4>
                        <p class="sub"><a href="">Life View Media Ltd.</a></p>
                        <p>Studying all aspect of Graphic Design Including Advertising Design, Branding, Copy Exhibition Design, Ilustration.</p>
                    </div>
                    <!--1st award end-->

                    <div class="award">
                        <h4>Best Designer 2011</h4>
                        <p class="sub"><a href="">Alexa Design Solution</a></p>
                        <p>Studying all aspect of Graphic Design Including Advertising Design, Branding, Copy Exhibition Design, Ilustration, Information Design, Packaging Design and Website Design</p>
                    </div><!--1st award end-->
                </div><!--awards end-->

            </div>
            
        </div><!--right end-->
    </div><!--container end-->
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->

<script type="text/javascript">
function likeAdd(){
	$.ajax({
		url : "likeCompAdd.do",
		type : "post",
		data : {
			userid : "<c:out value='${member.member_id}'/>",
			work_no : "<c:out value='${workhere.work_no}'/>"
		},
		dataType : "text",
		success : function(value) {
			if(value == "ok"){
				alert("선호 기업에 등록되었습니다.");
			} else if(value == "no:1"){
				alert("선호 기업에서 삭제되었습니다.");
			} else {
				alert("에러!!: 관리자에게 문의 하세요!");
			}
		},
		error : function(value) {
			alert("에러 : " + value);
		}
	});
};
</script>

</body>
</html>