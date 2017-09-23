<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 wow fadeInUp">
                    <div class="widget_title">
                        <h4><span>About Us</span></h4>
                    </div>
                    <div class="widget_content" style="font-size:13pt;">
                        <p style="font-size:13pt;">저희는 [KH정보교육원] 웹 응용 SW 개발자 양성과정 2회차 C Class 3조, OnePunchUp 입니다. 현 프로젝트는 Spring, Java, Mybatis 등 웹 응용 기술을 응용한 팀 프로젝트 페이지입니다. 많은 이용 바랍니다. 감사합니다.</p>
                        <ul class="contact-details-alt">
                            <li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: 서울시 강남구 역삼동</p></li>
                            <li><i class="fa fa-user"></i> <p><strong>Phone</strong>:&nbsp;(+81)10-5688-2293</p></li>
                            <li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="http://www.iei.or.kr">firerain4@iei.or.kr</a></p></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 wow fadeInDown">
                    <div class="widget_title">
                        <h4><span>팀구성원 명단</span></h4>
                    </div>
                    <p align="center"><img src="${pageContext.request.contextPath}/resources/images/about/team.png" style="width:26rem;height:25rem;"></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 wow fadeInDown">
                    <div class="widget_title">
                        <h4><span>Flickr Gallery</span></h4>
                    </div>
                    <div class="widget_content">
                        <div class="flickr">
                            <ul id="flickrFeed" class="flickr-feed"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
	
	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-6">
                    <p class="copyright">&copy; Copyright 2015 Stylo | Powered by  <a href="http://www.jqueryrain.com/">jQuery Rain</a></p>
				</div>
				
				<div class="col-lg-6 col-sm-6">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

    <script type="text/javascript" src="/dajob/resources/js/jquery-1.10.2.min.js"></script>
    <!-- <script type="text/javascript" src="/dajob/resources/js/jquery-3.2.1.min.js"></script> -->
    <!-- <script src="https://code.jquery.com/jquery-migrate-3.0.0.js"></script> -->
    <script src="/dajob/resources/js/bootstrap.min.js"></script>
    <script src="/dajob/resources/js/jquery.easing.1.3.js"></script>
    <script src="/dajob/resources/js/retina-1.1.0.min.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.cookie.js"></script> <!-- jQuery cookie -->
    <script type="text/javascript" src="/dajob/resources/js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script type="text/javascript" src="/dajob/resources/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.smartmenus.min.js?ver=1"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.smartmenus.bootstrap.min.js?ver=1"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/jflickrfeed.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="/dajob/resources/js/swipe.js"></script>

    <script src="/dajob/resources/js/main.js"></script>

    <!-- WARNING: Wow.js doesn't work in IE 9 or less -->
    <!--[if gte IE 9 | !IE ]><!-->
    <script type="text/javascript" src="/dajob/resources/js/wow.min.js"></script>
    <script>
        // WOW Animation
        new WOW().init();
    </script>
    <![endif]-->
