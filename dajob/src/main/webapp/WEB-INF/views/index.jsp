<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <link rel="stylesheet"  type="text/css" href="<c:url value='/resources/css/flexslider.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>"/>

    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/switcher.css'/>" media="screen" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
     thead th{
     	text-align:center;
     }
     .table tbody tr{
     	text-align:center;
     	height:55px;
     }
     .table tbody tr td{
     	text-align:center;
     	padding-top: 20px;
     }
     .table tbody tr a{
     	color: #eff6fc;
     }
     .table tbody tr a:hover{
     	color: #ffbbb2;
     }
    </style>
</head>
<body class="home">
<!--Start Header-->
	<header>
		<c:import url="./header.jsp"/>
		<!------/Flex-Slider---------/-->
        <div class="slider_block">
            <div class="flexslider top_slider">
                <ul class="slides">
                    <li class="slide1">
                        <div class="container">
                            <div class="flex_caption1 FromLeft">
                                <p class="slide-heading">누구보다 빠른 구직, DA JOB!</p><br/>
                                <p class="sub-line">내 능력 분석과 면접을 한 방에!</p><br/>
                            </div>
                            <div class="flex_caption2 FromRight"></div>
                        </div>
                    </li>
                    <li class="slide2">
                        <div class="container">
                            <div class="slide flex_caption1 FromTop">
                                <p class="slide-heading">Direct Job : DA JOB</p><br/>
                                <p class="sub-line">당신의 시간을 절약해드립니다!</p><br/>
                            </div>
                            <div class="flex_caption2 FromBottom"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- //Slider Wraper -->
	</header>
	<!--End Header-->
