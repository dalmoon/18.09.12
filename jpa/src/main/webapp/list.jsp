<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="700">
	<c:forEach items="${boardlist}" var="board">
		<tr>
			<td>${board.seq}</td>
			<td>${board.cnt}</td>
			<td>${board.content}</td>
			<td>${board.regdate}</td>
			<td>${board.title}</td>
			<td>${board.writer}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>