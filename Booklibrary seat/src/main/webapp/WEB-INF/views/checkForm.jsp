<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/checkform.css" /> 
</head>
<body>
    <h3>학교 학생만 가입 가능합니다</h3>
    <hr>
    <div id="demo"></div>
    <form name="frm">
        <input type="text" id="num" name="num" placeholder="학번을 입력하세요">
        <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
    </form>
    <button onclick="check()">인증하기</button>
</body>


<script>
 function check2(){
	 if(document.frm.num.value == ""){
		 alert("학번을 입력해주세요");
		 document.frm.num.focus;
		 return false;
	 }else if(document.frm.name.value == ""){
		 alert("이름을 입력해주세요");
		 document.frm.name.focus;
		 return false;
	 }else{
		 return true;
	 }
 }
 function check() {
	 var num = document.getElementById("num").value;
	  
	  if (isNaN(num)) {
	    alert("학번을 숫자로 입력해주세요.");
	    return;
	  }else{
 let num= document.querySelector("#num").value;
 let name= document.querySelector("#name").value;
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
		  let data= this.responseText; 
		 
	    if(data=="인증 되었습니다."){ 	
	    document.getElementById("demo").innerHTML = data;
	    location.href="regForm";
	    }else{
	    	 document.getElementById("demo").innerHTML = data;
	    }
	    }
	  xhttp.open("POST", "studentCheck.do?num="+num+"&name="+name,true);
	  xhttp.send();
	}
 }
</script>
</html>