<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/clientManage.css">
<title>客户管理</title>
</head>

<body style="overflow:hidden">
<c:import   url="head.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"  escapeXml="false"/>
<div id="client">
<div id="clientPage">

<div id="findHead">
		
	 <input type="text" id="inputBox" name="searchKey" v-model:value="searchKey"  placeholder="请输入搜索关键词" id="inputBox" >	  
       <button id="Search" @click="findClientBysearchKey" >查询</button>
       缴费类型：<select name="payType" @change="findClientByType($event.target.value)">
	 	<option value="-1" label="全部" >
	  	<option value="0" label="按月缴费">
	  	<option value="1" label="按年缴费">
	  </select>
        <button id="Search" @click="changePlaceShow">宽带办理</button>
       </div>
		<table >
		<tr height="40px" bgcolor="#e9e9e9">
		<th width="130px">客户学号</th>	
		<th width="130px">客户姓名</th>	
		<th width="130px">宿舍楼</th>
		<th width="130px">宿舍号</th>
		<th width="130px">客户类型</th>
		<th width="130px">电话</th>
		<th width="200px">操作</th>			
	</tr>
	</table>
	<div id="myclient">
	<table>

	<tr v-for="c in clientList" id="clientlist" align="center" >	
              <td width="130px">{{c.cSnum}}</td>
              <td width="130px">{{c.cName}}</td>
              <td width="130px">{{c.cDob}}</td>
              <td width="130px">{{c.cDno}}</td>         
              <td v-if="c.cType==0" width="130px">包月客户</td>
              <td v-if="c.cType==1" width="130px">包年客户</td>
              <td width="130px">{{c.cPhone}}</td>
              <td width="200px"><input class="btnB" type="button" value="修改" @click="changeModShow();findClientById(c.cid)"> <input class="btnB" type="button" value="删除" @click="delClient(c.cid)"></td>
	</tr>		
		</table>
		</div>	
</div>



