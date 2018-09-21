<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체리스트</title>
</head>
<body>
<tr>
<%-- <td align="center">카테고리 : </td>
	<td><select id="province" name="province" onchange="citySelect(this.value);">
		<c:forEach var="code" items="${itemlist}" varStatus="status2">
			<option value="<c:out value="${code.itemclsname }" />" 
				<c:if test="${ithplist.itemclsname == code.itemclsname }">selected="selected"</c:if>>
				<c:out value="${code.itemclsname }" />
			</option>
		</c:forEach>
	</select></td>
<tbody id="tbody"> --%>

<div class="tester">
 <table>
  <tbody>
   <tr>
    <th scope="row">
     <div>전체리스트</div>
    </th>
   </tr>
   <td>
    <select id="province" name="province" onchange="citySelect(this.value);">
		<c:forEach var="code" items="${itemlist}" varStatus="status2">
			<option value="<c:out value="${code.itemclsname }" />" 
				<c:if test="${ithplist.itemclsname == code.itemclsname }">selected="selected"</c:if>>
				<c:out value="${code.itemclsname }" />
			</option>
		</c:forEach>
	</select>
              
    <select id="city" name="city">
    <option value="">전체</option>
    </select>                                   
   </td>
  </tbody>
 </table>
</div>

</tbody>	
<td align="center">1차분류 : </td>
	<td><select id="dsrch_corp_cd" name="srch_corp_cd"  >
		<c:forEach var="code" items="${itemlist}" varStatus="status2">
			<option value="<c:out value="${code.itemname }" />" 
				<c:if test="${ithplist.itemname == code.itemname }">selected="selected"</c:if>>
				<c:out value="${code.itemname }" />
			</option>
		</c:forEach>
	</select></td>
<table border="1" cellpadding="0" cellspacing="0" width="700">

<thead>
	<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>제조사코드</th>
			<th>제조사명</th>
			<th>단위코드</th>
			<th>단위명</th>
			<th>재고수량</th>
			<th>재고여부</th>
			<th>사용여부</th>
	</tr>	
</thead>
<tbody>
	<c:forEach items="${itemlist}" var="board">
		<tr>
			<td id="aa">${board.itemcd}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.itemname}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.madenmcd}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.madename}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.itemunitcd}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.itemunitname}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'">${board.stockamt}</td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'"><input type="checkbox" name="stockyn" size="17" value="${board.stockyn}" checked="checked"></td>
			<td onclick="location.href='itselect.do?itemcd=${board.itemcd}'"><input type="checkbox" name="useyn" size="17" value="${board.useyn}" checked="checked"></td>
		</tr>
	</c:forEach>
	
<form action="update.do" method="post">
<table>
<tr>
	<td align="center">상품코드 : </td>
	<td><input type="text" name="itemcd" size="17" id="a" value="${ithplist.itemcd}"/></td>
</tr>
<tr>
	<td align="center">상 품 명 : </td>
	<td><input type="text" name="itemname" size="17" id="b" value="${ithplist.itemname}"/></td>
</tr>
<tr>
	<td align="center">제 조 사 : </td>
	<td><select name="useYn"  >
		<c:forEach var="code" items="${itemlist}" varStatus="status2">
			<option value="<c:out value="${code.madename }" />" 
				<c:if test="${ithplist.madename == code.madename }">selected="selected"</c:if>>
				<c:out value="${code.madename }" />
			</option>
		</c:forEach>
	</select></td>

	<td align="center">단 위 명 : </td>
	<td><select name="useYn"  >
		<c:forEach var="code" items="${itemlist}" varStatus="status2">
			<option value="<c:out value="${code.itemunitname }" />" 
				<c:if test="${ithplist.itemunitname == code.itemunitname }">selected="selected"</c:if>>
				<c:out value="${code.itemunitname }" />
			</option>
		</c:forEach>
	</select></td>
</tr>

<tr>
	<td align="center">사용여부 : </td>
	<td><input type="checkbox" name="useyn" size="17" value="${ithplist.useyn}" checked="checked">사용</td>
</tr>
<tr>
	<%-- <button type="button" onclick=location.href='iselect.do?cdno=${uulist.cdno}'">테스트1</button>
	<td><a onclick="location.href='insert.do'">추가</a></td>
	<td><button type="button" onclick="location.href='update.do?cdno=${uulist.cdno}'">수정</button></td>
	<td><input type="submit" value="수정"/></td> --%>
	<td><input type="button" id="sitename" value="추가"></td>
	<td><input type="button" id="majorButton" value="수정"/></td>
	<%-- <c:if test="${!empty ithplist}" >
	</c:if> --%>
	<td><input type="submit" id="test_bt" value="저장">
	<button type="button" onclick="location.href='insert.do'" id="test_btn">저장1</td>
	<!-- <input type="button" id="majorButton" value="수정1"> -->
	
</tr>
</table>
</form>
</tbody>
</table>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"> 
$("#sitename").click(function(){
	$.ajax({
        
        type : "GET",
        url : "itlogout.do",
        dataType : "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#a').val('');
        	$('#b').val('');
        	/* alert("통신데이터 값 : " + data) ; */
            $("#dataArea").html(data) ;
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

$("#majorButton").click(function(){
	$.ajax({
        
        type : "GET",
        url : "itin.do",
        dataType : "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#a').val('${ithplist.itemcd}');
        	$('#b').val('${ithplist.itemname}');
        	/* alert("통신데이터 값 : " + data) ; */
            $("#dataArea").html(data) ;
            $("#test_bt").show();
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

function citySelect(province){
	$.ajax({
	 type: "POST",
	 url: "testSelect.do",
	 dataType:"json",
	 data: {param:province},
	 success: function(result){

	  //SELECT BOX 초기화           
	  $("#city").find("option").remove().end().append("<option value=''>전체</option>");
	  
	  //배열 개수 만큼 option 추가
	   $.each(result, function(i){
	    $("#city").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
	   });    
	  },
	   error: function (jqXHR, textStatus, errorThrown) {
	   alert("오류가 발생하였습니다.");
	  }                     
	 });
	}



</script>
</body>
</html>