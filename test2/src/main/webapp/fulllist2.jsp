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


<td align="center">카테고리 : </td>
		<select name="product" id="product">
			<c:forEach var="code" items="${itemlist2}" varStatus="status2">
			<option value="<c:out value="${code.itemclsname }" />" 
				<c:if test="${ithplist.itemclsname == code.itemclsname }">selected="selected"</c:if>>
				<c:out value="${code.itemclsname }" />
			</option>
		</c:forEach>	
		</select>
	
<td align="center">1차분류 : </td>
		<select name="sub" id="sub">
			<option>:: 선택 ::</option>
		</select>
	
<form action="search.do" method="post" align="right" id="search" name="search">
    	<input type="hidden" name="producta" id="producta">
    	<input type="hidden" name="suba" id="suba"> 
    	<input type="hidden" name="subaa" id="subaa" value=""> 
    	<input type="submit" value="조회">
  	 </form>
  	 
  	 <form action="itselect.do" method="post" align="right">
    	<input type="hidden" name="abcd" id="abcd">
    	<input type="submit" value="조회1">
  	 </form>



 <input type="button" id="listButton" value="리스트출력" /> <br/> <div id="listDiv"></div>


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

<tbody id="tbody">
<input id="tr" name="tr" type="hidden"/>
	 <c:forEach items="${itemlist2}" var="board">
		<tr id="ta" name="ta" class="address">
			<td onclick="goView('${board.itemcd}')">${board.itemcd}</td>
			<td onclick="goView('${board.itemcd}')">${board.itemname}</td>
			<td onclick="goView('${board.itemcd}')">${board.madenmcd}</td>
			<td onclick="goView('${board.itemcd}')">${board.madename}</td>
			<td onclick="goView('${board.itemcd}')">${board.itemunitcd}</td>
			<td onclick="goView('${board.itemcd}')">${board.itemunitname}</td>
			<td onclick="goView('${board.itemcd}')">${board.stockamt}</td>
			<td onclick="goView('${board.itemcd}')"><input type="checkbox" name="stockyn" size="17" value="${board.stockyn}" checked="checked"></td>
			<td onclick="goView('${board.itemcd}')"><input type="checkbox" name="useyn" size="17" value="${board.useyn}" checked="checked"></td> 
		</tr>
	</c:forEach>
</tbody>	
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
	<td><select id="useYn"  >
		<c:forEach var="code" items="${itemlist2}" varStatus="status2">
			<option value="<c:out value="${code.madename }" />" 
				<c:if test="${ithplist.madename == code.madename }">selected="selected"</c:if>>
				<c:out value="${code.madename }" />
			</option>
		</c:forEach>
	</select></td>

	<td align="center">단 위 명 : </td>
	<td><select id="useYn1"  >
		<c:forEach var="code" items="${itemlist2}" varStatus="status2">
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

</table>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
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


$(function() {
	var select = "<option>:: 선택 ::</option>"; 
	$("#product").change(function() {			
		if($("#product").val() == "") { // select의 value가 ""이면, "선택" 메뉴만 보여줌.
			$("#sub").find("option").remove().end().append(select);
		} else {
			comboChange($(this).val());
		}
	});


	function comboChange() {
		$.ajax({
			type:"post",
			url:"test.do",
			datatype: "json",
			data: $("#product"),
			success: function(data) {
				/* alert(JSON.stringify(data)); */
				if(data.length > 0) {
					$("#sub").find("option").remove().end().append(select);
					$.each(data, function(key, value) {
						$("#sub").append("<option>" + value.itemname + "</option>"); 
					});
				} else {
					$("#sub").find("option").remove().end().append("<option>-- No sub --</option>");
					return;
				}
			},
			error: function(x, o, e) {
				var msg = "페이지 호출 중 에러 발생 \n" + x.status + " : " + o + " : " + e; 
				alert(msg);
			}				
		});
	}	
});

 $("#search").click(function(){
	var product = $("#product option:selected").val();
	var sub = $("#sub option:selected").val();
	$('#producta').val(product);
	$('#suba').val(sub);
}); 

  /* $(function(){ 
		 $.ajax({ 
			 type: 'post' , 
			 url: 'fulllist2.do' ,
			 dataType : 'json' , 
			 success: function(data) {
				 var htmlStr = "";
				 var htmlStr1 = "";
				 $.each(data, function(i, vo){
					  htmlStr += "<tr><td onclick="+goView(vo.itemcd)+">"+vo.itemcd+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.itemname+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.madenmcd+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.madename+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.itemunitcd+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.itemunitname+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.stockamt+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.stockyn+"</td>";
					  htmlStr += "<td onclick="+goView(vo.itemcd)+">"+vo.useyn+"</td></tr>";
				 
				  });
				  $('input[name=abcd1]').attr('value',vo.itemcd); 
				 $("#tbody").html(htmlStr); 
					 } 
		 });	
		 })  */
		  function goView(diNo){
	  	$('#tr').val(diNo);
	 			/* alert(diNo); 
				console.error(diNo);  */
	  	//location.href="itselect.do?itemcd="+diNo;
	  	var v = {};
	  	$.ajax({
			type:"post",
			url:"itselect.do?itemcd="+diNo,
			datatype: "json",
			success: function(data) {
				 /* alert(data.length); 
				console.error(data.length);   */
				$('#a').val(data.itemcd);
	        	$('#b').val(data.itemname);
	        	$('#useYn').val(data.madename);
	        	$('#useYn1').val(data.itemunitname);
	        	$('#product').val(data.itemclsname);
	        	$('#sub').val(data.itemname);
			
			},
			error: function(data) {
				alert("실패"); 
				console.error("실패");  
			}				
		});
		}	  
			
		  /* $(function(){
			 
			    $('.address').click(function(){
			    	var product = $("#hid1").val();
			    	$.ajax({
			    		
						type:"post",
						url:"itselect.do",
						datatype: "html",
						success: function(data) {
							alert(product); 
							console.error(product);  
						},
						error: function(data) {
							alert(product); 
							console.error(product);  
						}				
					});
			    });
			});  */
		</script>

</body>
</html>