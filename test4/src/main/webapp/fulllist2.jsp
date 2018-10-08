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
<table border="0" cellpadding="0" cellspacing="0" width="700">
<p>전체리스트</p>
<td align="left">카테고리 : 
		<select name="product" id="product">
			<c:forEach var="code" items="${itemlist2}" varStatus="status2">
			<option value="<c:out value="${code.itemclsname }" />" 
				<c:if test="${ithplist.itemclsname == code.itemclsname }">selected="selected"</c:if>>
				<c:out value="${code.itemclsname }" />
			</option>
		</c:forEach>	
		</select>
1차분류 : 
		<select name="sub" id="sub">
			<option>:: 선택 ::</option>
		</select>
	
<form action="search.do" method="post" align="right" id="search" name="search">
    	<input type="hidden" name="producta" id="producta">
    	<input type="hidden" name="suba" id="suba"> 
    	<input type="submit" value="조회">
  	 </form></td>
</table>	



 <!-- <input type="button" id="listButton" value="리스트출력" /> <br/> <div id="listDiv"></div> -->


<table border="1" cellpadding="0" cellspacing="0" width="700">

  	 
  	 <!-- <form action="itselect.do" method="post" align="right">
    	<input type="hidden" name="abcd" id="abcd">
    	<input type="submit" value="조회1">
  	 </form> -->
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
	 <c:forEach items="${itemlist2}" var="board">
		<tr class="address">
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
		
</table>
<table border="1" cellpadding="0" cellspacing="0" width="700">
<p>금일 입고리스트</p>
	<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>제조사코드</th>
			<th>제조사명</th>
			<th>단위코드</th>
			<th>단위명</th>
			<th>입고수량</th>
	</tr>
	<tbody id="tbody1">
	<tr>
			<td>${ithplist.itemcd}</td>
			<td>${ithplist.itemname}</td>
			<td>${ithplist.madenmcd}</td>
			<td>${ithplist.madename}</td>
			<td>${ithplist.itemunitcd}</td>
			<td>${ithplist.itemunitname}</td>
			<td>${insamt}</td>
		</tr>

</tbody>
</table>
	
<form action="update.do" method="post">
<table>
<p>입고내용<p>
<tr>
	<td align="center">상품코드 : </td>
	<td><input type="text" name="itemcd" size="17" id="itemcd" value="${ithplist.itemcd}" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">상 품 명 : </td>
	<td><input type="text" name="itemname" size="17" id="itemname" value="${ithplist.itemname}" disabled="disabled"/></td>
</tr>
<tr>
	<td align="center">제 조 사 : </td>
	<td><select id="useYn"  disabled="disabled">
		<c:forEach var="code" items="${itemlist2}" varStatus="status2">
			<option value="<c:out value="${code.madename }" />" 
				<c:if test="${ithplist.madename == code.madename }">selected="selected"</c:if>>
				<c:out value="${code.madename }" />
			</option>
		</c:forEach>
	</select></td>

	<td align="center">단 위 명 : </td>
	<td><select id="useYn1"  disabled="disabled">
		<c:forEach var="code" items="${itemlist2}" varStatus="status2">
			<option value="<c:out value="${code.itemunitname }" />" 
				<c:if test="${ithplist.itemunitname == code.itemunitname }">selected="selected"</c:if>>
				<c:out value="${code.itemunitname }" />
			</option>
		</c:forEach>
	</select></td>
</tr>

<tr>
	
</tr>
<tr>
	<%-- <button type="button" onclick=location.href='iselect.do?cdno=${uulist.cdno}'">테스트1</button>
	<td><a onclick="location.href='insert.do'">추가</a></td>
	<td><button type="button" onclick="location.href='update.do?cdno=${uulist.cdno}'">수정</button></td>
	<td><input type="submit" value="수정"/></td> --%>
	<!-- <td><input type="button" id="sitename" value="추가"></td> -->
	
</tr>
</table>
</form>
<td align="center">입고수량 : </td>
<table>

<form action="itlogout1.do" method="post">
    	
		<input type="text" id="useyn2" name="useyn2" size="17"/><br>
    	<input id="tr1" name="tr1" type="hidden"/>
    	<input id="tr" name="tr" type="hidden"/>
    	<input type="button" id="majorButton" value="수정"></td>
    	<input type="submit" value="저장1" id="test_btn" name="test_btn">
