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
	공지사항 자세한 페이지
	</main>
	
	notice-detail
	<table border="1">
		<tr>
			<th>ID</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
		</tr>
		<tr>
			<td>${n.id}</td>
			<td>${n.title}</td>
			<td>${n.writerId}</td>
			<td>${n.content}</td>
		</tr>
	</table>
	

	
</body>
</html>