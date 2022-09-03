<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
<link rel="stylesheet" type="text/css" href="/CRMS/CSS/orderManage.css">
</head>
<body >
<c:import   url="head.jsp" var="content"/>
<c:out    value="${content }"   escapeXml="false"/>
<c:import   url="left.jsp" var="content"/>
<c:out    value="${content }"  escapeXml="false"/>
<div id="myorder">
<div id="orderPage">

<div id="findHead">
		
	 <input type="text" id="inputBox" name="searchKey" v-model:value="searchKey"  placeholder="请输入搜索关键词" id="inputBox" >	  
       <button id="Search" @click="findOrderBySearchKey" >查询</button>
    	起始日期:<input type="date" v-model="beginDate"/>-截止日期:<input type="date" v-model="endDate"/>
    	<span>缴费总额:{{total}}元</span>
 
       </div>
		<table >
		<tr height="40px" bgcolor="#e9e9e9">
		<th width="220px">订单编号</th>	
		<th width="130px">客户名</th>	
		<th width="130px">缴费日期</th>
		<th width="130px">到期日期</th>
		<th width="100px">费用</th>
		<th width="100px">缴费类型</th>
		<th width="130px">经办人</th>
		<th width="200px">操作</th>	
		
	</tr>
	</table>
	<div id="myorderList">
	<table>

	<tr v-for="o in orderList" v-if="o.client!=null" id="clientlist" align="center" >	
              <td width="220px">{{o.orderId}}</td>
              <td width="130px">{{o.client.cName}}</td>
              <td width="130px">{{o.payDate}}</td>
              <td width="130px">{{o.dueDate}}</td>         
              <td width="100px">{{o.fee}}元</td>
              <td width="100px" v-if="o.client.cType==0" >按月缴费</td>
              <td width="100px" v-if="o.client.cType==1" >按年缴费</td>
              <td width="130px">{{o.operator}}</td>
              <td width="200px"><input class="btnB" type="button" value="续费" @click="addTime(o.orderId)"> <input class="btnB" type="button" value="删除" @click="delOrder(o.orderId)"></td>
	
	</tr>	
		</table>
		</div>

</div>

	<div id="remindForm" v-show=" remindShow">
		<div  class="remindTable">
			<h1>
				续费提醒 <span>以下订单即将到期，请及时处理！</span>
				<input id="close" type="button" name="close" value="×" @click="changeRemindShow" />			
			</h1>
			<div>
			<ul id="remindList">
				<li v-for="r in remindList">订单编号:{{r.orderId}}  <li>
			
			</ul>
			
			</div>
			
		</div>
	<input type="button" value="好的，我知道了" id="understand" @click="changeRemindShow">
	
	</div>

		</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
<script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
<script>
	new Vue({
		el:'#myorder',
		data:{
			 oderItem:{
		          orderId:"",		        
		          payDate:"",
		          dueDate:"",
		          fee:"",
		          operator:"",
		          client:{
		        	  cName:"",
		        	  cType:"",
		          }
				
		          
		        },
		        remindList:[],
		       searchKey:"",
		       remindShow:false,
		        orderList:[],
		        beginDate:"",
		        endDate:"",
		        total:"",
		       
	
		},
		methods:{
			findOrderBySearchKey:function(){
					var _this=this
				
				axios({
					url:'findOrderBySearchKey',
					params:{searchKey:_this.searchKey}
					
				}).then(function(resp){
					
					 _this.orderList = resp.data
					
					
				})
			},
			findAllOrder:function(){
				var _this=this
				
				axios({
					url:'findAllOrder'
					
					
				}).then(function(resp){
					
					 _this.orderList = resp.data
					 _this.checkDate()
					
				})
			},
			delOrder(orderId){
				var _this=this		
				axios({
					url:'delOrder',
					params:{orderId:orderId} 										
				}).then(function(resp){
					 _this.orderList = resp.data
					 alert("删除成功!")														
				})
			},
			changeRemindShow(){
				
				this.remindShow=!this.remindShow
			},
			checkDate:function(){//获得当前时间，实现对所有订单到期时间进行检查，将到期时间不到七天的订单找出来用于提醒
				
				
				this.remindList=[]
				var l=this.orderList.length
				var now=new Date()
				var n=now.getTime()
				for(var i=0;i<l;i++){
					var time = new Date(this.orderList[i].dueDate)
					var t=time.getTime()
					var differ=Math.floor((t-n)/(24*3600*1000))
					if(differ<=7){
						/* alert("订单"+this.orderList[i].orderId+"小于7") */
						this.remindList.push(this.orderList[i])//将到期时间小于7天的
						}
				} 
				
				if(this.remindList.length!=0){
					this.changeRemindShow()
					
				} 
			},
			addTime:function(oid){
				var _this=this		
				axios({
					url:'addTime',
					params:{
						orderId:oid,
												
					} 										
				}).then(function(resp){
					_this.orderList = resp.data		
					alert("该用户续费登记成功")
				})
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
				   
				  this.beginDate=today;
				 
				  this.endDate=today;
			},
			
			
			
		},//methods
		watch:{
			beginDate:function(){
	
				var bd=new Date(this.beginDate)
				var ed=new Date(this.endDate)
				var l=this.orderList.length
				var t=0
				for(var i=0;i<l;i++){
					var od=new Date(this.orderList[i].payDate)
					if(od>=bd&&od<=ed){
					
						t+=this.orderList[i].fee
					}
					
				}
				this.total=t
			}
		},
	
		created:function(){//当我们页面加载的时候触发请求，查询所有
	        this.findAllOrder();
	        this.createTime();
	        
	        
	    }
	})
</script>