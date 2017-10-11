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
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">

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

<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet" type="text/css">
	
<link rel="stylesheet"
	href="<c:url value='/resources/api/webRTC/src/css/main.css?ver=1'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/api/webRTC/src/css/main2.css?ver=1'/>" />
	
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
<c:set var="interview" value="${interview}" />
<c:set var="interviewanswer" value="${interviewanswer}" />
<c:set var="all" value="${all}"/>
</head>
<body>
	<!--Start Header-->
	<header>
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2>인터뷰 페이지</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li>You are here:</li>
							<li><a href="index.do">Home</a></li>
							<li>InterView</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
	<!--start wrapper-->
	<section class="wrapper">
		<div id="container">
			<div class="highlight">
				<h1>
					<span>화상 인터뷰</span>
				</h1>
				<table class="table table-bordered">
				  <tbody>
				  <tr>
				  <div>
      <label for="channelIdInput">Interview-Room : ${interview.interview_no}</label><br>
        <input type="text" id="channelIdInput" placeholder="Interview-Room ID를 입력하세요." value="">
  </div>
				  	<td align="center"><video class="video" id="localVideo" autoplay></video></td>
				  	<td align="center"><video class="video" id="remoteVideo" autoplay></video></td>
				  </tr>
				    <tr>
				      <td align="center" style="color: black;">[${interview.company_name}] ${interview.member_name}</td>
				      <c:forEach var="all" items="${all}">
					    <c:if test="${all.member_id eq interview.interviewee}">
					    <td align="center" style="color: black;">${all.member_name}</td>
					    </c:if>
				     </c:forEach>
				    </tr>
				  </tbody>
			    </table>
				<div>
				<p align="center">
					<c:if test="${sessionScope.member.member_type_code eq 'C'}">
					<button id="createChannelButton">인터뷰 시작</button>
					<button id="connectChannelButton" disabled>Join</button>
					</c:if>
					<c:if test="${sessionScope.member.member_type_code eq 'U'}">
					<button id="createChannelButton" disabled>인터뷰 시작</button>
					<button id="connectChannelButton">Join</button>
					</c:if>
					</p>
				</div>
				<br>
			</div>
		</div>
		<div class="container">
 	<div class="panel panel-default">
			<div class="panel-body article ">
					<h4>인터뷰 질문</h4>
					<div class="col-md-12">
			            <div id="statement" class="row mobmid">
			                <div class="col-sm-12">
			                    <h3><span class="secicon fa fa-question-circle"></span>  ${interview.company_name}기업의 질문</h3>
			                </div><!--icon end-->
			
			                <div class="col-sm-12">
			                    <h2><strong>${interview.interview_question}</strong></h2>
			                </div>
			            </div>
		            <hr>
		        	</div>
		        	<c:if test="${member.member_id eq interview.interviewee}">
		        	<c:if test="${empty interview.interview_answer}">
		        	<div class="col-md-12">
			            <div id="statement" class="row mobmid">
			                <div class="col-sm-12">
			                    <h3><span class="secicon fa fa-exclamation-circle"></span>  답변을 달아주세요.</h3>
			                </div><!--icon end-->
			                <div class="col-sm-12">
			                    <form id="answerContents">
									<input type="hidden" name="interview_no" value="${interview.interview_no}">
									<textarea cols="100" class="answerMine" id="editor" name="editor" rows="10">${interview.interview_answer}</textarea>
									<div style="margin-top : 20px;"><p align="center">
										<button class="btn btn-success btn-sm" type="button" onclick="insertAnswerData();">등록하기</button>
										<button type="button" class="btn btn-default btn-sm" onclick="javascript:history.go(-1);">나가기</button>
										</p>
									</div>
									</form>
			                </div>
			            </div>
		            <hr>
		        	</div>
		        	<!-- Answer등록 -->	
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/lang/ko.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/config.js"></script>
	<script>
			CKEDITOR.config.customConfig = '${pageContext.request.contextPath}/resources/api/CKeditor/config.js';
			CKEDITOR.replace( 'editor', {
				filebrowserImageUploadUrl: '${pageContext.request.contextPath}/resources/up',
				height: 400
			});
			</script>
	<script type="text/javascript">
	function insertAnswerData(){
 		$.ajax({
			url : "interviewUpdateAnswer.do",
			data : {
				interview_no : "<c:out value='${interview.interview_no}'/>",
				interview_answer : CKEDITOR.instances['editor'].getData()},
			type : "post",
			success : function(result){
				if(result == "ok"){
					alert("답변을 성공적으로 등록하셨습니다.");
					$('#answerContents').parent().append("<p>"+CKEDITOR.instances['editor'].getData()+"</p>");
					$('#answerContents').remove();
				} else {
					alert("답변 등록에 실패하셨습니다.");
				}
			}
		});
	}
	</script>
		        	</c:if>
		        	</c:if>
		        	<c:if test="${!empty interview.interview_answer}">
		        	<div class="col-md-12">
			            <div id="statement" class="row mobmid">
			            	<div class="col-sm-12">
			            	<c:forEach var="all" items="${all}">
					    <c:if test="${all.member_id eq interview.interviewee}">
					    <h3><span class="secicon fa fa-exclamation-circle"></span>  ${all.member_name} 님이 작성한 답변</h3>
					    </c:if>
				     </c:forEach>
			                </div><!--icon end-->
			                <div class="col-sm-12">
			                    <h2><strong>${interview.interview_answer}</strong></h2>
			                </div><!--icon end-->
			            </div>
		            <hr>
		        	</div>
		        	</c:if>
				</div>
		</div>
	</div>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp" />
	<!--end footer-->
				 
    <script src="http://www.playrtc.com/sdk/js/playrtc.min.js"></script>
    <script>
    app = new PlayRTC({
            projectKey: '60ba608a-e228-4530-8711-fa38004719c1',
            localVideoTarget: 'localVideo',
      remoteVideoTarget: 'remoteVideo'
    });

    app.on('connectChannel', function(channelId) {
      document.getElementById('channelIdInput').value = channelId;
    });

    document.getElementById('createChannelButton').onclick = function(event) {
      app.createChannel();
      return false;
    };

    document.getElementById('connectChannelButton').onclick = function(event) {
      var channelId = document.getElementById('channelIdInput').value;
            if (!channelId) { return; }
      app.connectChannel(channelId);
      return false;
    };
  </script>
  <!-- <script type="text/javascript">
       var url = document.URL;
       var arrUrl = url.split("//");
       var protocol = document.location.protocol;
       if("http:" == protocol){
           window.location.replace("https://" + arrUrl[1]);
       }
</script> -->
</body>
</html>