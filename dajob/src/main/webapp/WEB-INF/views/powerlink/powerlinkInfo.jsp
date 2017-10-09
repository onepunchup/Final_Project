<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
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
       #map {
        height: 400px;
        width: 100%;
       }
       .promo_box .pb_action a.btn{
       float: none;
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
                    <h2>Contact Us</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>PowerLink Infomation</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
        </header>
        <section class="wrapper">
		<section class="content">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-8 col-md-8 col-sm-8">
						<div class="dividerHeading">
							<h4><span>PowerLink</span></h4>
							<section class="promo_box">
							<p style="font-size: 15pt; line-height:35px;" align="center">
								여러분은 이제, 직접 일일이 구직자를 찾아 방황하실 필요가 없습니다!<br>
                           	        단 돈 60만원에 상위 랭크로 갱신되는 여러분의 구인글을 만나보세요!!<br>
                    	       	여러분께서 구직목록을 직접 재작성하실 필요가 없이 PowerLink를 등록<br>하시면 별도 Premium Service로
                                5일간 여러분의 최신 구인글 목록을 관리해<br>드립니다.  
                        	        단, 돈 60만원에, DAJOB 만의 멋진 서비스를 만나 보세요!<br>
                                <font style="font-size: 10pt;"><b>※</b> 함께하시는 기업 담당자 분들께는 저희 사이트의 다이얼로그 책자도 매 달 1개 분씩 배달해드립니다.</font>
                            </p>
                             <div class="col-sm-12">
                                <div class="pb_action">
                                <c:set var="pl" value="${ requestScope.powerlink }" />
                                <c:if test="${pl.powerlink_time eq 0}">
                                    <p align="center"><br><a class="btn btn-default btn-lg" onclick="powerlinkPay()" id="powerlinkButton"><!-- href="powerLink_offer.do"  -->
                                        <i class="fa fa-rocket"></i>
                                        	신청하기
                                    </a></p>
                               </c:if>
                               <c:if test="${pl.powerlink_time ne 0}">
                               		<p align="center"><br>
                               		<font style="font-size: 13pt;">이미 신청을 하셨습니다 ^-^</font>
                               		<br>
                               		<fmt:formatNumber var="test" value="${(pl.powerlink_time / 24) - ((pl.powerlink_time / 24) % 1)}" pattern="#"></fmt:formatNumber>
                               		<c:set var="plDate" value="${test }" />
                               		<c:set var="plHour" value="${pl.powerlink_time mod 24}"/>
                               		<a class="btn btn-default btn-lg">* 남은시간 : ${plDate}일 ${plHour} 시간 *</a>
                               		</p>
                               </c:if>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;" id="powerlinkPayment">
								<jsp:useBean id="today" class="java.util.Date" />
								<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" var="todate"/>
								<c:set var="tomorrow" value="<%= new Date(new Date().getTime() + 5*(60*60*24*1000)) %>"/>
								<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" var="tomdate"/>					
									<h2 align="center">결제내용</h2>
									<p align="center" style="line-height: 20pt;">
										 ${todate} 부터 ${tomdate} 까지 신청합니다.<br>
                     	 					결제 금액은 60만원 입니다.<br>
                     	 			<button onclick="pay()" style="padding: 0; border: 0; outline: 0; background-color: white;" >
                     	 				<a class="btn btn-small btn-default">결제하기</a>
                     	 			</button>
                     	 			</p>
							</div>
							</section>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 ">
							<div class="dividerHeading">
								<h4><span>현재까지의 PowerLink 신청현황</span></h4>
							</div>
							<p>이용자들의 최근 5개월동안 PowerLink 이용현황. </p>
							<ul class="progress-skill-bar">
								<c:forEach var="list" items="${ requestScope.list }">
								<li>
									<span class="lable">${list.percentage }%</span>
									<div class="progress_skill">
										<div class="bar" data-value="${ list.percentage }" role="progressbar" data-height="100">
											<%-- ${list.year }年 --%> 
											<div class="percentage" style="width: 120px; height: 100%; margin-left:100%; color: gray;">
												${list.year }年 ${list.mon }月
											</div>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 ">
							<div class="dividerHeading">
								<h4><span>My PowerLink 신청현황</span></h4>
							</div>
							<p>${member.member_name}님의 최근 5개월동안의 PowerLink 이용현황. </p>
							<ul class="progress-skill-bar">
								<c:forEach var="list2" items="${ requestScope.list2 }">
								<li>
									<span class="lable">${list2.count } 번</span>
									<div class="progress_skill">
										<div class="bar" data-value="${ list2.count * 10 }" role="progressbar" data-height="100">
											<div class="percentage" style="width: 120px; height: 100%; margin-left:100%; color: gray;">
												${list2.year }年 ${list2.mon }月
											</div>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
				</div>
			</div>
		</section>
		</section>
  <c:import url="../footer.jsp"/>
<script type="text/javascript">
	function powerlinkPay(){
		var payment = document.getElementById("powerlinkPayment");
		if(payment.style.display == "none"){
			payment.style.display="block";
			$("#powerlinkButton").html('<i class="fa fa-rocket"></i> 취소하기');
		}else{
			payment.style.display="none";
			$("#powerlinkButton").html('<i class="fa fa-rocket"></i> 신청하기');
		}
	}
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
        $(function(){
        	var IMP = window.IMP; // 생략가능
        	IMP.init('imp99940489'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        });
        function pay(){
        IMP.request_pay({
            pg : 'uplus', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Power Loink 등록',
            amount : 600000,
            buyer_email : '<c:out value="${member.member_email}" />',
            buyer_name : '<c:out value="${member.member_name}"/>',
            buyer_tel : '<c:out value="${member.member_phone}" />',
            buyer_addr : '<c:out value="${member.member_address}" />',
            buyer_postcode : '123-456',
            m_redirect_url : 'https://www.yourdomain.com/payments/complete' 
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
            /*     msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num; */
                $.ajax({
                  	url : "powerlink_payment.do",
                  	type : "post",
                  	data : {member_id : '<c:out value="${member.member_id}" />'},
                  	success : function(result){
                  		if(result == "success"){
                  			location.href = "powerlink.do";
                  		}else{
                  			
                  		}
                  	}
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                //msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
        };
        </script>
</body>
</html>