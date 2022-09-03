 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/rl.css">
<title>Insert title here</title>
</head>

<body style="overflow:hidden">
<c:import   url="head.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<div id="bgPic"></div>
<div id="login">
<table id="rlTable">
	<tr>
	<td colspan="2" align="center" ><h3>用户登录(login)</h3></td>
	</tr>
	<tr>
	<td>用户名：</td>
	<td><input type="text" name="loginName" id="userInput" v-model="loginForm.userName" placeholder="用户名" ></td>
	</tr>
	<tr>
	<td>密码：</td>
	<td><input type="password" name="loginPwd" id="pwdInput" v-model="loginForm.userPwd" placeholder="密码"></td>
	</tr>
	<tr>
	<td>账号类型：</td>
	<td>
	普通用户<input type="radio" name="userType" id="typeSelect" value="normal" v-model="userType"  @change="autoHave"/>
	管理员<input type="radio" name="userType" id="typeSelect" value="manager" v-model="userType" @change="autoHave"></td>
	</tr>
	<tr>
	<td colspan="2" height="50px" align="right"><a href="${pageContext.request.contextPath}/Reg">免费注册</a></td>
	</tr>
	<tr>
	<td colspan="2"><button id="btnrl" @click="checkLogin">登录</button></td>
	</tr>
	<tr>
	<td colspan="2">{{msg}}</td>
	</tr>
</table>
${regOK }
</div>
</body>

</html>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/axios.min.js"></script>

<script>
	new Vue({
		el:'#login',
		data:{
			 loginForm:{
				 userName:"",
				 userPwd:"",
				 
			 },
			userType:"",
				msg:""
		},
		methods:{
			checkLogin:function(){
				
				if(this.loginForm.userName==""||this.loginForm.userPwd==""){				
					alert("输入数据不可为空")
					return
				}
				else if(this.userType=="")
				{ alert("请选择账号类型")
					return
				}
				
				if(this.userType=="normal"){					
					this.toNormalLogin()					
				}else {
					this.toManagerLogin()					
				}
			},
			toNormalLogin:function(){
				
				var _this=this
				axios({
					url:'toNormalLogin',
					method:'post',
					data:{
						userName:_this.loginForm.userName,
						userPwd:_this.loginForm.userPwd,
					}
					
					
				}).then(function(resp){
					 if(resp.data=="登录成功"){
						
						 window.location.href="Main"
						 
					 }else{
					 _this.msg=resp.data
					 }
					
				})
			},
			toManagerLogin:function(){
			
				var _this=this
				axios({
					url:'toManagerLogin',
					method:'post',
					data:{
						mName:_this.loginForm.userName,
						mPwd:_this.loginForm.userPwd,
					}
					
					
				}).then(function(resp){
					 if(resp.data=="登录成功"){						
						 window.location.href="Main"						 
					 }else{
					 _this.msg=resp.data
					 }					
				})
			},
			autoHave:function(){
				if(this.userType=="manager"){
					
					this.loginForm.userName="admin"
					this.loginForm.userPwd="admin"
				}
			},
		
		}
	})
</script>