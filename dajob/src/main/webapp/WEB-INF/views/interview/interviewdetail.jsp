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
     <script type="text/javascript" src="/webapp/WEB-INF/views/interview/broadcast.js"></script>
    <script type="text/javascript">
    var localVideo;
    var remoteVideo;
    var localStream;
    var pc = null;
    var wsock;
    var remoteSrc = null;
 
    var STUN_CONF = "NONE";
 
    // 초기화 함수. 연결요청, 연결수신 client 공통.
    initialize = function() {
        console.log("Initializing");
         
        localVideo = document.getElementById("localVideo");
        remoteVideo = document.getElementById("remoteVideo");
 
        resetStatus();
        // 카메라, 마이크 열기
        getUserMedia();
        // server와 websocket을 열어둔다.
        openChannel();
         
        // 연결요청 버튼 click시 SDP정보 교환 시작
        document.getElementById("join").onclick = function() {
            rtcStart();
        }
    }
 
    resetStatus = function() {
        setStatus("Initializing...");
    }
 
    function openChannel() {
        // SDP 정보 교환을 위해, 서버와 연결한다.
        url = "ws://192.168.30.57:4080";
        wsock = new WebSocket(url);
 
        wsock.onopen = function() {
            console.log("open");
        }
         
        // 서버로부터 메시지를 받을 때 처리.
        wsock.onmessage = function(e) {
            console.log("S->C:");
            console.log(e.data);
 
            // 연결 요청을 받는 client를 위한 코드. 수신측 client는 일단 메시지를 받아야 한다.
            // peerConnection 객체를 생성하고 자신의 media stream을 연결한다.
            if (pc == null) {
                createPeerConnection();
                pc.addStream(localStream);
            }
                 
            // SDP message는 아래 함수로 넘겨주면 된다. 응답은 알아서 해주므로..
            pc.processSignalingMessage(e.data);
        }
 
        wsock.onclose = function(e) {
            console.log("closed");
        }
    }
     
    // 카메라, 마이크 자원을 얻는다.
    getUserMedia = function() {
        try {
            navigator.webkitGetUserMedia({audio:true, video:true}, onUserMediaSuccess,
                                   onUserMediaError);
            console.log("Requested access to local media with new syntax.");
        } catch (e) {
            try {
                navigator.webkitGetUserMedia("video,audio", onUserMediaSuccess,
                                             onUserMediaError);
                console.log("Requested access to local media with old syntax.");
            } catch (e) {
                alert("webkitGetUserMedia() failed. Is the MediaStream flag enabled in about:flags?");
                console.log("webkitGetUserMedia failed with exception: " + e.message);
            }
        }
    }
 
    // peerConnection 생성
    createPeerConnection = function() {
        try {
            // STUN서버 주소와 SDP 메시지를 보내는 함수를 넣어준다.
            pc = new webkitDeprecatedPeerConnection(STUN_CONF,
                                              onSignalingMessage);
            console.log("Created webkitDeprecatedPeerConnnection with config");
        } catch (e) {
            console.log("Failed to create webkitDeprecatedPeerConnection, exception: " + e.message);
            try {
                pc = new webkitPeerConnection(STUN_CONF,
                                      onSignalingMessage);
                console.log("Created webkitPeerConnnection with config.");
            } catch (e) {
                console.log("Failed to create webkitPeerConnection, exception: " + e.message);
                alert("Cannot create PeerConnection object; Is the 'PeerConnection' flag enabled in about:flags?");
                return;
            }
        }
 
        pc.onconnecting = onSessionConnecting;
        pc.onopen = onSessionOpened;
        pc.onaddstream = onRemoteStreamAdded;
        pc.onremovestream = onRemoteStreamRemoved;
    }
 
    // 연결을 요청하는 client를 위한 함수
    // join 버튼을 누르면 동작한다.
    rtcStart = function() {
 
        setStatus("Connecting...");
        console.log("Creating PeerConnection.");
        createPeerConnection();
 
        console.log("Adding local stream.");
         
        // 자신의 media를 연결시킨다. peerConnection을 생성한 이후에 반드시 해줄 것.
        pc.addStream(localStream);
    }
 
    setStatus = function(state) {
        footer.innerHTML = state;
    }
     
    // media관련 함수들
     
    onUserMediaSuccess = function(stream) {
        console.log("User has granted access to local media.");
        var url = webkitURL.createObjectURL(stream);
        localVideo.style.opacity = 1;
        localVideo.src = url;
        localStream = stream;
    }
 
    onUserMediaError = function(error) {
        console.log("Failed to get access to local media. Error code was " + error.code);
        alert("Failed to get access to local media. Error code was " + error.code + ".");
    }
 
    // signaling 관련함수들
     
    onSignalingMessage = function(message) {
        console.log('C->S: ' + message);
        // 열어둔 websocket으로 SDP 메시지를 전송한다.
        // peerConnection을 생성하자마자 바로 SDP 메시지를 보낸다.
        wsock.send(message);   
    }
 
    onSessionConnecting = function(message) {
        console.log("Session connecting.");
    }
 
    onSessionOpened = function(message) {
        console.log("Session opened.");
    }
 
    onRemoteStreamAdded = function(event) {
        console.log("Remote stream added.");
        var url = webkitURL.createObjectURL(event.stream);
        remoteVideo.style.opacity = 1;
        remoteVideo.src = url;
        remoteSrc = url;
        setStatus("<input type=\"button\" id=\"hangup\" value=\"Hang up\" onclick=\"onHangup()\" />");
    }
 
    onRemoteStreamRemoved = function(event) {
        console.log("Remote stream removed.");
    }
 
    onHangup = function() {
        console.log("Hanging up.");
        localVideo.style.opacity = 0;
        remoteVideo.style.opacity = 0;
        pc.close();
        pc = null;
        setStatus("You have left the call.");
    }
 
