<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/userManage.css">
<title>用户登录管理</title>
</head>
<body style="overflow:hidden">
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="head.jsp" var="head"/>
<c:out    value="${head }"   escapeXml="false"/>
<div id="user">
<div id="userPage">

<div id="findHead">
	 <input type="text" id="inputBox" name="uname"  v-model:value="searchKey" placeholder="请输入用户名" id="inputBox" >
	 
       <button id="Search" @click="findUserByUserName" >查询</button>
       <button id="AddUser" @click="changeAddShow" >添加新用户</button>
       </div>
		<table >
		<tr height="40px" bgcolor="#e9e9e9">
		<th width="350px">用户名</th>	
		<th width="300px">用户状态</th>	
		<th width="350px">操作</th>	
		
	</tr>
	</table>
	<div id="myuser">
	<table>
	
	<tr v-for="user in userList" id="userlist" align="center" >	
              <td width="350px">{{user.userName}}</td>
             <td width="300px" v-if="user.userState==1"><div id="state1">启用中</div></td>
              <td width="300px" v-if="user.userState==0"><div id="state2">禁用中</div></td>        
               <td width="350px" v-if="user.userState==1"> <input class="btnB" type="button" value="禁用" @click="changeUserState(user.userId)"></td>
              <td width="350px" v-if="user.userState==0"><input class="btnB" type="button" value="启用"   @click="changeUserState(user.userId )"></td>           	
	</tr>		
		</table>
		</div>
			
</div>
<div id="bg" v-show="addShow"></div>
			<div id="addForm" v-show="addShow">
		<form   class="smart-green">
			<h1>
				添加一个新用户 <span>请填写用户名和密码！</span>
				<input id="close" type="button" name="close" value="×" @click="changeAddShow" />
			
			</h1>
			<label> <span>用户名</span>
			 <input id="username" type="text" name="username" placeholder="请输入用户名"  v-model="user.userName"/>
			</label> 
			<label>
			 <span>设置密码</span> 
			<input id="userpwd"
				type="password" name="password" placeholder="请输入密码" v-model="user.userPwd" />
			</label>
			 <label>
			 <label>
			 <span>状态</span> 
			<select id="userstate" v-model="user.userState">
				<option value="0" label="禁用状态">
				<option value="1" label="启用状态">
				
				
				</select>
			</label>
			 <label>
			 <span>&nbsp;</span> 
			 <input type="button" class="button" value="添加" @click="checkAdd();"/>
			</label>
		</form>
	</div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
<script>
	new Vue({
		el:'#user',
		data:{
			 user:{
		          userId:"",
				  userName:"",
				  userPwd:"",
				  userState:"",	
		        },
		       searchKey:"",
		        userList:[],
		        addShow:false
		},
		methods:{
			findAllUser:function(){
				var _this=this
			
				axios({
					url:'findAllUser'
					
					
				}).then(function(resp){
					 _this.userList = resp.data
					
					
					
				})
			},
			changeUserState(id){
				var _this=this
				
				axios({
					url:'changeUserState',
					params:{userId:id}, 
					
				
				}).then(function(resp){
					
					 _this.userList = resp.data
										
				})
			},
			findUserByUserName:function(){
				var _this=this
				
				axios({
					url:'findUserByUserName',
					params:{searchKey:_this.searchKey},
					
				
				}).then(function(resp){
					
					 _this.userList = resp.data
					
					
				})
			},
			changeAddShow:function(){
				this.addShow=!this.addShow
			},
			AddUser:function(){
				var _this=this
				
				axios({
					url:'AddUser',
					method:'post',
					data:{
							userName:_this.user.userName,
						  userPwd:_this.user.userPwd,
						  userState:_this.user.userState,},
					
				
				}).then(function(resp){
					_this.userList=resp.data.userlist
				
					_this.changeAddShow()
						alert(resp.data.msg)
					
				})
			},
			checkAdd(){
				if(this.user.userName==""||this.user.userPwd==""||this.user.userState==""){
					alert("输入数据不可为空！")
				}else{
					 this.AddUser()
				}
					
				
					
			}
		},
	
		
		
		created:function(){//当我们页面加载的时候触发请求，查询所有
	        this.findAllUser();
	    }
	})
</script>