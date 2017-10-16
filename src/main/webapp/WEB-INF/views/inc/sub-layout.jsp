<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<tiles:insertAttribute name="header" />
<div>
<tiles:insertAttribute name="aside"/>
<tiles:insertAttribute name="main"/>
</div>
<tiles:insertAttribute name="footer" />




</body>
</html>