<section class="wrapper">
	<!--start info service-->
    <section class="info_service">
        <div class="container">
            <div class="row sub_content">
                <div class="col-lg-12 col-md-12 col-sm-12 wow fadeInDown">
                    <h1 class="intro text-center">DA JOB : Direct Find Your Job Place!</h1>
                    <p class="lead text-center" style="font-size:17pt; margin-bottom: -12px;">누구나 쉽게 구직 정보를 얻을 수 있고, <br>누구나 쉽게 원하는 능력자를 채용할 수<br>있는 신뢰감 있는 사이트, DA JOB !</p>
                    <!-- <br><br> 여러분과 함께 대한민국 구직 사이트 No.1이 <br>될 그 날까지 최선을 다하겠습니다. -->
                </div>
                <div class="col-md-12 col-lg-12">
						<div class="dividerHeading">
							<h4><span>Our Services</span></h4>
						</div>
					</div>
					<c:if test="${empty member}">
                    <div class=" col-lg-4 col-sm-4 ">
                        <div class="serviceBox_2">
                            <div class="service-icon">
                                <i class="fa fa-user-plus"></i>
                            </div>
                            <h3><b>Join Us</b></h3>
                            <p>아직 회원이 아니신가요? <br>지금 바로 가입하셔서 내 능력 분석, 이력서 확인 등 다양한 구직, 구인 서비스를 이용해보세요!!</p>
                            <p align="center"><button type="button" class="btn btn-sm btn-default" onclick="javascript:location.href='enrollView.do';">Sign in</button></p>
                        </div>
                    </div>
                    </c:if>
                    <c:if test="${!empty member}">
                    <div class=" col-lg-4 col-sm-4 ">
                        <div class="serviceBox_2">
                            <div class="service-icon">
                                <i class="fa fa-info"></i>
                            </div>
                            <h3><b>Notice</b></h3>
                            <p>사이트의 최신 이슈! <br>현재 사이트의 최신 이슈들을 공지사항을 통해 확인해 보세요, 댓글을 통해 여러분의 의견도 확인할 수 있습니다.</p>
                            <p align="center"><button type="button" class="btn btn-sm btn-default" onclick="javascript:location.href='nlist.do';">Notice View</button></p>
                        </div>
                    </div>
                    </c:if>
                    <div class=" col-lg-4 col-sm-4 ">
                        <div class="serviceBox_2">
                            <div class="service-icon">
                                <i class="fa fa-list-alt"></i>
                            </div>
                            <h3><b>기업 구직 정보</b></h3>
                            <p>기업 구직 정보를 한 눈에!! <br>이곳에 들러 기업에서 원하는 구직 정보를 한 눈에 확인 하시고, 빠른 구직을 준비하실 수 있습니다!!</p>
                            <p align="center"><button type="button" class="btn btn-sm btn-default" onclick="javascript:location.href='jobList.do';">Work Here</button></p>
                        </div>
                    </div>
                    <div class=" col-lg-4 col-sm-4 ">
                        <div class="serviceBox_2">
                            <div class="service-icon">
                                <i class="fa fa-globe"></i>
                            </div>
                            <h3><b>IT 최신 기술 동향</b></h3>
                            <p>기업에서 원하는 IT 최신 정보가 궁금하신가요?<br>IT 최신 이슈, 가트너를 한글화하여 정보를 제공하는 IT Info 게시판을 방문해 보세요!!</p>
                            <p align="center"><button type="button" class="btn btn-sm btn-default" onclick="javascript:location.href='itinfo.do';">IT Info</button></p>
                        </div>
                    </div>
            </div>
        </div>
    </section>
		<!--end info service-->
    <section class="parallax parallax-1">
            <!--<h2 class="center">Testimonials</h2>-->
            <div class="row">
                <div id="parallax-testimonial-carousel" class="parallax-testimonial carousel">
                  		<div class="col-md-8">
							<div class="dividerHeading">
								<h4><font color="white">Recent Find Worker (PowerLink)</font></h4>
							</div>
							<div class="clearfix">
							<div class="col-lg-12 col-md-12 col-sm-12">
                    <table class="table">
                        <thead>
					      <tr>
					      	<th>회사 이름</th>
					        <th>제목</th>
					        <th>근무지</th>
					        <th>직무</th>
					        <th>필요기술</th>
					      </tr>
					    </thead>
                        <tbody>
                        <c:forEach var="workhere" items="${workPowerLink}">
						      <tr>
						      	<c:url var="workdetail" value="/workhereDetail.do">
						        	<c:param name="workhere_no" value="${workhere.work_no}"/>
						        </c:url>
						        <td>${workhere.company_name }
						        <c:forEach var="comtype" items="${comtype}">
						        <c:if test="${workhere.company_type eq comtype.company_type}">
						        (${comtype.company_tname})
						        </c:if></c:forEach></td>
						        <td><a href="${workdetail}">${workhere.work_title}</a></td>
						        
						        <td>${fn:substring(workhere.work_workplace,0,2)}</td>
						        <c:forEach var="job" items="${joblist}">
						        <c:if test="${ job.job_code eq workhere.work_job}">
						        <td>${job.job_name}</td>
						        </c:if></c:forEach>
						        <c:forEach var="skill" items="${skilllist}">
						        <c:if test="${ skill.skill_code eq workhere.work_skill}">
						        <td>${skill.skill_name}</td>
						        </c:if></c:forEach>
						      </tr>
						      </c:forEach>
						      <tr>
						      	<td colspan="5"></td>
						      </tr>
                        </tbody>
                    </table>
                </div>
							</div>
						</div>
						<div class="col-md-4">
							<!-- TESTIMONIALS -->
					<div class="clearfix">
						<div class="dividerHeading">
							<h4><font color="white">Recent IT NEWS</font></h4>
						</div>
						<div id="testimonial-carousel" class="testimonial carousel slide">
							<div class="carousel-inner">
							<c:forEach var="it" items="${itlist}">
								<div class="item">
									<div class="testimonial-item">
										<div class="blogDetail">
											<div class="blogTitle">
												<c:url var="itinfoDetail" value="/itinfoDetail.do">
													<c:param name="itinfo_no" value="${it.itinfo_no}"/>
												</c:url>
												<a href="${itinfoDetail}">
													<h2><font style="font-size: 17pt;">${it.itinfo_title}</font></h2>
												</a>
												<span style="color:white; font-size:12pt;">
													<i class="fa fa-calendar"></i>
													${it.itinfo_date}
												</span>
											</div>
											<div class="blogPic">
												<img alt="" src="${pageContext.request.contextPath}/resources/images/${it.itinfo_img}">
												<div class="blog-hover">
												</div>
											</div>
											<div class="blogContent">
												<p>${fn:substring(it.itinfo_content,0,55)} . . .</p>
											</div>
											<div class="blogMeta">
												<button class="btn btn-sm btn-primary read" onclick="javascript:location.href='${itinfoDetail}';">Read More</button>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<div class="testimonial-buttons"><a href="#testimonial-carousel" data-slide="prev"><i class="fa fa-chevron-left"></i></a>&#32;
							<a href="#testimonial-carousel" data-slide="next"><i class="fa fa-chevron-right"></i></a></div>
						</div>
					</div><!-- TESTIMONIALS END -->
				</div>
						</div>
                    </div>
            	<!-- </div> -->
    	</section>
    </section>
    <!--end wrapper-->
<c:import url="./footer.jsp"/>

