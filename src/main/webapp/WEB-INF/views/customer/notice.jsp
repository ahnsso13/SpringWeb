<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<main>
	공지사항
	</main>
	notice
	<table border="1">
		<tr>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		
		<c:forEach var="n"  items="${list}">
			<tr>
				<td><a href="notice/${n.id}">${n.title}</a></td>
				<td>${n.writerId}</td>
			</tr>
		</c:forEach>
	</table>
	<div>${count}</div>
	
</body>
</html>