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
       	background: url("/dajob/resources/images/page-header8.jpg") no-repeat;
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
                    <h2>Integrated Dash Board</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Dash Board</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content contact">
			<div class="container">
				<div class="row sub_content">
				 <c:set var="tot" value="${requestScope.tot_profit }" />
				 <div class="dividerHeading">
					<h4><span>Job Place Analysis</span></h4>
				 </div>
				  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 20px; height: 370px; width: 50%;">
						<h1>지역별 구인 정보 분석</h1>
						<div class="comment-container" style="margin-left:0;">
							<div class="comment-body">
                            	<table class="table table-striped table-hover">
                            	<tr>
									<th>Location</th><th>Count</th>
								</tr>
                        <thead>
                        <tr>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="a" items="${ requestScope.area_top5 }">
				 			<tr>
                           		 <td>${ a.area }  </td>
                            	 <td>${ a.area_count}</td>
                       		</tr>
						 </c:forEach>
                        </tbody>
                    </table>
                 	        </div>
						</div>
					</div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
				 <div id="chartContainer" style="height: 370px; width: 50%; padding-left: 50%;">
				 </div>
				 <div class="dividerHeading">
					<h4><span>Site Profit</span></h4>
				 </div>
				  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 10px; height: 370px; width: 50%;">
						<h1>월별 수익 분석</h1>
						<div class="comment-container" style="margin-left:0;">
							<div class="comment-body">
                            	<table class="table table-striped table-hover">
                            	<tr>
									<th>Month</th><th>Profit</th>
								</tr>
                        <thead>
                        <tr>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${ requestScope.mon_profitArr }">
				 			<tr>
                           		 <td>${ m.mon } 月  </td>
                            	 <td>${ m.mon_profit }</td>
                       		</tr>
						 </c:forEach>
                        </tbody>
                    </table>
                 	        </div>
						</div>
					</div>
				 <div id="chartContainer2" style="height: 370px; width: 50%; padding-left: 50%;">
				 </div>
				 <div class="dividerHeading">
					<h4><span>월별 구인정보 신청횟수</span></h4>
				 </div>
				 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 10px; height: 370px; width: 50%;">
						<h1>월별 신청 횟수</h1>
						<div class="comment-container" style="margin-left:0;">
							<div class="comment-body">
                            	<table class="table table-striped table-hover">
                            	<tr>
									<th>Month</th><th>Job Infomation</th>
								</tr>
                        <thead>
                        <tr>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m2" items="${ requestScope.mon_top5 }">
				 			<tr>
                           		 <c:if test="${ m2.mon ne '합계' }">
                           		 <td>${ m2.mon } 月  </td>
                           		</c:if>
                           		<c:if test="${ m2.mon eq '합계' }">
                           		 <td>${ m2.mon } </td>
                           		</c:if>
                            	 <td>${ m2.mon_count }</td>
                       		</tr>
						 </c:forEach>
                        </tbody>
                    </table>
                 	        </div>
						</div>
					</div>
					 <div id="chartContainer3" style="height: 300px; width: 50%; padding-left: 50%;">
  					 </div>
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<script type="text/javascript">
	window.onload = function () {
		var areaList = new Array();
		var areaCountList = new Array();
		<c:forEach var="a" items="${ requestScope.area_top5 }">
			areaList.push("${a.area}");
			areaCountList.push("${a.area_count}");
		</c:forEach>
		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "light2",
			animationEnabled: true,
			title: {
				text: "Job information of each area"
			},
			subtitles: [{
				text: "",
				fontSize: 16
			}],
			data: [{
				type: "pie",
				indexLabelFontSize: 18,
				radius: 80,
				indexLabel: "{label} - {y}",
				yValueFormatString: "###0.0\"%\"",
				click: explodePie,
				dataPoints: [
					{ y: (areaCountList[0] / areaCountList[5]) * 100, label: areaList[0] },
					{ y: (areaCountList[1] / areaCountList[5]) * 100, label: areaList[1] },
					{ y: (areaCountList[2] / areaCountList[5]) * 100, label: areaList[2] },
					{ y: (areaCountList[3] / areaCountList[5]) * 100, label: areaList[3] },
					{ y: (areaCountList[4] / areaCountList[5]) * 100, label: areaList[4] }
				]
			}]
		});
		chart.render();

		function explodePie(e) {
			for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
				if(i !== e.dataPointIndex)
					e.dataSeries.dataPoints[i].exploded = false;
			}
		}
		var yearList = new Array();
		var monList = new Array();
		var monProfitList = new Array();
		<c:forEach var="m" items="${requestScope.mon_profitArr }">
			yearList.push("${ m.year}");
			monList.push("${ m.mon}월");
			monProfitList.push("${ m.mon_profit }");
		</c:forEach>
		var chart2 = new CanvasJS.Chart("chartContainer2", {
			animationEnabled: true,
			theme: "light2", // "light1", "light2", "dark1", "dark2"
			title:{
				text: yearList[0] + " Monthly Revenue"
			},
			axisY: {
				title: "Monthly Profit"
			},
			data: [{        
				type: "column",  
				showInLegend: true, 
				legendMarkerColor: "grey",
				legendText: "Month",
				dataPoints: [      
					{ y: Number(monProfitList[0]), label: monList[0] },
					{ y: Number(monProfitList[1]),  label: monList[1] },
					{ y: Number(monProfitList[2]),  label: monList[2] },
					{ y: Number(monProfitList[3]),  label: monList[3] }/* ,
					{ y: Number(monProfitList[4]),  label: monList[4] } */
				]
			}]
		});
		chart2.render();
		$('a.canvasjs-chart-credit').remove();
		
		var monApplyList = new Array();
		var applyCountList = new Array();
		var countSumList = new Array();
		<c:forEach var="m2" items="${requestScope.mon_top5}">
			monApplyList.push("${m2.mon}");
			applyCountList.push("${m2.mon_count}");
			countSumList.push("${m2.count_sum}");
		</c:forEach>
		var chart3 = new CanvasJS.Chart("chartContainer3",
			    {
			      title:{
			        text: "A Combination of Column & Line Chart"
			      },   
			      data: [{        
			        type: "column",
			        dataPoints: [
			        { x: Number(monApplyList[0]), y: Number(applyCountList[0]) },
					{ x: Number(monApplyList[1]), y: Number(applyCountList[1]) },
					{ x: Number(monApplyList[2]), y: Number(applyCountList[2]) }/* ,
					{ x: Number(monApplyList[3]), y: Number(applyCountList[3]) },
					{ x: Number(monApplyList[4]), y: Number(applyCountList[4]) } */
					]
			      },
			      {        
			        type: "line",
			        dataPoints: [
			        { x: Number(monApplyList[0]), y: Number(countSumList[0]) },
			        { x: Number(monApplyList[1]), y: Number(countSumList[1]) },
			        { x: Number(monApplyList[2]), y: Number(countSumList[2]) }/* ,
			        { x: Number(monApplyList[3]), y: Number(countSumList[3]) },
			        { x: Number(monApplyList[4]), y: Number(countSumList[4]) } */
			        ]
			      }
			        
			      ]
			    });

			    chart3.render();
		}
	</script>
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
</body>
</html>