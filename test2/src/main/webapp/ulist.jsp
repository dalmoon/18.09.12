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
<table>
<tr>
	<td align="center">코드번호 : </td>
	<td>${uulist.cdno}</td>
	<input type="hidden" name="cdno" size="17" value="${uulist.cdno}">
</tr>
<tr>
	<td align="center">코드레벨 : </td>
	<td><input type="text" name="cdlvl" size="17" value="${uulist.cdlvl}"></td>
</tr>
<tr>
	<td align="center">상위코드 : </td>
	<td><input type="text" name="upcd" size="17" value="${uulist.upcd}"></td>
</tr>
<tr>
	<td align="center">코드이름 : </td>
	<td><input type="text" name="cdname" size="17" value="${uulist.cdname}"></td>
</tr>
<tr>
	<td align="center">사용여부 : </td>
	<td><input type="checkbox" name="useyn" size="17" value="${uulist.useyn}" checked="checked">사용</td>
</tr>
<tr>
	<td><button type="button" onclick="location.href='update.do?cdno=${uulist.cdno}'">추가</button></td>
	<td><button type="button" onclick="location.href='update.do?cdno=${uulist.cdno}'">수정</button></td>
</tr>
</table>
</body>
</html>