<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>회원가입 : Da Job</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/dajob/resources/images/sitelogo2_fix.png" />

<!-- CSS FILES -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css'/>" media="screen"
	data-name="skins">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/flexslider.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/switcher.css'/>" media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
header{
	background: url("/dajob/resources/images/page-header2.jpg") no-repeat;
}

font {
	font-size: 14pt;
}

table {
	margin-left: auto;
	margin-right: auto;
}

table tr td {
	size: 7px;
	padding-bottom: 5px;
	text-align: left;
}
table input{
	height: 34px;
}
label{vertical-align:-1px}.inputBtn{width:13px;height:13px;vertical-align:text-top}
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 100%;
	height: 120px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 120%;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
</head>
<body>
	<!--Start Header-->
	<header>	
		<c:import url="../header.jsp" />
		<div class="container page_head">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h2>Sign up</h2>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li>You are here:</li>
							<li><a href="index.do">Home</a></li>
							<li>Sign up</li>
						</ul>
					</nav>
				</div>
			</div>
			<!--./row-->
		</div>
		<!--./Container-->
	</header>
<c:set var="certList" value="${requestScope.certList}"/>
<c:set var="comTypeList" value="${requestScope.comTypeList}"/>
	<!--start wrapper-->
	<section class="wrapper">
		<section class="content contact">
			<div class="container">
				<div class="row sub_content mtype">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<p align="center">
							<img src="/dajob/resources/images/userEnroll/usermember.png"><br>
							<button class="btn btn-primary btn-lg user">일반 회원</button>
						</p>
						<font><b> 일반 회원</b> 은 사이트를 구직 목적으로 이용하고자 하는 회원을 말합니다. 내 능력
							분석 같은 전용 기능도 제공하니 가입하여 이용해보세요!!</font>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<p align="center">
							<img src="/dajob/resources/images/userEnroll/companymember.png"><br>
							<button class="btn btn-primary btn-lg company">기업 회원</button>
						</p>
						<font><b> 기업 회원</b> 은 사이트를 구인 목적으로 이용하고자 하는 회원을 말합니다. 여러
							구직을 원하는 능력자들이 많으니 어서 가입하셔서 데려가세요!!</font>
					</div>
				</div>

				<div class="row sub_content">
					<div class="col-lg-1 col-md-1 col-sm-1"></div>
					<div class="enrollUser col-lg-10 col-md-10 col-sm-10"
						style="display: none;">
						<div class="dividerHeading">
							<h4>
								<span>일반 회원 가입</span>
							</h4>
						</div>
						<form action="userEnroll.do" method="post" id="userInsert">
						<input type="number" name="certCnt" id="certCnt" style="display: none;">
						<input type="hidden" class="member_profile_img" name="member_profile_img">
							<table style="align-content: center; padding: 8px;">
								<tr><td>아이디 : </td>
									<td><input type="text" class="id" name="member_id"
										placeholder="아이디" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="idchk"></span>
									<!-- <button type="button" id="chkID">중복체크</button> --></td>
								</tr>
								<tr><td>비밀번호 : </td>
									<td><input type="password" name="member_password"
										placeholder="비밀번호" onkeyup="passcheck(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer"></span></td>
								</tr>
								<tr><td>비밀번호확인 : </td>
									<td><input type="password" name="member_password2"
										placeholder="비밀번호 확인" onkeyup="passcheck2(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer2"></span></td>
								</tr>
								<tr><td>프로필<br>이미지 : </td>
									<td><div id="fileUpload" class="dragAndDropDiv">Drag &amp; Drop Files Here</div></td>
								</tr>
								<tr><td>회원이름 : </td>
									<td><input type="text" name="member_name"
										placeholder="가입자 이름" size="52%"></td>
								</tr>
								<tr><td>E-Mail : </td>
									<td><input type="text" name="email1" placeholder="가입자 이메일" size="15">&nbsp;
										@&nbsp; <input type="text" name="email2" value=""
										style="width: 120px" readOnly>&nbsp; 
										<select	name="email" onchange="email_change(this)">
											<option value="0">선택하세요</option>
											<option value="9">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
									</select></td>
								</tr>
								<tr><td>연락처 : </td>
									<td><input type="tel" name="member_phone"
										placeholder="연락처" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>우편번호 : </td>
									<td><input type="text" name="post_code"
										placeholder="우편번호">&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs" onclick="execDaumPostcode();">찾기</button></td>
								</tr>
								<tr><td>주소 : </td>
									<td><input type="text" name="addr1"
										placeholder="주소" size="22%" >&nbsp;<input type="text" name="addr2"
										placeholder="상세주소" size="22%" ></td>
								</tr>
								<tr><td>성별 : </td>
									<td><input type="radio" class="inputBtn gender" name="gender" value="M" checked>
										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;남성</label>
  										&nbsp;&nbsp; &nbsp;&nbsp;<input class="inputBtn gender" type="radio" name="gender" value="F">
  										<label for="gender" class="inputBtn" style="display:inline;">&nbsp;여성</label></td>
								</tr>
								<tr><td>생년월일 : </td>
									<td><input type="date" name="birthday"></td>
								</tr>
								<tr><td>자격증 구분</td><td><input type="checkbox" value="certChk" name="certChk" id="certChk" class="certChk inputBtn"><label for="certChk" class="certChk inputBtn" style="display:inline;">&nbsp;자격증 유/무</label>
									&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="addCert" id="addCert" style="display: none;"><i class="fa fa-plus"></i></button>
        							&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="delCert" id="delCert" style="display: none;"><i class="fa fa-minus"></i></button>
        							<div class="certList" style="margin-top:7px; display: none;">
						        	<select name="cert1" id="cert1" style="text-ailgn:center;">
						        	<option value="">--- 선택 ---</option>
						        	<c:forEach var="certName" items="${certList}">
						        	<option value="${certName.cert_no}">${certName.cert_name}</option>
						        	</c:forEach>
						        	</select>&nbsp;&nbsp;&nbsp;<input type="date" class="certDate" id="certDate1" name="certDate1">
        							</div>
        						</td></tr>
								<tr style="height: 100px;">
									<td colspan="2" style="text-align: center;"><button class="btn btn-success" type="submit">가입하기</button>&nbsp;&nbsp;
										<button class="btn btn-warning" type="reset">취소하기</button></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="enrollCompany col-lg-10 col-md-10 col-sm-10" style="display: none;">
						<div class="dividerHeading">
							<h4>
								<span>기업 회원 가입</span>
							</h4>
						</div>
						<form action="compEnroll.do" method="post" id="compInsert">
							<input type="hidden" id="company_wel" name="company_wel">
							<input type="hidden" class="member_profile_img" name="member_profile_img">
							<table style="align-content: center; padding: 8px;">
								<tr><td>아이디 : </td>
									<td><input type="text" class="id" name="member_id"
										placeholder="아이디" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="idchk"></span>
									<!-- <button type="button" id="chkID">중복체크</button> --></td>
								</tr>
								<tr><td>비밀번호 : </td>
									<td><input type="password" name="member_password"
										placeholder="비밀번호" onkeyup="passcheck(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer"></span></td>
								</tr>
								<tr><td>비밀번호확인 : </td>
									<td><input type="password" name="member_password2"
										placeholder="비밀번호 확인" onkeyup="passcheck2(this)" size="52%"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="passcheckLayer2"></span></td>
								</tr>
								<tr><td>기업<br>이미지 : </td>
									<td><div id="fileUpload" class="dragAndDropDiv">Drag &amp; Drop Files Here</div></td>
								</tr>
								<tr><td>기업 명 : </td>
									<td><input type="text" name="company_name"
										placeholder="기업 명" size="52%"></td>
								</tr>
								<tr><td>사업자 등록 번호 : </td>
									<td><input type="text" name="company_code"
										placeholder="사업자 등록 번호" size="52%" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}"></td>
								</tr>
								<tr><td>회사 연락처 : </td>
									<td><input type="tel" name="company_tel"
										placeholder="Tel number" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>FAX 번호 : </td>
									<td><input type="tel" name="company_fax"
										placeholder="Fax Address" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>담당자이름 : </td>
									<td><input type="text" name="member_name"
										placeholder="담당자 이름" size="52%"></td>
								</tr>
								<tr><td>연락처 : </td>
									<td><input type="tel" name="member_phone"
										placeholder="연락처" size="52%" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"></td>
								</tr>
								<tr><td>E-Mail : </td>
									<td><input type="text" name="email1" placeholder="담당자 이메일" size="15">&nbsp;
										@&nbsp; <input type="text" name="email2" value=""
										style="width: 120px" readOnly>&nbsp; 
										<select	name="email" onchange="email_change(this)">
											<option value="0">선택하세요</option>
											<option value="9">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="yahoo.co.kr">yahoo.co.kr</option>
											<option value="gmail.com">gmail.com</option>
									</select></td>
								</tr>
								<tr><td>우편번호 : </td>
									<td><input type="text" name="post_code"
										placeholder="우편번호">&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs" onclick="execDaumPostcode();">찾기</button></td>
								</tr>
								<tr><td>회사주소 : </td>
									<td><input type="text" name="addr1"
										placeholder="주소" size="22%" >&nbsp;<input type="text" name="addr2"
										placeholder="상세주소" size="22%" ></td>
								</tr>
								<tr><td>기업 규모 : </td>
									<td><select	name="company_type" style="height:35px; width:145px;">
											<option value="0">선택하세요</option>
											<c:forEach var="comType" items="${comTypeList}">
												<option value="${comType.company_type}">${comType.company_tname}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr><td>사원수 : </td>
									<td><input type="number" name="company_staff" placeholder="최소 값은 1입니다" min="1" style="width:200px;"></td>
								</tr>
								<tr><td>기업자본 : </td>
									<td><input type="number" name="company_capital" placeholder="기본 단위는 백만원입니다." min="1" style="width:200px;"></td>
								</tr>
								<tr><td>창립연도 : </td>
									<td><input type="date" name="company_date"></td>
								</tr>
								<tr><td>복지 정보 : </td>
									<td>
										<table id="inline-table">
											<tr>
												<td>
												<input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="4대보험">
												<label for="company_welfare" class="inputBtn" style="display:inline;">4대보험</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="석식 제공">
												<label for="company_welfare" class="inputBtn" style="display:inline;">석식 제공</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="유류비 지원">
									<label for="company_welfare" class="inputBtn" style="display:inline;">유류비 지원</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare" class="welfare inputBtn" value="숙식 제공">
									<label for="company_welfare" class="inputBtn" style="display:inline;">숙식 제공</label></td>
											</tr>
											<tr>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="상여금 지급">
									<label for="company_welfare" class="inputBtn" style="display:inline;">상여금 지급</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="야근 수당">
									<label for="company_welfare" class="inputBtn" style="display:inline;">야근 수당</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="자기개발비 지원">
									<label for="company_welfare" class="inputBtn" style="display:inline;">자기개발비 지원</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><input type="checkbox" name="company_welfare[]" class="welfare inputBtn" value="야근 수당">
									<label for="company_welfare" class="inputBtn" style="display:inline;">자녀 학자금</label></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="height: 100px;">
									<td colspan="2" style="text-align: center;"><button class="btn btn-success" type="submit">가입하기</button>&nbsp;&nbsp;
										<button class="btn btn-warning" type="reset">취소하기</button></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="col-lg-1 col-md-1 col-sm-1"></div>
				</div>
				<p align="center">
					<a href="javascript:history.back();"
						class="btn btn-default btn-lg back_home"> <i
						class="fa fa-arrow-circle-o-left"></i> Go to Back
					</a>
				</p>
			</div>
		</section>
	</section>
	<!--end wrapper-->

	<!--start footer-->
	<c:import url="../footer.jsp" />
	<!--end footer-->
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	var cnt = 0;
	var s_default = {
		"border" : "1px solid #ccc",
		"background-color" : "#fff"
	}; //기본
	var s_fail = {
		"font-size" : "8pt",
		"color" : "red",
		"text-align" : "center"
	}; //실패
	var s_success = {
		"font-size" : "8pt",
		"color" : "green",
		"text-align" : "center"
	}; //성공
	$(function() {
		$('checkbox').attr('checked', false);
		$('input[name=member_id]').keyup(function() {
			$.ajax({
				url : "dupid.do",
				type : "post",
				data : {
					userid : $('#member_id').val()
				},
				dataType : "text",
				success : function(value) {
					//alert("서블릿이 보낸 값 : " + data);
					var regex = /^[A-Za-z0-9]{5,14}$/;
					if ($('#member_id').val().length < 5) {
						var str = "아이디는 5자 이상이어야 합니다.";
						$('.idchk').html(str).css(s_fail);
					} else if (!regex.test($('#member_id').val())) {
						var str = "아이디는 영문자와 숫자만 가능합니다.";
						$('.idchk').html(str).css(s_fail);
					} else if (value === "ok") {
						var str = "사용 가능한 아이디입니다.";
						$('.idchk').html(str).css(s_success);
					} else {
						var str = "이미 존재하는 아이디입니다. 다른 아이디로 정하십시오.";
						$('.idchk').html(str).css(s_fail);
					}
				},
				error : function(value) {
					alert("에러 : " + value);
				}
			});
			return false;
		});
	});
	
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('input[name=post_code]').val(data.zonecode); //5자리 새우편번호 사용
                $('input[name=addr1]').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('input[name=addr2]').focus();
            }
        }).open();
    };
	
	$(function() {
		$(".user").click(function() {
			reset();
			$(".enrollCompany").css('display', 'none');
			$(".enrollCompany .id").removeAttr('id', 'member_id');
			$(".enrollUser .id").attr('id', 'member_id');
			$(".enrollUser").show('slow');
		});
		$(".company").click(function() {
			reset();
			$(".enrollUser").css('display', 'none');
			$(".enrollUser .id").removeAttr('id', 'member_id');
			$(".enrollCompany .id").attr('id', 'member_id');
			$(".enrollCompany").show('slow');
		});
	});

	var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;//6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용

	function passcheck(e) {
		console.log($(e).val());
		if (reg_upw.test($(e).val())) {
			$('.passcheckLayer').text("안전한 비밀번호입니다.").css(s_success);
		} else {
			$('.passcheckLayer').text("6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용하세요").css(	s_fail);
		}
	};

	function passcheck2(e) {
		console.log($(e).parents());
		if ($(e).parent().parent().parent().find('input[name=member_password]')
				.val() != $(e).val()) {
			$('.passcheckLayer2').text("비밀번호가 일치하지 않습니다.").css(s_fail);
		} else {
			$('.passcheckLayer2').text("비밀번호 확인").css(s_success);
		}
	};

	function email_change(e) {
		var email2 = $(e).parent().find('input[name=email2]');
		if ($(e).val() == '0') {
			email2.attr('readOnly', 'true');
			email2.val('');
		}
		else if ($(e).val() == '9') {
			email2.removeAttr('readOnly');
			email2.val('');
			email2.focus();
		} else {
			email2.attr('readOnly', 'true');
			email2.val($(e).val());
		}
	};
	
	function reset() {
		$(".enrollUser input").not(".gender, .certChk, .welfare").each(function() {
			$(this).val('');
		});
		$(".enrollCompany input").not(".gender, .certChk, .welfare").each(function() {
			$(this).val('');
		});
		if($("#certChk").is(":checked")){
			$("#certChk").removeAttr('checked');
		}
		$('.passcheckLayer').text('');
		$('.passcheckLayer2').text('');
		$('.idchk').html('');
	};
	
	function checkDupCert(){
		var temp = [];
	    var obj = $('.certList');
	    var result = false;
	    $(obj).each(function(i) {
            temp[i] = $(this).find("select > option:selected").val();
        });
	    $(temp).each(function(i) {
            var x = 0;
            $(obj).each(function() {
            	if( temp[i] == $(this).find("select > option:selected").val() ) {
                    x++;
                }
            });
             
            // 임시 변수값이 1 이상, 즉 1개 이상 중복되는값이 있으면 바로 종료
            if(x > 1) {
            	result = true;
                return result;
            }
        });
	    
	    return result;
	};
	
	$("#userInsert").submit(function(event){
		$("#certCnt").val(cnt);
		if(checkDupCert()){
			alert('동일한 자격증이 존재합니다.');
			event.preventDefault();
		};
		
		return;
	});
	
	$(function() {
		$('.welfare').click(function(){
			// 배열 선언
			var arrayParam = new Array();

			//each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
			$(".welfare:checked").each(function(){
				arrayParam.push($(this).val());
			});
			$("#company_wel").val(arrayParam);
		});
	      $("#certChk").change(function(){
	        if($("#certChk").is(":checked")){
	            cnt = 1;
	            $(".certList").toggle("slow");
	            $("#addCert").toggle("fast");
	            $("#delCert").toggle("fast");
	        }else{
	            cnt = 0;
	            $(".certList").not(":first").remove();
	            $(".certList").toggle("slow");
	            $("#addCert").toggle("fast");
	            $("#delCert").toggle("fast");
	        }
	    });
	     
	    $("#addCert").on("click",function(){
	    	cnt++;
	    	$(".certList:first").clone().insertAfter(".certList:last");
	        $(".certList:last select").attr({
	            name : 'cert'+cnt,
	            id : 'cert'+cnt
	        });
	        $(".certList:last input[type=date]").attr({
	            name : 'certDate'+cnt,
	            id : 'certDate'+cnt
	        });
	    });
	    $("#delCert").on("click",function(){
	    	if(cnt <= 1){
	            alert("더 이상 자격증 목록을 제거할 수 없습니다.\n사용하지 않으신다면\n사용 체크를 해제하세요!");
	        } else {
	            $(".certList:last").remove();
	    		cnt--;
	    	}
	    });
	    
	    var today = new Date();
	    var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!
	    var yyyy = today.getFullYear();
	     if(dd<10){
	            dd='0'+dd
	        } 
	        if(mm<10){
	            mm='0'+mm
	        } 

	    today = yyyy+'-'+mm+'-'+dd;
	    past = (yyyy-51)+'-'+mm+'-'+dd;
	    $("input[type=date]").attr('max', today);
	    $("input[type=date]").attr('min', past);
	});
	
	$(function() {
		var objDragAndDrop = $(".dragAndDropDiv");

		$(document).on("dragenter", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
					$(this).css('border', '2px solid #0B85A1');
				});
		$(document).on("dragover", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
		$(document).on("drop", ".dragAndDropDiv", function(e) {

			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			
			handleFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		function handleFileUpload(files, obj) {
			var member_id = $('#member_id').val();
			if(files.length < 2){
			for (var i = 0; i < files.length; i++) {
				var fd = new FormData();
				fd.append('member_id', member_id);
				fd.append('file', files[i]);

				var status = new createStatusbar(obj); //Using this we can set progress.
				status.setFileNameSize(files[i].name,
						files[i].size);
				sendFileToServer(fd, status);
			}
			} else {
				alert("파일은 하나만 등록이 가능합니다.");
			}
		}

		var rowCount = 0;
		function createStatusbar(obj) {

			rowCount++;
			var row = "odd";
			if (rowCount % 2 == 0)
				row = "even";
			this.statusbar = $("<div class='statusbar "+row+" hidden'></div>");
			this.filename = $("<div class='filename hidden'></div>").appendTo(this.statusbar);
			this.size = $("<div class='filesize hidden'></div>").appendTo(this.statusbar);
			this.progressBar = $("<div class='progressBar hidden'><div></div></div>").appendTo(this.statusbar);
			this.abort = $("<div class='abort hidden'>중지</div>")
					.appendTo(this.statusbar);

			obj.after(this.statusbar);

			this.setFileNameSize = function(name, size) {
				var sizeStr = "";
				var sizeKB = size / 1024;
				if (parseInt(sizeKB) > 1024) {
					var sizeMB = sizeKB / 1024;
					sizeStr = sizeMB.toFixed(2) + " MB";
				} else {
					sizeStr = sizeKB.toFixed(2) + " KB";
				}

				this.filename.html(name);
				this.size.html(sizeStr);
			}

			this.setProgress = function(progress) {
				var progressBarWidth = progress
						* this.progressBar.width() / 100;
				this.progressBar.find('div').animate({
					width : progressBarWidth
				}, 10).html(progress + "% ");
				if (parseInt(progress) >= 100) {
					this.abort.hide();
				}
			}

			this.setAbort = function(jqxhr) {
				var sb = this.statusbar;
				this.abort.click(function() {
					jqxhr.abort();
					sb.hide();
				});
			}
		}

		function sendFileToServer(formData, status) {
			var uploadURL = "fileUpload.do"; //Upload URL
			var extraData = {}; //Extra Data.
			var jqXHR = 
				$.ajax({
						xhr : function() {
							var xhrobj = $.ajaxSettings.xhr();
							if (xhrobj.upload) {
								xhrobj.upload.addEventListener('progress',function(event) {
													var percent = 0;
													var position = event.loaded || event.position;
													var total = event.total;
													if (event.lengthComputable) {
														percent = Math.ceil(position/ total * 100);
													}
													//Set progress
													status.setProgress(percent);
												}, false);
							}
							return xhrobj;
						},
						url : uploadURL,
						type : "POST",
						contentType : false,
						processData : false,
						cache : false,
						data : formData,
						dataType : "json",
						success : function(data) {
							$(".member_profile_img").val(decodeURIComponent(data.path.replace(/\+/g, " ")));
							var imgPreview = $(".member_profile_img").val().substring($(".member_profile_img").val().indexOf("resources"));
							$(".dragAndDropDiv").html("<p align='center'>정상 등록이 되었습니다.<br></p>");
							$(".dragAndDropDiv").append("<p align='center'><img width='150px;' height='150px;' src="+imgPreview+"></p>");
							$(".dragAndDropDiv").removeClass("dragAndDropDiv");
							//alert($(".member_profile_img").val());
							status.setProgress(100);
							//$("#status1").append("File upload Done<br>");
						}
					});
			status.setAbort(jqXHR);
		}
	});
</script>
</html>