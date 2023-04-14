<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/css.css" /> 
</head>
<body>
	

	<h2>도서관 좌석</h2>
	<form action="seatInsert.do" method="get">
	<input type="text" name="id" value="${sessionScope.id }" readonly><br>
	<select name="seatNo" id="sNo">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>
	<input type="submit" value="예약" onclick="return check()">
	</form>
	<input type="button" value="자리 현황" onclick="seatList()">
	<p>메시지
	<div>${arr }</div>
	<div>${msg}</div>
	</p>

	<div></div>
	<p>
		좌석 배치도
		<section>
			<table border="1" cellspacing="0" width="100">
				<tr>
					<td id="s1" width="50%" align="center" >1</td>
					<td id="s2" align="center">2</td>
				</tr>
				<tr>
					<td id="s3" width="50%" align="center" >3</td>
					<td id="s4" align="center">4</td>
				</tr>
				<tr>
					<td id="s5" width="50%" align="center" >5</td>
					<td id="s6" align="center">6</td>
				</tr>
				<tr>
					<td id="s7" width="50%" align="center" >7</td>
					<td id="s8" align="center" >8</td>
				</tr>
				<tr>
					<td id="s9" width="50%" align="center" >9</td>
					<td id="s10" align="center" >10</td>
				</tr>
			</table>
		</section>
		<script> 


function seatList() {
	
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    let data = this.responseText;
	  	var obj = JSON.parse(data);
	  	let seats = [1,2,3,4,5,6,7,8,9,10];
	   	for(var i=0; i<obj.length; i++){
	   		let seat = obj[i].seatNo;
	   		for(var j=0; j<seats.length; j++){
		  		if(seat == seats[j]){
		  			document.getElementById("s"+(j+1)).style.backgroundColor = 'red';
		  		}
		  	}
	  	}   	
	  }
	  xhttp.open("GET", "seatList.do", true);
	  xhttp.send();
	}
	
function check() {
	let id = document.querySelector("input[name='id']").value;
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
		  let data = this.responseText;
		  	var obj = JSON.parse(data);
	 for(var i=0; i<obj.length ; i++){
		 if(id==obj[i].id){
			 alert("이미 예약한 좌석이 있습니다.");
			 return false;
		 }else{
			 return true;
		 }
	 }
	    }
	  xhttp.open("GET", "seatList.do", true);
	  xhttp.send();
	}
</script>
</body>

</html>