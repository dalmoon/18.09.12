<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
완료
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="700">
	<c:forEach items="${boardlist}" var="board">
		<tr>
			<td>${board.ename}</td>
			<td>${board.comm}</td>
			<td>${board.hiredate}</td>
			<td>${board.empno}</td>
			<td>${board.mgr}</td>
			<td>${board.job}</td>
			<td>${board.deptno}</td>
			<td>${board.sal}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>