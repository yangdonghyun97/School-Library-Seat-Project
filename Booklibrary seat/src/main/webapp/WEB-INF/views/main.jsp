<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
	<c:if test="${sessionScope.id!=null }">

		<div class="header">
			<div id="demo">
				<img src="/img/flogo.png">
			</div>
		</div>

		<ul style="float: right;">
			<li>${id }님반갑습니다</li>
			<li><a href="/oneStudent.do?id=${sessionScope.id }">MyPage</a>||<a
				href="logout.do" style="font-size: xx-small;">로그아웃</a></li>
		</ul>
		<div class="content">
			<h1>여러분의 삶을 변화시키는 곳입니다</h1>
			<br> <a href="/seatForm">자리 예약하러가기</a>
		</div>

		<div class="footer">
			<p style="font-size: 18px;">
				부산캠퍼스 46241 부산광역시 금정구 부산대학로63번길 2 (장전동) TEL : 051. 512. 0311 양산캠퍼스<br>
				50612 경상남도 양산시 물금읍 부산대학로 49 TEL : 051. 512. 0311 밀양캠퍼스<br>
				50463 경상남도 밀양시 삼랑진읍 삼랑진로 1268-50 TEL : 055. 350. 5100 아미캠퍼스<br>
				49241 부산광역시 서구 구덕로 179 (아미동 1가) TEL : 051. 240. 7000<br>
			</p>
		</div>

	</c:if>

	<c:if test="${sessionScope.id==null }">
		<div class="header">
			<div id="demo">
				<img src="/img/flogo.png">
			</div>
		</div>

		<ul>
			<li><a href="/checkForm" class="myButton" style="float: right;">가입하기</a></li>
			<li><a href="/loginForm" class="myButton" style="float: right;">로그인</a></li>
		</ul>

		<div class="item content"></div>

		<div class="footer">
			<p style="font-size: 15px;">
				부산캠퍼스 46241 부산광역시 금정구 부산대학로63번길 2 (장전동) TEL : 051. 512. 0311 양산캠퍼스<br>
				50612 경상남도 양산시 물금읍 부산대학로 49 TEL : 051. 512. 0311 밀양캠퍼스<br>
				50463 경상남도 밀양시 삼랑진읍 삼랑진로 1268-50 TEL : 055. 350. 5100 아미캠퍼스<br>
				49241 부산광역시 서구 구덕로 179 (아미동 1가) TEL : 051. 240. 7000<br>
			</p>
		</div>

	</c:if>





</body>
</html>