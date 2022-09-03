<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/left.css">
<title>Insert title here</title>
</head>
<body>
<div id="manageMenu">
	<div id="manageHead">
	<c:choose>
		<c:when test="${haveLogin!=null&&loginType=='normal'}">
			<div id="headPic1"></div><br><br>
			${'欢迎网络管理员'+=haveLogin+='！'}<br><a href="${pageContext.request.contextPath}/outLogin">退出登录</a>
		</c:when>
		<c:when test="${haveLogin!=null&&loginType=='manager'}">
			<div id="headPic2"></div><br><br>
			${'欢迎尊贵的系统管理员'+=haveLogin+='大人！'}<br><a href="${pageContext.request.contextPath}/outLogin">退出登录</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/Login" id="Ltitle">当前未登录</a>
		</c:otherwise>		
	</c:choose> 
	</div>
	<ul id="mList">
		<li><a href="${pageContext.request.contextPath}/userManage">登录管理</a></li>
		<li><a href="${pageContext.request.contextPath}/clientManage">客户管理</a></li>
		<li><a href="${pageContext.request.contextPath}/orderManage">订单管理</a></li>
	
	</ul>
</div>
</body>
</html>
<