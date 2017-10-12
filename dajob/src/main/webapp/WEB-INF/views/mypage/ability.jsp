<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>DA JOB : find Direct your job</title>
	<link rel="shortcut icon" type="image/x-icon" href="/dajob/resources/images/sitelogo2_fix.png"/>
	<!-- CSS FILES -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp"/>
        <div class="container page_head">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>내 능력 분석</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index,do">Home</a></li>
                            <li><a href="index.do">Mypage</a></li>
                            <li>My ability</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	<!--End Header-->
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content about">
			<div class="container">
			
			
				<div class="row sub_content">
					<div class="who">
						<div class="col-lg-6 col-sm-6">
							<div class="dividerHeading">
								<h4><span>보유 자격증 개수 : 
								<c:if test="${ empty countCert }">
			                   	 0개
			                    </c:if>
			                    <c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                    <c:if test="${ countCert.cert_value eq '총합' }">
				                    	${ countCert.cert_count }개
				                    </c:if>
			                    </c:forEach>
								</span></h4>
							</div>
							<p>자신이 사용가능한 기술에 대한 지표를 나타내주는 그래프입니다, 자신의 능력을 확인하세요! </p>
							<ul class="progress-skill-bar">
								<li>
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                		<c:if test="${ countCert.cert_value eq '공통' }">
											<span class="lable">${ countCert.cert_count }개</span>
										</c:if>
									</c:forEach>
									<div class="progress_skill">
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                		<c:if test="${ countCert.cert_value eq '공통' }">
											<div class="bar" data-value="${ countCert.cert_count * 17 }" role="progressbar" data-height="100">
												공통
											</div>
										</c:if>
									</c:forEach>
									</div>
								</li>
								
								<li>									
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                		<c:if test="${ countCert.cert_value eq 'JAVA' }">
											<span class="lable">${ countCert.cert_count }개</span>
										</c:if>
									</c:forEach>
									<div class="progress_skill">
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                		<c:if test="${ countCert.cert_value eq 'JAVA' }">
											<div class="bar" data-value="${ countCert.cert_count * 33 }" role="progressbar" data-height="100">
												JAVA
											</div>
										</c:if>
									</c:forEach>
									</div>
								</li>
								<li>
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
				                		<c:if test="${ countCert.cert_value eq 'DB' }">
											<span class="lable">${ countCert.cert_count }개</span>
										</c:if>
									</c:forEach>
									<div class="progress_skill">
									<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			                			<c:if test="${ countCert.cert_value eq 'DB' }">
											<div class="bar" data-value="${ countCert.cert_count * 17 }" role="progressbar" data-height="100">
												DB
											</div>
										</c:if>
									</c:forEach>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-sm-6">
                        <div class="promo_box" style="margin-top:0%">
                            <div class="col-sm-9">
                                <div class="promo_content">
                                    <h3 style="width: 140%;">취득 자격증 기준 <b style="color:#03adde">${ user.member_name }</b>님의 전문 능력 : 
                                     	<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
                                     		<c:if test="${ vs.index eq 1 }">
                                     			<b style="color:#03adde">${ countCert.cert_value }</b><br><br>
                                     		</c:if>
                                     		<c:if test="${vs.index eq 1 and countCert.cert_value eq 'JAVA'}">
                                     			관련된 직업으로는 웹 개발자, 웹 퍼블리셔, 웹 어플 개발자 등을 추천 드립니다.
                                     		</c:if>
                                     		<c:if test="${vs.index eq 1 and countCert.cert_value eq 'DB'}">
                                     			관련된 직업으로는 DB 운영자, DB 세션 관리자, DB 전문가 등을 추천 드립니다.
                                     		</c:if>
                                     		<c:if test="${vs.index eq 1 and countCert.cert_value eq '공통'}">
                                     			관련된 직업으로는 시스템 관리자, 솔루션 개발자 등을 추천 드립니다.
                                     		</c:if>
                                     	</c:forEach>
                                     </h3>
                                    <p>자신의 능력 분석을 통해, 지금 바로 이력서를 작성해 보세요!</p><br>
                                    <a href="resumeUpdate.do" class="btn btn-default btn-md">
                                       	이력서 작성하기
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
                
                <div class="row sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="dividerHeading">
                            <h4><span>연봉 측정</span></h4>
                            <p>능력분석을통해서 자신과 비슷한 사람의 연봉을 비교해보세요!</p><br>
                        </div>
                        <div id="col-lg-12 col-sm-12">
		            		<c:forEach items="${countCert}"  var="countCert" varStatus="vs">
			          		 <c:if test="${ countCert.cert_value eq '총합'}">
			              		 	<h2 style="margin:0; padding:0;">
			              		 	<c:set var="length" value="${ countCert.cert_count * 6.6}"/>
			              		 		<span style="padding-left:${length}%;"><i class="fa fa-caret-down" style="color:red; font-size:20pt;"></i></span>
			              		 	</h2>
			          		 </c:if>
		            		</c:forEach>
			            </div>
                        <div class="progress">
						  <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 25%">
						  	하위연봉
						    <span class="sr-only">25% Complete (success)</span>
						  </div>
						  <div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: 50%">
						  	평균연봉
						    <span class="sr-only">50% Complete (warning)</span>
						  </div>
						  <div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 25%">
						  	상위연봉
						    <span class="sr-only">25% Complete (danger)</span>
						  </div>
						</div>
						
			            <div id="col-lg-12 col-sm-12">
		            		<c:forEach items="${countCert}" var="countCert" varStatus="vs">
			          		 <c:if test="${ countCert.cert_value eq '총합'}">
			              		 <blockquote class="default">
		              		 		<h2 style="margin:0; padding:0;">
			              		 		<p align="center"><i class="fa fa-street-view" style="color:black;"></i>&nbsp;&nbsp;현재 내 위치</p>
		              		 		</h2><font style="font-size: 15pt; line-height: 20pt;">
				              		 		<c:if test="${ countCert.cert_count <= 3 }">
				              		 			<br> <p align="center">현재 당신의 위치는 <b style="color:green;">하위연봉</b>입니다. </p>
				              		 			<br><span class="dropcap_block" style="background-color: black;">연</span>봉 계산 기준 ${member.member_name}님이 받을 수 있는 급여는 2000 ~ 2400만원이며,
				              		 			<br>관련 전문 자격증을 ${ 4 - countCert.cert_count } 개 더 취득하시면 <b style="color:orange;">평균 연봉자</b>가 될 수 있습니다.
				              		 			<br>추천하는 추가 취득 전문 자격증으로는 하기 자격증을 취득하시는 것을 추천 드립니다.
				              		 		</c:if><c:if test="${ countCert.cert_count > 3 and  countCert.cert_count < 11 }">
				              		 			<br> <p align="center">현재 당신의 위치는 <b style="color:orange;">평균연봉</b>입니다.</p>
				              		 			<br><span class="dropcap_block" style="background-color: black;">연</span>봉 계산 기준 ${member.member_name}님이 받을 수 있는 급여는 2400 ~ 2600만원이며,
				              		 			<br>관련 전문 자격증을 ${ 12 - countCert.cert_count } 개 더 취득하시면 <b style="color:red;">상위 연봉자</b>가 될 수 있습니다.
				              		 			<br>추천하는 추가 취득 전문 자격증으로는 하기 자격증을 취득하시는 것을 추천 드립니다.
				              		 		</c:if><c:if test="${ countCert.cert_count > 11 }">
				              		 			<br> <p align="center">현재 당신의 위치는 <b style="color:red;">상위연봉</b>입니다.</p>
				              		 			<br><span class="dropcap_block" style="background-color: black;">연</span>봉 계산 기준 ${member.member_name}님이 받을 수 있는 급여는 2600 만원 이상이며,
				              		 			<br>현재 취업에 있어 자격증이 문제가 되지 않는 상태입니다!!
				              		 			<br>자신의 능력을 살려 멋진 직장에 취업하시길 기원합니다.
				              		 			<br>관련 추가 취득 자격증은 하기를 참조하시기 바랍니다.
				              		 		</c:if>
				              		 		</font>
			              		 </blockquote>
			          		 </c:if>
		            		</c:forEach>
			            </div>
                   	</div>
                </div>  
                
                                <div class="row  sub_content">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="dividerHeading">
                            <h4><span>관련 자격증 추천</span></h4>
                            <!-- <p>능력분석을 통해 자신에게 필요한 자격증을 추천합니다.</p> -->
                        </div>
                    </div>
                   	<c:forEach items="${ recommendCert }" var="recommendCert" varStatus="vs">
                   		<c:if test="${ vs.index <= 3 }">
	                    	<div class="col-lg-3 col-md-3 col-sm-6">
		                        <div class="team_prof">
		                            <h3 class="names">${ recommendCert.cert_name }<small>${ recommendCert.cert_type }</small></h3>
		                            <p class="description">${ recommendCert.cert_value }</p>
		                        </div>
		                    </div>
	                    </c:if>
                   	</c:forEach>
                </div> <!--./row-->
                
			</div>
		</section>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	
</body>
</html>