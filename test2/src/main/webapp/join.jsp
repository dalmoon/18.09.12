<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function confirmId(){
    var id = $('#id').val();
    $.ajax({
        url:'/idDuplChk.do',
        type:'post',
        data:{id:id},
        success:function(data){
        		if($.trim(data)==0 && id!=""){
                	$('#chkMsg').html("사용가능");                
            	}else{
                	$('#chkMsg').html("사용불가능");
            	}
        },
        error:function(){
                alert("에러입니다");
        }
    });
};

function checkPwd(){
	  var f1 = document.forms[0];
	  var pw1 = f1.pw.value;
	  var pw2 = f1.PwCheck.value;
	  if(pw1.length < 5 || pw1.length > 10){
		  document.getElementById('checkPwd').style.color = "red";
		  document.getElementById('checkPwd').innerHTML = "# 비밀번호는 5자리 이상 10자리 이하여야 합니다."; 
		 }else{
			 document.getElementById('checkPwd').style.color = "black";
			  document.getElementById('checkPwd').innerHTML = ""; 
			  if(pw1!=pw2){
				   document.getElementById('checkPwd').style.color = "red";
				   document.getElementById('checkPwd').innerHTML = "비밀번호 불일치"; 
				  }else{
				   document.getElementById('checkPwd').style.color = "black";
				   document.getElementById('checkPwd').innerHTML = ""; 
				  }
		 }
	 }
</script>
<form action="/join.do" method="post">
<table border ="0" width="400" height="100">
<input name="useyn" type="hidden" value="Y"/>
<tr>
	<td align = "center">아이디 : </td>
	<td><input type="text" id="id" name="id" size="17" placeholder="아이디를 입력하세요.">
	<a href="#none" onclick="confirmId()"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_check2.gif" alt="중복확인" /></a>
	<br><span id = "chkMsg"></span>
	</td>
</tr>
<td align="center" colspan="2">
<div id="checkPwd"></div>
</td>
<tr>
	<td align="center">비 밀 번 호 : </td>
    <td><input type="password" name="pw" size="17" placeholder="비밀번호를 입력하세요."><br></td>
</tr>
<tr>
	<td align="center">비밀번호확인 : </td>
	<td><input type="password" name="PwCheck" onkeyup="checkPwd()" size="17" placeholder="비밀번호를 입력하세요."><br></td>
</tr>
<tr>
	<td align="center">성  명 : </td>
	<td><input type="text" name="name" size="17" placeholder="성명을 입력하세요."><br></td>
</tr>
<tr>
	<td align="center" colspan="2">
	<input type="submit" value="저장">
	</td>
</tr>
</table>
</form>
</body>
</html>