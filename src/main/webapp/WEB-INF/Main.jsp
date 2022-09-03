<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body style="overflow:hidden" >
<c:import   url="head.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="bg.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>

${msg}
</body>
</html>
