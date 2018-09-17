<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
</head>
<body>
<form action="detail.do" method="post">
<table border ="0" width="400" height="100">
<input name="id" type="hidden" value="${id}"/>
<tr>
	<td align = "center">성명 : </td>
	<td><input type="text" id="delivname" name="delivname" size="17" placeholder="성명을 입력하세요."></td>
</tr>
<tr>
	<td align="center">관계 : </td>
    <td><select name="relcd" style="width:150px;">
    	<option value="C0022">본인</option>
    	<option value="C0023">부모님</option>
    	<option value="C0024">지인</option>
    </select></td>
</tr>
<tr>
	<td align="center">우편번호 : </td>
	<td><input type="text" name="addrcd" size="17" placeholder="우편번호"></td>
</tr>
<tr>
	<td align="center">주소 : </td>
	<td><input type="text" name="addrname" size="17" placeholder="주소를 입력하세요"></td>
</tr>
<tr>
	<td align="center">휴대전화번호 : </td>
	<td><input type="text" name="mobiletelno" size="17" placeholder="휴대전화"></td>
</tr>
<tr>
	<td align="center">집전화번호 : </td>
	<td><input type="text" name="hometelno" size="17" placeholder="집번호"></td>
</tr>
<tr>
	<td align="center">사용여부 : </td>
	<td><input type="checkbox" name="useyn" size="17" value="Y" checked="checked">사용</td>
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