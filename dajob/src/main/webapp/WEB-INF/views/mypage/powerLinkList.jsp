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
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>" media="screen" data-name="skins">

    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
       header{
       	background: url("/dajob/resources/images/page-header.jpg") no-repeat;
       }
       .comment-body td{
       	font-size : 15pt;
       }
      	.powerlinkcnt td, th{
       	font-size : 14pt;
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
                    <h2>사용자 분석</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>사용자 분석</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	
	<!--start wrapper-->
	<section class="wrapper">
	<section class="content blog">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h1>회원 수 분석</h1>
						<div class="comment-container" style="margin-left:0;">
							<div class="comment-body">
                            	<table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>일반 회원 수 : </td>
                            <td>${userCnt} 명</td>
                        </tr>
                        <tr>
                            <td>기업 회원 수 : </td>
                            <td>${compCnt} 명</td>
                        </tr>
                        <tr>
                            <td>PowerLink 가입자 수 : </td>
                            <td>${fn:length(powerComp)} / ${compCnt} 명</td>
                        </tr>
                        <tr>
                            <td style="color:black;">총 가입자 수 : </td>
                            <td style="color:black;">${userCnt+compCnt} 명</td>
                        </tr>
                        </tbody>
                    </table>
                 	        </div>
						</div>
					</div>
				</div><!--/.row-->
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h1>WorkHere 게시글 분석</h1>
					<div class="comment-container" style="margin-left:0;">
							<div class="comment-body" style="height:400px;">
					<script src="https://code.highcharts.com/highcharts.js"></script>
					<script src="https://code.highcharts.com/modules/exporting.js"></script>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div id="workherechart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12" style="margin-left:50px;">
						<h1>사용률 분석표</h1>
						<table class="table powerlinkcnt">
						<thead>
						<tr>
							<th>게시글 분류</th>
							<th>게시글 갯수</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td style="padding-top: 15px; padding-bottom: 15px;">일반 게시글</td>
							<td style="padding-top: 15px; padding-bottom: 15px;">${fn:length(workherelist) - fn:length(powerList)} 개</td>
						</tr>
						<tr>
							<td style="padding-top: 15px; padding-bottom: 15px;">PowerLink 게시글</td>
							<td style="padding-top: 15px; padding-bottom: 15px;">${fn:length(powerList)} 개</td>
						</tr>
						<tr>
							<td style="padding-top: 15px; padding-bottom: 15px;">총 게시글</td>
							<td style="padding-top: 15px; padding-bottom: 15px;">${fn:length(workherelist)} 개</td>
						</tr>
						<tr><td colspan="2"></td></tr>
						</tbody>
						</table>
							</div>
						</div>
					</div>
				</div><!--/.row-->
				</div>
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="dividerHeading">
							<h4><span>PowerLink 가입자 리스트</span></h4>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>기업 명</th>
                            <th>담당자 이름</th>
                            <th>기업 구분</th>
                            <th>PowerLink 유효시간</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="comp" items="${powerComp}">
                        <tr>
                            <td>${comp.company_name}</td>
                            <td>${comp.member_name}</td>
                            <c:forEach var="type" items="${comTypeList}">
                            <c:if test="${type.company_type eq comp.company_type}">
                            	<td>${type.company_tname}</td>
                            </c:if>
                            </c:forEach>
                            <c:forEach var="link" items="${powerLink}">
                            <c:if test="${link.member_id eq comp.member_id}">
                            	<fmt:formatNumber var="test" value="${(link.powerlink_time / 24) - ((link.powerlink_time / 24) % 1)}" pattern="#"/>
                               		<c:set var="plDate" value="${test}" />
                               		<c:set var="plHour" value="${link.powerlink_time mod 24}"/>
                            	<td>${plDate} 일 ${plHour} 시간</td>
                            </c:if>
                            </c:forEach>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
						</div>
					</div><!--/.row-->
				</div> <!--/.container-->
		</section>
	</section> <!--end wrapper-->
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	
	<script type="text/javascript">
					$(function(){
						var powerCnt = "<c:out value='${fn:length(powerList)}'/>";
						var normalCnt = "<c:out value='${fn:length(workherelist) - fn:length(powerList)}'/>";
						Highcharts.chart('workherechart', {
							colors:['#a7d6d0','#123456'],
						    chart: {
						        type: 'column'
						    },
						    title: {
						        text: 'Work Here 사용 분석'
						    },
						    xAxis: {
						        categories: ['Work Here']
						    },
						    yAxis: {
						        min: 0,
						        title: {
						            text: 'Total Work Here Boards'
						        },
						        stackLabels: {
						            enabled: true,
						            style: {
						                fontWeight: 'bold',
						                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
						            }
						        }
						    },
						    legend: {
						        align: 'right',
						        x: -30,
						        verticalAlign: 'top',
						        y: 25,
						        floating: true,
						        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
						        borderColor: '#CCC',
						        borderWidth: 1,
						        shadow: false
						    },
						    tooltip: {
						        headerFormat: '<b>{point.x}</b><br/>',
						        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
						    },
						    plotOptions: {
						        column: {
						            stacking: 'normal',
						            dataLabels: {
						                enabled: true,
						                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
						            }
						        }
						    },
						    series: [{
						        name: 'PowerLink',
						        data: [parseInt(powerCnt)]
						    }, {
						        name: '일반 게시글',
						        data: [parseInt(normalCnt)]
						    }]
						});
					});
					</script>
</body>
</html>