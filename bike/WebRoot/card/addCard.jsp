<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'addCustomer.jsp' starting page</title>
    <link rel="stylesheet" href="css/public.css" />
    <link rel="stylesheet" href="css/content.css" />
	<script type="text/javascript" src="tool/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/card/public.js"></script>
    <script type="text/javascript">
    $(function(){
       if(${not empty mess}){
         alert("${mess}");
       }
       $("#create_time").val(getNowTime());
   })
   
 
   
    //获取卡号
    function getCardCode(){
       if($("#card_type").val()=="3"||$("#card_type").val()=="市民卡/社保卡"){
           $("#card_code").val($("#idcard").val());
       }else{
           $.ajax({
             url:"selCardCode.do",
             success:function(res){
                $("#card_code").val(res);
             }
           })
       }
    }
    
  	function check(){
  		if(document.getElementById("identity").value.length ==0 ){
			document.getElementById("identity1").innerHTML="身份证不能为空！";
			return false;
		}else if(document.getElementById("custname").value.length ==0 ){
			document.getElementById("custname1").innerHTML="姓名不能为空！";
			return false;
		}else if(document.getElementById("address").value.length ==0 ){
			document.getElementById("address1").innerHTML="地址不能为空！";
			return false;
		}
		else{
			return true;
		}
  	
  	}
    function toQueryWin(){
      location.href="card/queryCard2.jsp";
    }

  	
  </script>
  </head>
  <body >
 <input type="button" style="background:#a5cf4c" value="查询" onclick="toQueryWin()"/>
  
  
<form name="form" method="post" action="addCard.do"/>
<TABLE align="center">

<TR>
    <TD>卡号:</TD>
	<TD>
	  <input type="text" id="card_code" name="card_code" class="form-input-txt" readonly/>
	</TD>
</TR>
<TR>
    <TD>卡类型:</TD>
	<TD>
	   <select id="card_type" name="card_type" onchange="getCardCode()">
	    <option value="1">A卡</option>
	    <option value="2">D卡</option>
	    <option value="3">市民卡/社保卡</option>
	    <option value="4">员工卡</option>
	    <option value="5">调度卡</option>
	    <option value="6">维修卡</option>
	   </select>
	</TD>
</TR>
<TR>
    <TD>身份证:</TD>
	<TD><input name="idcard" id="idcard" onchange="getCardCode()"/></TD>
</TR>
<TR>
	<TD>姓名:</TD>
	<TD><input name="name" id="name"/></TD>
</TR>
<TR>
	<TD>性别:</TD>
	<TD>
		<SELECT NAME="sex" id="sex">
			<option value="1">男</option>
			<option value="0">女</option>
		</SELECT>
	</TD>
</TR>

<TR>
	<TD>手机:</TD>
	<TD><input name="telphone"/></TD>
</TR>
<TR>
	<TD>固话:</TD>
	<TD><input name="mobile"/></TD>
</TR>
<TR>
	<TD>邮箱:</TD>
	<TD><input name="email"/></TD>
</TR>
<TR>
	<TD>地址:</TD>
	<TD><input name="address" id="address"/></TD>
</TR>
<TR>
	<TD>工作单位:</TD>
	<TD><input name="work"/></TD>
</TR>
<TR>
	
	<TD><input type="submit" class="sub-btn" value="开卡" ></TD>
</TR>
</TABLE>
<input type="hidden" name="create_time" id="create_time"/>
<input type="hidden" name="user_id" value="1001"/>
</form>

  </body>
</html>