</form>
		<form action="update1.do" method="post">
    	<input type="hidden" id="useyn4" name="useyn4" size="17" value="${itlogout2.insitemlistcd}">
    	<input id="tr2" name="tr2" type="hidden"/>
    	<input type="hidden" id="useyn3" name="useyn3" size="17"/>
    	<input type="hidden" id="useyn5" name="useyn5" size="17" value="${itlogout3}"/>
    	<input type="submit" value="저장" id="test_bt" name="test_bt">
</form>
</table>		
	
	<%-- <c:if test="${!empty ithplist}" >
	</c:if> --%>
	<!-- <input type="button" id="majorButton" value="수정1"> -->	

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$("#search").click(function(){
	
}); 
function tbody() {
	/* if() */
	
	var insamt = "1";
	$('#insamt').val(insamt);
}

$("#aa").click(function(){
	$.ajax({
        
        type : "post",
        url : "itlogout1.do",
        dataType : "text",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#itemcd').val('');
        	$('#itemname').val('');
        	$('#useYn').val('${ithplist2.madename}');
        	$('#useYn1').val('${ithplist2.itemunitname}');
        	$('#useyn2').val('');
        	/* alert("통신데이터 값 : " + data) ; */
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
});


$("#xx").click(function(){
	var useyn2 = $("#useyn2").val();
	$('#useyn2').val(useyn2);
	alert(useyn2);
$.ajax({
		
        type : "post",
        url : "itlogout1.do",
        dataType : "json",
        error : function(){
            alert(useyn2);
        },
        success : function(data){
	
	var htmlStr = "";
		  htmlStr += "<tr><td>"+'${ithplist.itemcd}'+"</td>";
		  htmlStr += "<td>"+'${ithplist.itemname}'+"</td>";
		  htmlStr += "<td>"+'${ithplist.madenmcd}'+"</td>";
		  htmlStr += "<td>"+'${ithplist.madename}'+"</td>";
		  htmlStr += "<td>"+'${ithplist.itemunitcd}'+"</td>";
		  htmlStr += "<td>"+'${ithplist.itemunitname}'+"</td>";
		  htmlStr += "<td>"+useyn2+"</td>";
		  
		  $("#tbody1").html(htmlStr); 
        }
        });
});

 $("#majorButton").click(function(){
	 var useyn2 = $("#useyn2").val();
		$('#useyn3').val(useyn2);
	var tr2 = '${tr1}';
		$('#tr2').val(tr2);
	 var htmlStr = "";
	 htmlStr += "<tr><td>"+'${tr1}'+"</td>";
	 htmlStr += "<td>"+'${ithplist.itemname}'+"</td>";
	 htmlStr += "<td>"+'${ithplist.madenmcd}'+"</td>";
	 htmlStr += "<td>"+'${ithplist.madename}'+"</td>";
	 htmlStr += "<td>"+'${ithplist.itemunitcd}'+"</td>";
	 htmlStr += "<td>"+'${ithplist.itemunitname}'+"</td>";
	 htmlStr += "<td>"+useyn2+"</td>";
	
	 $("#tbody1").html(htmlStr); 
	     	
	         if(itemcd.length < 1){

	             $("#test_btn").hide();
	             $("#test_bt").show();


	             //버튼이미지 변경

	       } else {

	             $("#test_btn").hide();
	             $("#test_bt").show();

	       }

	 
	 /* var a = '${itlogout2.insitemlistcd}';
	 $.ajax({
			
	        type : "post",
	        url : "itin.do?insitemlistcd="+a,
	        dataType : "json",
	        error : function(){
	            alert("실패");
	        },
	        success : function(data){alert("성공");}
	 }); */
});

/* $("#majorButton").click(function(){
	var a = '${ithplist.itemcd}';
	$.ajax({
		
        type : "post",
        url : "itin.do?itemcd="+a,
        dataType : "json",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	$('#itemcd').val(data.itemcd);
        	$('#itemname').val(data.itemname);
        	$('#useYn').val(data.madename);
        	$('#useYn1').val(data.itemunitname);
        	$('#useyn2').val('');
        	 alert("통신데이터 값 : " + data) ; 
            if(itemcd.length < 1){

                $("#test_btn").hide();
                $("#test_bt").show();


                //버튼이미지 변경

          } else {

                $("#test_btn").hide();
                $("#test_bt").show();

          }
        }

    });
}); */

$(document).ready(function() {

	/* var f1 = document.forms[0];
	  var a = f1.bbbb.value; */
    // test_btn 버튼의 쿠키값을 검사한다. -  값이 Y 인경우 testDiv 부분 open
	
    if(itemcd.length == "4643643436"){

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
 
 $("#tbody1").click(function(){
	 $('#itemname').attr('disabled', false);
	   	$('#useYn').attr('disabled', false);
	   	$('#useYn1').attr('disabled', false);	
	 var itemcd = '${ithplist.itemcd}';
		var itemname = '${ithplist.itemname}';
		var madename = '${ithplist.madename}';
		var itemunitname = '${ithplist.itemunitname}';
		var insamt = '${insamt}';
		$('#itemcd').val(itemcd);
		$('#itemname').val(itemname);
		$('#useYn').val(madename);
		$('#useYn1').val(itemunitname);
		$('#useyn2').val(insamt);
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
	  $('#tr1').val(diNo);
	  $('#tr2').val(diNo);
	 			/* alert(diNo); 
				console.error(diNo);  */
	  	//location.href="itselect.do?itemcd="+diNo;
	  	var v = {};
	  	$.ajax({
			type:"post",
			url:"itselect.do?itemcd="+diNo,
			datatype: "json",
			success: function(data) {
				var htmlStr1 = "";
				 /* alert(data.length); 
				console.error(data.length);   */
				/* $('#a').val(data.itemcd);
	        	$('#b').val(data.itemname);
	        	$('#useYn').val(data.madename);
	        	$('#useYn1').val(data.itemunitname);
	        	$('#product').val(data.itemclsname);
	        	$('#sub').val(data.itemname);
	        	$('#useyn2').val(data.stockamt); */
	        	
	        	$('#itemcd').val(data.itemcd);
	        	$('#itemname').val(data.itemname);
	        	$('#useYn').val(data.madename);
	        	$('#useYn1').val(data.itemunitname);
	        	$('#product').val(data.itemclsname);
	        	$('#sub').val(data.itemname);
	        	$('#useyn2').val('');
	        	
	        	 /* htmlStr1 += "<p>금일 입고리스트</p><br>";
	        	 htmlStr1 += "<tr><th>상품코드</th>";
	        	htmlStr1 += "<th>상품명</th>";
	        	htmlStr1 += "<th>제조사코드</th>";
	        	htmlStr1 += "<th>제조사명</th>";
	        	htmlStr1 += "<th>단위코드</th>";
	        	htmlStr1 += "<th>단위명</th>";
	        	htmlStr1 += "<th>입고수량</th></tr>";  
				  htmlStr1 += "<tr><td>"+data.itemcd+"</td>";
				  htmlStr1 += "<td>"+data.itemname+"</td>";
				  htmlStr1 += "<td>"+data.madenmcd+"</td>";
				  htmlStr1 += "<td>"+data.madename+"</td>";
				  htmlStr1 += "<td>"+data.itemunitcd+"</td>";
				  htmlStr1 += "<td>"+data.itemunitname+"</td>";
				  htmlStr1 += "<td>"+data.stockamt+"</td></tr>"; 
	        	$("#tbody1").html(htmlStr1); */
	        	
	        	if(itemcd.length < 1){

	                $("#test_btn").show();
	                $("#test_bt").hide();


	                //버튼이미지 변경

	          } else {

	                $("#test_btn").show();
	                $("#test_bt").hide();

	          }
			},
			
			error: function(data) {
				alert("실패"); 
				console.error("실패");  
			}				
		});
				  }
  
		  /* $("#tbody1").click(function(){
      		var itemcd = $("#a").val();
      		var itemname = $("#itemname").val();
      		var useYn = $("#useYn").val();
      		var useYn1 = $("#useYn1").val();
      		var product = $("#product").val();
      		var sub = $("#sub").val();
      		var useyn2 = $("#useyn2").val();
      		$('#itemcd').val(a);
        	$('#itemname').val(b);
        	$('#useYn').val(useYn);
        	$('#useYn1').val(useYn1);
        	$('#product').val(product);
        	$('#sub').val(sub);
        	$('#useyn2').val(useyn2);
      	});  */
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