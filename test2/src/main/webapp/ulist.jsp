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
<table border="1" cellpadding="0" cellspacing="0" width="700">
	<c:forEach items="${ulist}" var="board">
		<tr>
			<td>${board.cdno}</td>
			<td>${board.cdlvl}</td>
			<td>${board.upcd}</td>
			<td>${board.cdname}</td>
			<td>${board.insuser}</td>
			<td>${board.insdate}</td>
			<td>${board.useyn}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>