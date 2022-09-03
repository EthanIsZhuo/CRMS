<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/rl.css">
<title>Insert title here</title>

</head>
<body style="overflow:hidden">
<c:import   url="head.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<div id="bgPic"></div>
<div id="reg">

<table id="rlTable">
	<tr>
	<td colspan="2" align="center" ><h3>用户注册(Register)</h3></td>
	</tr>
	<tr>
	<td>用户名：</td>
	<td><input type="text" name="regName" id="userInput"  placeholder="用户名" v-model="regForm.regName"></td>
	</tr>
	<tr>
	<td>密码：</td>
	<td><input type="password" name="regPwd"  id="pwdInput" placeholder="密码" v-model="regForm.regPwd"></td>
	</tr>
	<tr>
	<td>确认密码：</td>
	<td><input type="password" name="typePwd" id="pwdInput" placeholder="确认密码" v-model="regForm.typePwd" ></td>
	</tr>
	
	<tr>
	<td colspan="2"><button id="btnrl" @click="checkReg">注册</button></td>
	</tr>
	<tr>
	<td colspan="2">{{msg}}</td>
	</tr>
	<tr>
	<td colspan="2"></td>
	</tr>
</table>

</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
<script>
	new Vue({
		el:'#reg',
		data:{
			 regForm:{
				 regName:"",
				 regPwd:"",
				 typePwd:""
				 
			 },
			
				msg:""
		},
		methods:{
			checkReg:function(){
				if(this.regForm.regName==""||this.regForm.regPwd==""||this.regForm.typePwd==""){
						alert("用户名密码不可为空")
				}else{
					if(this.regForm.regPwd==this.regForm.typePwd){
					this.toReg();
					}else{
						alert("两次输入密码不一致")
					}
				}
			},
			toReg:function(){
				
				var _this=this
				axios({
					url:'toReg',
					method:'post',
					data:{
						userName:_this.regForm.regName,
						userPwd:_this.regForm.regPwd,
					}
					
					
				}).then(function(resp){
					 if(resp.data=="注册成功"){
						
						 window.location.href="Login"
						 
					 }else{
						 alert(resp.data)
					 	_this.msg=resp.data
					 }
					
				})
			}
		}
	})
</script>