</script>
<c:set var="interview" value="${interview}"/>
<c:set var="interviewanswer" value="${interviewanswer}"/>
</head>
<body onload="initialize();">

	<!--Start Header-->
	<header>
	<c:import url="../header.jsp"/>
        <div class="container page_head ">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h2>화상 면접</h2>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <nav id="breadcrumbs">
                        <ul>
                            <li>You are here:</li>
                            <li><a href="index.do">Home</a></li>
                            <li>Contact Us</li>
                        </ul>
                    </nav>
                </div>
            </div> <!--./row-->
        </div> <!--./Container-->
    </header>
    <div class="container clearfix " style="width:70%;">
    <div class="panel panel-default">
    <h4>화상채팅</h4>
    <table class="table table-bordered">
	  <thead>
	    <tr>
	      <th>
		      <div class="col-lg-12 col-md-12 col-sm-12" id="local">
			    <video
			     width="100%" height="100%" id="localVideo" autoplay="autoplay" style="opacity: 0;
			     -webkit-transition-property: opacity;
			     -webkit-transition-duration: 2s;">
			    </video>
			  </div>
		  </th>
	      <th>
	      	<div class="col-lg-12 col-md-12 col-sm-12" id="remote">
			    <video width="100%" height="100%" id="remoteVideo" autoplay="autoplay"
			     style="opacity: 0;
			     -webkit-transition-property: opacity;
			     -webkit-transition-duration: 2s;">
			    </video>
		    </div>
	      </th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <td align="center">${interview.interviewee}</td>
	      <td align="center">${interview.company_name}</td>
	    </tr>
	  </tbody>
    </table>
 	</div>
 	<button id="join">join</button>
 	<div class="panel panel-default">
			<div class="panel-body article ">
					<h4>답변작성하기</h4>
					<div class="col-md-12">
			            <div id="statement" class="row mobmid">
			                <div class="col-sm-12">
			                    <h3><span class="secicon fa fa-question-circle"></span>  ${interview.company_name}기업의 질문</h3>
			                </div><!--icon end-->
			
			                <div class="col-sm-12">
			                    <h2><strong>${interview.interview_question }</strong></h2>
			                </div>
			            </div>
		            <hr>
		        	</div>
		        	<c:if test="${member.member_id eq interview.interviewee }">
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
		        	</c:if>
		        	<c:if test="${!empty interview.interview_answer}">
		        	<div class="col-md-12">
			            <div id="statement" class="row mobmid">
			            	<div class="col-sm-12">
			                    <h3><span class="secicon fa fa-exclamation-circle"></span>  ${interview.interviewee}님이 작성한 답변</h3>
			                </div><!--icon end-->
			                <div class="col-sm-12">
			                    <h2><strong>${interview.interview_answer}</strong></h2>
			                </div><!--icon end-->
			            </div>
		            <hr>
		        	</div>
		        	</c:if>
		        	</c:if>
				</div>
		</div>
	</div>
	
	<!--start footer-->
	<c:import url="../footer.jsp"/>
	<!--end footer-->
	<script
		src="${pageContext.request.contextPath}/resources/api/CKeditor/ckeditor.js"></script>
	<!-- summer note korean language pack -->
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
	
	<!-- Answer등록 -->	
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
</body>
</html>