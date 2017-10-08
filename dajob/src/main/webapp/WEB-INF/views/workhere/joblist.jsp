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
	<c:set var="workherelist" value="${workherelist}"/>
	<c:set var="comtype" value="${comtype}"/>
	<c:set var="list" value="${nlist}"/>
	<c:set var="curPage" value="${currentPage}"/>
	<c:set var="max" value="${maxPage}"/>
	<c:set var="listCnt" value="${listCount}"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
       #map {
        height: 400px;
        width: 100%;
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
                    <h2>Work Here</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Work Here</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	<div class="container">
  <h2>${company.company_name}</h2>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <h2>원하는 직무로 찾아보세요</h2>
                        <p>내가 원하는 직장을 직무로 찾아보자!</p>
                        <div class="search-form wow pulse" data-wow-delay="0.8s">
                        <c:url var="jobsearch" value="/jobsearch.do"/>
                            <form action="${jobsearch}" class=" form-inline">
                                <div class="form-group">
                                <input type="hidden" name="jobkey" id="jobkey" value="">
                                <input type="hidden" name="skillkey" id="skillkey" value="">
                                    <input type="text" name="title" class="form-control" placeholder="Job Key Word">
                                </div>
                                <div class="form-group">
                                    <select name="jobselect" id="jobselect" class="form-control">
                                        <option value="" selected>Select Wanna Job</option>
                                        <c:forEach var="job" items="${joblist}">
                                        <option value="${job.job_code}">${job.job_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="skillselect" id="skillselect" class="form-control">
                                        <option value="" selected>Select Your Skill</option>
                                        <c:forEach var="skill" items="${skilllist}">
                                        <option value="${skill.skill_code}">${skill.skill_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-social-linkedin" style="height:43px; margin-bottom:8px;"><i class="fa fa-search"></i>  Search</button>
                            </form>
                        </div>
                    </div>
                </div>
            
  <table class="table table-hover">
    <thead>
      <tr>
      	<th>회사 이름</th>
        <th>제목</th>
        <th>근무지</th>
        <th>직무</th>
        <th>필요기술</th>
        <th>마감일</th>
      </tr>
    </thead>
    <tbody>
   		 <c:forEach var="workherelist" items="${workherelist}">
      <tr>
      	<c:url var="workdetail" value="/workhereDetail.do">
        	<c:param name="workhere_no" value="${workherelist.work_no}"/>
        </c:url>
        <td>${workherelist.company_name }
        <c:forEach var="comtype" items="${comtype}">
        <c:if test="${workherelist.company_type eq comtype.company_type}">
        (${comtype.company_tname})
        </c:if></c:forEach></td>
        <td><a href="${workdetail}">${workherelist.work_title }</a></td>
        
        <td>${workherelist.work_workplace }</td>
        <c:forEach var="job" items="${joblist}">
        <c:if test="${ job.job_code eq workherelist.work_job}">
        <td>${job.job_name}</td>
        </c:if></c:forEach>
        <c:forEach var="skill" items="${skilllist}">
        <c:if test="${ skill.skill_code eq workherelist.work_skill}">
        <td>${skill.skill_name}</td>
        </c:if></c:forEach>
        <td>${workherelist.work_enddate }</td>
      </tr>
      </c:forEach>
      <tr>
							<td colspan="6" align="center"> 
							<ul class="pagination pull-center mrgt-0">
                            <c:if test="${curPage eq 1}">
                            <li class="active"><a href="#">&laquo;</a></li>
                            </c:if><c:if test="${curPage ne 1}">
                            <c:url var="workhereLt" value="/jobList.do">
                            	<c:param name="page" value="${curPage - 1}"/>
                            </c:url>
                            <li><a href="${workhereLt}">&laquo;</a></li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${max}">
                            <c:if test="${i eq curPage}">
                            	<li class="active"><a href="#">${i}</a></li>
                            </c:if>
                            <c:if test="${i ne curPage}">
                            <c:url var="wlistPage" value="/jobList.do">
                            	<c:param name="page" value="${i}"/>
                            </c:url>
                            	<li><a href="${wlistPage}">${i}</a></li>
                            </c:if>
                            </c:forEach>
                            <c:if test="${curPage eq max}">
                            <li class="active"><a href="#">&raquo;</a></li>
                            </c:if><c:if test="${curPage ne max}">
                            <c:url var="workhereRt" value="/jobList.do">
                            	<c:param name="page" value="${curPage + 1}"/>
                            </c:url>
                            <li><a href="${workhereRt}">&raquo;</a></li>
                            </c:if>
                            <c:if test="${member.member_type_code eq 'C'}">
                            &nbsp;&nbsp; &nbsp;
                            <button class="btn btn-primary" id="insertBtn" type="button" onclick="javascript:location.href='workboardInsertview.do';">글쓰기</button>
                            </c:if>
                        </ul>
							</td>
						</tr>
    </tbody>
  </table>
</div>
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	<script type="text/javascript">
	$("#jobselect").change(function(){
		$("#jobkey").val($("#jobselect option:selected").val());
		//console.log($("#jobkey").val());
	});
	$("#skillselect").change(function(){
		$("#skillkey").val($("#skillselect option:selected").val());
		//console.log($("#skillkey").val());
	});
	</script>
</body>
</html>