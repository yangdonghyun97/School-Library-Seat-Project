<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
section{

width: 300px;

margin: 0 auto;
text-align: left;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/css.css" /> 
</head>
<body>
<h1>My Page</h1>
<section>
<hr>
		아이디 : <input type="text" name="id" value="${sessionScope.id}" readonly ><br>
		<hr>
		비밀번호 :****** <input type ="button" onclick="getShow()" value="비밀번호변경">
		<hr>
		<div id="hide" style="display:none">
		<div id="msg"></div>
		<div id="demo"></div>
		<div id="demo2"></div>
		<hr>
		</div>
		이름 : ${vo.student_name }<br>
		<hr>
		휴대전화 : ${vo.student_tel } <input type ="button" onclick="getShow3()" value="번호 변경"><br>
		<div id="hide3"  style="display:none">
		<div id="msg3"></div>
         전화번호
          <input type="text" name ="tel" onKeyup="inputPhoneNumber(this);" maxlength="13"/>
          <input type="button" value="변경" onclick="telChange()">
         <input type="button" value="취소" onclick="getHide3()">
		</div>
		<hr>
		<c:if test="${svo.seatNo == null }">
		도서관 자리정보 : 예약된 정보가 없습니다.
		</c:if>
		<c:if test="${svo.seatNo != null}">
		도서관 자리정보 : ${svo.seatNo }번 자리
		<input type="button" value="취소하기" onclick="cancel()">
		<div id="seatmsg"></div>
		</c:if>
		<hr>
		<br>
</section>
		<input type="button" value="회원 탈퇴" onclick="userDelete()">
		
</body>
</body>
<script>


///////회원 탈퇴///////
function userDelete() {
	const id= document.querySelector("input[name='user_id']").value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
	  let data = this.responseText;
	  if(data==1){
 	alert("그동안 이용해주셔서 감사합니다.");
 	location.href="/";		  
	  }else{
		  alert("오류가 발생하였습니다.");
	  }
    }
  xhttp.open("POST", "/user/userdelete.do?id="+id, true);
  xhttp.send();
}


//////////////디브 보여주기////////////////////////
function getShow3(){
	document.getElementById("hide3").style.display = "block";
}

function getShow2(){
	document.getElementById("hide2").style.display = "block";
}

function getShow() {
	document.getElementById("hide").style.display = "block";
	  document.getElementById("demo").innerHTML = "<input type='text' name='pw' placeholder='현재비밀번호'><br>"+
	  "<input type='text'name='cpw' placeholder='변경하실 비밀번호'>"
		  document.getElementById("demo2").innerHTML = "<input type='button' value='변경' onclick='changePw()'>"
		  +"<input type='button' value='취소' onclick='getHide()'>"
	}
////////////////디브 숨기기 ///////////////////////	
function getHide(){
	document.getElementById("hide").style.display = "none";
}
function getHide2(){
	document.getElementById("hide2").style.display = "none";
}

function getHide3(){
	document.getElementById("hide3").style.display = "none";
}
/////////////////비밀번호 변경////////////////////////
function changePw() {
	let id= document.querySelector("input[name='id']").value;
	const pw= document.querySelector("input[name='pw']").value;
	const cpw= document.querySelector("input[name='cpw']").value;
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    document.getElementById("msg").innerHTML = this.responseText;
	    }
	  xhttp.open("POST", "/changePw.do?student_id="+id+"&student_pw="+pw+"&student_cpw="+cpw, true);
	  xhttp.send();
	}	

///////////////번호 변경////////////
function telChange() {
	let phone = document.querySelector("input[name='tel']").value;
	let id= document.querySelector("input[name='id']").value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("msg3").innerHTML = this.responseText;
    }
  xhttp.open("POST", "/telchange.do?student_tel="+phone+"&student_id="+id, true);
  xhttp.send();
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

////////자리 취소

function cancel() {
	let id= document.querySelector("input[name='id']").value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("seatmsg").innerHTML = this.responseText;
    }
  xhttp.open("GET", "delete.do?id="+id, true);
  xhttp.send();
}
</script>
</html>