<c:if test="${empty member}">
        <input type="hidden" value='비회원' id='chat_id' />
    </c:if>
    <c:if test="${!empty member}">
        <input type="hidden" value='${ member.member_id }' id='chat_id' />
    </c:if>
 <!-- Start Style Switcher -->
 <div class="switcher"></div>
 <!-- End Style Switcher -->
<script type="text/javascript">
$(function(){
	$(".carousel-inner").children(".item:first").addClass("active");
});

window.console = window.console || (function($){
	var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile = c.clear = c.exception = c.trace = c.assert = function(){};
	return c;
})();

$(document).ready(function($){ 
				   
var styleswitcherstr = ' \
	<h2> \
	Question & Answer \
	<button onclick="disconnect()" style="background: #021a21; border: 0; outline: 0; float: right;"><i class="fa fa-mail-forward"></i></button>\
	<a href="#" onclick="conn()"></a>\
	</h2> \
	<div class="content"> \
    <div class="switcher-box" id="_chatbox"> \
    <fieldset>\
       <div id="messageWindow" rows="10" cols="5" readonly="true" style="background-color: white; height: 210px;"></div>\
        <div style="padding-top: 7px;"><input id="inputMessage" type="text" size="23" onkeyup="enterkey()" />\
        <button type="submit" onclick="send()" style="width:38px;"><font style="color:#1a2944;"><i class="fa fa-paper-plane-o"></i></font></button></div>\
    </fieldset>\
	</div>\
	</div>\
	';
	
$(".switcher").prepend( styleswitcherstr );

});

/*  Skins Style  */
$(document).ready(function($){
    var cookieName = 'default';

    function changeLayout(layout) {
    $.cookie(cookieName, layout);
    $('head link[data-name=skins]').attr('href', 'css/skins/' + layout + '.css');
    }

    if( $.cookie(cookieName)) {
    changeLayout($.cookie(cookieName));
    }

    $("#default").click( function(){ $
    changeLayout('default');
    });

});

/*  Reset Switcher  */
$(document).ready(function(){ 

    // Style Switcher
    $('.switcher').animate({
        right: '-255px'
    });

    $('.switcher h2 a').click(function(e){
        e.preventDefault();
        var div = $('.switcher');
        console.log(div.css('left'));
        if (div.css('right') === '-255px') {
            $('.switcher').animate({
              right: '0px'
            });
        } else {
            $('.switcher').animate({
              right: '-255px'
            });
        }
    });
});
</script>

<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://localhost:4080/dajob/broadcasting');
    // localhost 부분에 ip 주소를 넣으세요.
    
    var inputMessage = null;
   
    webSocket.onopen = function(event) {
    	onOpen(event)
	};
    webSocket.onerror = function(event) {
        onError(event)
    };
   
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    
    function onOpen(event){
    	$("#messageWindow").html("<font style='color: #ff8080;'>귓속말 채팅 : &nbsp;/아이디 내용<br>Ex) /admin : 관리자에게 귓말하기</font><br>");
    }

    function onError(event) {
        alert(event.data);
    }
	
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        
        if (content == "") {
            alert("content");
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                    	$("#messageWindow").html($("#messageWindow").html() + "<font style='opacity: 0.7;'>"
                        + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</font><br>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html() + "<font class=''>"
                        + sender + " : " + content + "</font><br>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html() + "<font class=''>"
                        + sender + " : " + content + "</font><br>");
                }
            }
        }
    }
  
    function disconnect(){
    	$("#messageWindow").html($("#messageWindow").html() + "<font class=''>"
                + "채팅에 나가셨습니다." + "</font><br>");
    	webSocket.send($("#chat_id").val() + "|" + "채팅에 나가셨습니다.");
    	
        var div = $('.switcher');
        if(div.css('right') === '-255px') {
           $('.switcher').animate({
              right: '0px'
           });
        }else {
           $('.switcher').animate({
              right: '-255px'
           });
        }
    	webSocket.close();
    }
    
    function send() {
    	inputMessage = $('#inputMessage').val();
        if (inputMessage == "") {
        } else {
        	if(inputMessage.match('/')){
        		$("#messageWindow").html($("#messageWindow").html() + "<font style='opacity: 0.7;'>"
                        + $("#chat_id").val() + " : " + inputMessage + "</font><br>");
        	}else{
        		$("#messageWindow").html($("#messageWindow").html() + "<font class=''>"
                        + $("#chat_id").val() + " : " + inputMessage + "</font><br>");
        	}
			//채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
            var elem = document.getElementById('messageWindow');
            elem.scrollTop = elem.scrollHeight;
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage);
        $('#inputMessage').val('');
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }

</script>
</body>
</html>


