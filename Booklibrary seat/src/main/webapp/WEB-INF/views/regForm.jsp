<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/css.css" /> 
</head>
<body>
<h1>회원가입</h1>
<hr>
	<div id="demo"></div>
	<form id= "form" action="reg.do" method="post">
		<table border="1">
			<tr>
				<td>학번</td>
				<th><input type="text" name="number"
					value="${sessionScope.number }" readonly></th>
			</tr>
			<tr>
				<td>아이디</td>
				<th><input type="text" id="student_id" name="student_id"></th> <th><input type="button" value="중복체크" onclick="idCheck()"></th>
			</tr>
			<tr>
				<td>비밀번호</td>
				<th><input type="password" name="student_pw"></th>
			</tr>
			<tr>
				<td>이름</td>
				<th><input type="text" name="student_name"
					value="${sessionScope.name }" readonly></th>
			</tr>
			<tr>
				<td>전화번호</td>
				<th><input type="text" name ="student_tel" onKeyup="inputPhoneNumber(this);" maxlength="13"/></th>
			</tr>
		</table>
		<div id="button">*아이디 중복체크를 먼저 실행해주세요*</div>
		
	</form>
</body>
<script>
	function idCheck() {
		const xhttp = new XMLHttpRequest();
		let id = document.querySelector("#student_id").value;
		xhttp.onload = function() {
			let data = this.responseText;
			if (data == 1) {
				document.getElementById("demo").innerHTML = "사용 중인 아이디입니다.";
				document.getElementById("button").innerHTML ="";
			} else {
				document.getElementById("demo").innerHTML = "사용 가능한 아이디입니다";
				document.getElementById("button").innerHTML ="<input type='button' value='가입' onclick='check()'>";
			}
		}
		xhttp.open("GET", "idCheck.do?student_id=" + id, true);
		xhttp.send();
	}

	function check() {
		if (document.querySelector("input[name='student_id']").value == "") {
			alert("아이디를 입력해주세요");
			document.querySeletor("input[name='student_id']").focus;
			
		} else if (document.querySelector("input[name='student_pw']").value == "") {
			alert("비밀번호를 입력해주세요");
			document.querySeletor("input[name='student_pw']").focus;
			
		} else if (document.querySelector("input[name='student_tel']").value == "") {
			alert("전화번호를 입력해주세요");
			document.querySeletor("input[name='student_tel']").focus;
			
		} else{
			document.querySelector("#form").submit();
		}

	}
	
	
//////번호 하이픈 넣기
	function inputPhoneNumber(obj) {



	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";



	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
</script>
</html>