<div id="bg" v-show="placeShow"></div>
			<div id="addForm" v-show="placeShow">
		<form :model="client"  class="smart-green">
			<h1>
				宽带登记办理 <span>请填写客户资料以及相关宽带办理信息！</span>
				<input id="close" type="button" name="close" value="×" @click="changePlaceShow" />
			
			</h1>
			<label> <span>客户姓名</span>
			 <input id="name" type="text" name="name" placeholder="请输入姓名"  v-model="client.cName"/>
			</label> 
			<label>
			 <span>客户学号</span> 
			<input id="cSnum"
				type="text" name="cSnum" placeholder="请输入客户学号" v-model="client.cSnum" />
			</label>
			<label>
			 <span>联系电话</span> 
			<input id="phone"
				type="text" name="cPhone" placeholder="请输入电话号码"  v-model="client.cPhone"/>
			</label>
			 <label> 
			 <span>宿舍楼 :</span>
			 <input id="cDob"
				type="text" name="cDob" placeholder="输入宿舍楼"  v-model="client.cDob"/>
			</label> 
			<label> 
			 <span>宿舍号 :</span>
			 <input id="cDob"
				type="text" name="cDon" placeholder="输入宿舍号"  v-model="client.cDno"/>
			</label>
			<label> 
			 <span>缴费日期 :</span>
			 <input id="time"
				type="date" name="date"  v-model="orderDate"/>
			</label>
			<label> 
			<span>缴费类型(包年：98/月 包年：895/年)</span>
			<select name="selection" v-model="client.cType" >
					<option name="m" value="0">按月缴费</option>
					<option name="y" value="1">按年缴费</option>
			</select>
			</label> <label>
			 <span>&nbsp;</span> 
			 <input type="button" class="button" value="提交" @click="checkPalce"/>
			</label>
		</form>
	</div>
	
	
	<div id="bg" v-show="modShow"></div>
			<div id="modForm" v-show="modShow">
		<form :model="modclient"  class="smart-green">
			<h1>
				客户信息修改表<span>请填写需要修改的客户信息！</span>
				<input id="close" type="button" name="close" value="×" @click="changeModShow" />
			
			</h1>
			<label> <span>客户姓名</span></span>
			 <input id="name" type="text" name="name" placeholder="请输入姓名"  v-model="modclient.cName" />
			</label> 
			<label>
			 <span>客户学号</span> 
			<input id="cSnum"
				type="text" name="cSnum" placeholder="请输入客户学号" v-model="modclient.cSnum" />
			</label>
			<label>
			 <span>联系电话</span> 
			<input id="phone"
				type="text" name="cPhone" placeholder="请输入电话号码"  v-model="modclient.cPhone"/>
			</label>
			 <label> 
			 <span>宿舍楼 :</span>
			 <input id="cDob"
				type="text" name="cDob" placeholder="输入宿舍楼"  v-model="modclient.cDob"/>
			</label> 
			<label> 
			 <span>宿舍号 :</span>
			 <input id="cDob"
				type="text" name="cDon" placeholder="输入宿舍号"  v-model="modclient.cDno"/>
			</label>
			
			<label> 
			<span>缴费类型</span>
			<select name="selection" v-model="modclient.cType">
					<option value="0">按月缴费</option>
					<option value="1">按年缴费</option>
			</select>
			</label> <label>
			 <span>&nbsp;</span> 
			 <input type="button" class="button" value="确认修改"  @click="checkMod()"/>
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
		el:'#client',
		data:{
			 client:{
		            cid:"",
		            cSnum:"",
		            cName:"",
		            cType:"",
		            cPhone:"",
		            cDob:"",
		            cDno:"",
		            
		           
		        },
		        modclient:{
		            cid:"",
		            cSnum:"",
		            cName:"",
		            cType:"",
		            cPhone:"",
		            cDob:"",
		            cDno:"",
		            
		           
		        },
		        orderDate:"",
		       searchKey:"",
		       operator:"",
		        clientList:[],
		        display:"display:none",
		        placeShow:false,
		        modShow:false,
		        overflow:"overflow:hidden"
	
		},
		methods:{
			findAllClient:function(){
				var _this=this
				
				axios({
					url:'findAllClient'
					
					
				}).then(function(resp){
					 _this.clientList = resp.data
					
					
				})
			},
			findClientByType(val){
				var _this=this
				
				axios({
					url:'findClientByType',
					params:{t:val} 
					
					
				}).then(function(resp){
					 _this.clientList = resp.data
					
					
				})
			},
			findClientBysearchKey(){
				var _this=this
			
				axios({
					url:'findClientBysearchKey',
					params:{searchKey:_this.searchKey}, 
					
				
				}).then(function(resp){
				
					 _this.clientList = resp.data
					
					
				})
			},
			delClient(id){
				var _this=this
			
				axios({
					url:'delClient',
					params:{id:id}, 
					
				
				}).then(function(resp){
					alert("已为您删除该用户以及其对应的订单")
					 _this.clientList = resp.data
					
					
				})
			},
		    	changePlaceShow() {
			     this.placeShow=!this.placeShow
			    },
			    changeModShow:function(){
			    	this.modShow=!this.modShow;		
			    },
			    findClientById:function(cid) {
			    	var _this=this
				      
			    	axios({
						url:'findClientById',
						params:{cid:cid}, 
						
					
					}).then(function(resp){
						
						 _this.modclient = resp.data
					
						
					})
				      
				    },
				    checkPalce(){
				    	
				    	if(this.orderDate==""||this.client.cSnum==""||this.client.cName==""||this.client.cType==""||this.client.cPhone==""||this.client.cDob==""||this.client.cDno==""){
				    		alert("输入信息不可为空！")
				    		
				    	}else{
				    		
				    		this.checkSnum()
				    	
				    	}
				    },
				    checkSnum:function(){
				    	var _this=this
				    	axios({
							url:'checkSnum',
							params:{cSnum:this.client.cSnum},
						
							
						
						}).then(function(resp){
							
							 if(resp.data=="yes"){
								 alert("该学号对于客户已存在！")
							 }else{
								 _this.placeOrder()
						    		_this.changePlaceShow()
						    		alert("宽带办理登记成功！")
							 }
							
							
						})
				    },
					placeOrder:function(){
			    	var _this=this
			    	
					var client={
							cSnum:this.client.cSnum,
				        	cName:this.client.cName,
				            cType:this.client.cType,
				            cPhone:this.client.cPhone,
				            cDob:this.client.cDob,
				            cDno:this.client.cDno
					}
			    	
			    	axios({
						url:'placeOrder',
						method:'post',
						data:{	client:client, orderDate:_this.orderDate},
					
						
					
					}).then(function(resp){
						
						 _this.clientList = resp.data
						
						
					})
				},
				modifyClient(){
					var _this=this
					
					axios({
						url:'updateClient',
						method:'post',
						data:{
							cid:_this.modclient.cid,
			                 cSnum:_this.modclient.cSnum,
			                 cName:_this.modclient.cName,
			                 cType:_this.modclient.cType,
			                 cPhone:_this.modclient.cPhone,
			                 cDob:_this.modclient.cDob,
			                 cDno:_this.modclient.cDno, 	
						
						},
					
						
					
					}).then(function(resp){
					
						 _this.clientList = resp.data
						
						
					})
				},
				checkMod(){
					
					if(this.modclient.cSnum==""||this.modclient.cName==""||this.modclient.cPhone==""||this.modclient.cDob==""||this.modclient.cDno==""){
			    		alert("学号"+this.modclient.cSnum+"姓名"+this.modclient.cName+"类型"+this.modclient.cType+"电话"+this.modclient.cPhone+"宿舍楼"+this.modclient.cDob+"宿舍号"+this.modclient.cDno)
						
			    		alert("输入信息不可为空吧！")
					}
			    		else{
			    			this.modifyClient()
			    			alert("修改成功！")
			    			this.changeModShow()
			    		}
			    		
					
				},
				createTime:function(){			
						//设置日期默认值
					  var _this=this;
					  var now = new Date();  					  
					  //格式化日，如果小于9，前面补0  
					  var day = ("0" + now.getDate()).slice(-2);  
					  //格式化月，如果小于9，前面补0  
					  var month = ("0" + (now.getMonth() + 1)).slice(-2);  
					  //拼装完整日期格式  
					  var today = now.getFullYear()+"-"+(month)+"-"+(day) ;  
					  //完成赋值  
					   
					  this.orderDate=today;
					 
					 
				},
			
		},//methods
		created:function(){
			//当我们页面加载的时候触发请求，查询所有
				
	        this.findAllClient();
	        this.createTime()
	    }
	})
</script>