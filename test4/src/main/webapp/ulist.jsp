<%@page import="com.test.dvo.CodemngVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트~</title>
</head>
<body>
<div>
<table border="1" cellpadding="0" cellspacing="0" width="700">
<thead>
	<tr>
			<th>코드번호</th>
			<th>코드레벨</th>
			<th>상위코드</th>
			<th>코드이름</th>
			<th>사용여부</th>
	</tr>	
</thead>
<tbody>
	<c:forEach items="${ulist}" var="board">
		<tr>
			<td onclick="location.href='uulist.do?cdno=${board.cdno}'">${board.cdno}</td>
			<td onclick="location.href='uulist.do?cdno=${board.cdno}'">${board.cdlvl}</td>
			<td onclick="location.href='uulist.do?cdno=${board.cdno}'">${board.upcd}</td>
			<td onclick="location.href='uulist.do?cdno=${board.cdno}'">${board.cdname}</td>
			<td onclick="location.href='uulist.do?cdno=${board.cdno}'"><input type="checkbox" name="useyn" size="17" value="${board.useyn}" checked="checked"></td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div>
<form action="update.do" method="post">
<table>
<tr>
	<td align="center">코드번호 : </td>
	<td><input type="text" name="cdno" size="17" value="${hplist.cdno}" id="aaa" disabled="disabled"/></td>
	<td><input type="hidden" name="cdno" size="17" value="${hplist.cdno}" id="bbbb" disabled="disabled"/></td>
	<td><input type="text" name="insdate" size="17" value="${a}" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">코드레벨 : </td>
	<td><input type="text" name="cdlvl" size="17" value="${hplist.cdlvl}" id="a" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">상위코드 : </td>
	<td><input type="text" name="upcd" size="17" value="${hplist.upcd}" id="b" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">코드이름 : </td>
	<td><input type="text" name="cdname" size="17" value="${hplist.cdname}" id="c" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">사용여부 : </td>
	<td><input type="checkbox" name="useyn" size="17" value="${hplist.useyn}" checked="checked">사용</td>
</tr>
<tr>
	<%-- <button type="button" onclick=location.href='iselect.do?cdno=${uulist.cdno}'">테스트1</button>
	<td><a onclick="location.href='insert.do'">추가</a></td>
	<td><button type="button" onclick="location.href='update.do?cdno=${uulist.cdno}'">수정</button></td>
	<td><input type="submit" value="수정"/></td> --%>
	<td><input type="button" id="sitename" value="추가"></td>
	<td><input type="button" id="majorButton" value="수정"/></td>
	<!-- <input type="button" id="majorButton" value="수정1"> -->
	
	<td><input type="submit" id="test_bt" value="저장">
	<button type="button" onclick="location.href='insert.do'" id="test_btn">저장1</td>
</tr>
</table>
</form>
<!-- <button id="sitename">추가</button>
<button id="site">수정</button> -->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"> 
var f1 = document.forms[0];
var a = f1.bbbb.value;
/* $('#sitename').click(function() {
	$('#a').attr('disabled', false);
	$('#a').val('');
	$('#b').attr('disabled', false);
	$('#b').val('');
	$('#c').attr('disabled', false);
	$('#c').val('');
	$('#0').val('');
	}); */
/* $('#site').click(function() {
	  $('#a').attr('disabled', false);
	  $('#a').val('${uulist.cdlvl}');
	  $('#b').attr('disabled', false);
	  $('#b').val('${uulist.upcd}');
	  $('#c').attr('disabled', false);
	  $('#c').val('${uulist.cdname}');
	  $('#aaa').val('${uulist.cdno}');
	  $('#bbbb').val('${hplist.cdno}');
	}); */
$("#majorButton").click(function(){
	$.ajax({
        
        type : "GET",
        url : "in.do",
        dataType : "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#a').val('${hplist.cdlvl}');
        	$('#b').val('${hplist.upcd}');
        	$('#c').val('${hplist.cdname}');
      	  	$('#aaa').val('${hplist.cdno}');
      	  $('#bbbb').val('${hplist.cdno}');
      	  $('#a').attr('disabled', false);
      	$('#b').attr('disabled', false);
      	$('#c').attr('disabled', false);
        	/* alert("통신데이터 값 : " + data) ; */
            $("#dataArea").html(data) ;
            $("#test_bt").show();
            if(a.length < 1){

                $("#test_btn").hide();
                $("#test_bt").show();


                //버튼이미지 변경

          } else {

                $("#test_btn").hide();
                $("#test_bt").show();

          }
        }

    });
	return a;
});

$("#sitename").click(function(){
	$.ajax({
        
        type : "GET",
        url : "logout.do",
        dataType : "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#a').attr('disabled', false);
        	$('#a').val('');
        	$('#b').attr('disabled', false);
        	$('#b').val('');
        	$('#c').attr('disabled', false);
        	$('#c').val('');
        	$('#aaa').val('');
        	$('#bbbb').val('');
        	/* alert("통신데이터 값 : " + data) ; */
            $("#dataArea").html(data) ;
            if(a.length < 1){

                $("#test_btn").show();
                $("#test_bt").hide();


                //버튼이미지 변경

          } else {

                $("#test_btn").show();
                $("#test_bt").hide();

          }
        }

    });
	return a;
});


$(document).ready(function() {

	/* var f1 = document.forms[0];
	  var a = f1.bbbb.value; */
    // test_btn 버튼의 쿠키값을 검사한다. -  값이 Y 인경우 testDiv 부분 open
	
    if(a.length == 45754754754745){

          $("#test_btn").show();
          $("#test_bt").show();
         
    } else{
    	$("#test_btn").hide();
        $("#test_bt").hide();
    }

});




</script>


</body>
</html>