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
    
    <title>My JSP 'chargeCard.jsp' starting page</title>
      
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="js/card/public.js"></script>
    <link rel="stylesheet" href="css/public.css" />
    <link rel="stylesheet" href="css/content.css" />
	
    <style type="text/css">
        body{text-align: center}
        table{margin-bottom:20px;margin-top:20px;table-layout:fixed;}
        th{color:#00A1E6;
        border:1px dashed #0000CD;
        width:30px;
        }
        td{border:1px dashed #0000CD;}
        #chargeWin{
           display:none;
           margin-left:300px;
        }
        #chargeMoney{width:300px}
        .sub-btn{color:black;}
        #form_mon{float:left;margin-right:10px;}
        #form_no_mon{float:left}
        
    </style>
    <script type="text/javascript" src="tool/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
       $(function(){
           if(${not empty mess}){
               $("input[name='card_code_1']").val("${card_code_1}");
               query();
               alert("${mess}");
           }
           $("input[name='create_time']")[0].value=getNowTime();
           $("input[name='create_time']")[1].value=getNowTime();
          
           
       })
       
       //卡号查询 卡信息
       function query(){
          var card_code_1=$("input[name='card_code_1']").val();
          clear();
          $.ajax({
             url:"queryByCode.do",
             data:{"card_code":card_code_1},
             success:function(res){
                var obj=eval("("+res+")");
                $("input[name='card_id']")[0].value=obj.card_id;
                $("input[name='card_id']")[1].value=obj.card_id;
                $("input[name='card_code']")[0].value=obj.card_code;
                $("input[name='card_code']")[1].value=obj.card_code;
                
                 $("#card_code_up").html(obj.card_code);
                if(obj.card_type==1){
                	$("#card_type").html("A卡");
                	$("#chargeWin").show();
                	$("#month").show();
                	$("#no_month").show();
                	$("#chargeMoney").val("首充不低于50,其他充值为5的倍数");
                }else if(obj.card_type==2){
                	$("#card_type").html("D卡");
                	$("#chargeWin").show();
                	$("#month").hide();
                	$("#no_month").show();
                	$("#chargeMoney").val("50的倍数,小于500");
                }else if(obj.card_type==3){
                	$("#card_type").html("市民卡/社保卡");
                }else if(obj.card_type==4){
                	$("#card_type").html("员工卡");
                }else if(obj.card_type==5){
                	$("#card_type").html("调度卡");
                }else if(obj.card_type==6){
                	$("#card_type").html("维修卡");
                }
                $("#name").html(obj.name);
                $("#idcard").html(obj.idcard);
                if(obj.sex==1){
                	$("#sex").html("男");
                }else{
                    $("#sex").html("女");
                }
                $("#telphone").html(obj.telphone);
                $("#mobile").html(obj.mobile);
                $("#email").html(obj.email);
                $("#address").html(obj.address);
                $("#work").html(obj.work);
                if(obj.zxbj==0){
                	$("#zxbj").html("正常");
                }else if(obj.zxbj==1){
                    $("#zxbj").html("已注销");
                }
                $("#monthly_money").html(obj.monthly_money);
                $("#frozen_money").html(obj.frozen_money);
                $("#wallet_money").html(obj.wallet_money);
                if(obj.status==0){
                   $("#status").html("正常");
                }else{
                   $("#status").html("锁定");
                }
             }
           })
       }
       //按卡号查询前，先清空所有框的值
       function clear(){
          $("#card_code_up").html("");
          $("#card_type").html("");
          $("#name").html("");
          $("#idcard").html("");
          $("#sex").html("");
          $("#telphone").html("");
          $("#mobile").html("");
          $("#email").html("");
          $("#address").html("");
          $("#work").html("");
          $("#zxbj").html("");
          $("#monthly_money").html("");
          $("#frozen_money").html("");
          $("#wallet_money").html("");
          $("#status").html("");
       }
       
       //清空金额输入框
       function toClear(){
          $("#chargeMoney").val("");
       }
       //月票充值
       function charge_mon(){
         var fee=$("#chargeMoney").val();
         var reg=/^\d+$/;
         if(!reg.test(fee)){
           alert("充值金额格式错误");
         }else{
            var card_id=$("input[name='card_id']")[0].value;
            $.ajax({
	           url:"ifFirstMonthly.do",
	           data:{"card_id":card_id},
	           success:function(res){
	           var record=eval("("+res+")");
	           alert(res);
	              //月票当月还未充值  首充应大于50
	              if(record.length==0){
	                 if(fee<50){
	                    alert("月票当月首充值应大于50");
	                 }else{
	                    var form=document.getElementById("form_mon");
                        form.submit();
	                 }
	              }
	              //月票当月已经充值  是否继续充值  充值金额应是5的倍数
	              else{
	                 var sum_chg_monthly_money=0;
	                 for(var i=0;i<record.length;i++){
	                    sum_chg_monthly_money+=parseInt(record[i].chg_monthly_money);
	                 }
	                 var f1=window.confirm("月票当月已充值"+sum_chg_monthly_money+"元,是否继续充值?");
	                 if(f1){
	                    if(fee%5==0){
	                      var form=document.getElementById("form_mon");
                          form.submit();
	                    }else{
	                      alert("充值金额应是5的倍数");
	                    }
	                 }
	              }
	           }
	          })
	        }
        }
        
        function charge_no_mon(){
			var fee=$("#chargeMoney").val();
			var reg=/^\d+$/;
			var flag=true;
			if(!reg.test(fee)){
			   flag=false;
			   alert("充值金额格式错误");
			}else{
			   if(fee%50==0){
			      if(fee>500){
			         alert("充值金额应不大于500元");
			      }else{
			         alert("充值");
			         var form=document.getElementById("form_no_mon");
                     form.submit();
	              }
			   }else{
			      alert("充值金额应是50的倍数");
			   }
			}
        }
        function upChargeMoney(){
           $("input[name='chargeMoney']")[1].value=$("input[name='chargeMoney']")[0].value;
        }
       
    </script>
  </head>
  
  <body>
    
       <input type="text" placeholder="卡号" name="card_code_1"/>
       <input type="button" value="查询" onclick="query()"/>
    
    <table style="border:1px dashed #0000CD"  width="100%" height="30%" cellspacing="0px">
	    <tr align="center" >
	      <th >卡号</th>
	          <td id="card_code_up"></td>
	      <th>卡类型</th>
		      <td id="card_type"></td>
	      <th>姓名</th>
	      		<td id="name"></td>
	      <th>身份证号</th>
	      		<td id="idcard"></td>
	      <th>性别</th>
			     <td id="sex"></td>
	     </tr>
	     <tr align="center">
	      <th >联系电话</th>
	      		<td id="telphone"></td>
	      <th>手机</th>
	      		<td id="mobile"></td>
	      <th>邮箱</th>
	      		<td id="email"></td>
	      <th>住址</th>
	      		<td id="address"></td>
	      <th>工作单位</th>
	      		<td id="work"></td>
	      </tr>	
	      
	      <tr align="center">
	      <th>注销标志</th>
	             <td id="zxbj"></td>
	      <th>月票金额</th>
	      		<td id="monthly_money"></td>
	      <th>冻结金额</th>
	      		<td id="frozen_money"></td>
	      <th>钱包余额</th>
	      		<td id="wallet_money"></td>
	      <th>卡状态</th>
			    <td id="status"></td>
	     </tr>
	</table>
	
	
<div id="chargeWin">
	<form action="charge_mon.do" method="post" id="form_mon">
	          充值金额
		<input type="text" id="chargeMoney" name="chargeMoney" onclick="toClear()" onchange="upChargeMoney()"/>
		<input type="button" class="sub-btn" id="month" style="background:#00FFFF" value="月票充值" onclick="charge_mon()"/>
		<input type="hidden" name="card_id" />
		<input type="hidden" name="card_code" />
		<input type="hidden" name="create_time" id="create_time"/>
		<input type="hidden" name="user_id" id="user_id" value="1001"/>
	</form>
	<form action="charge_no_mon.do" method="post" id="form_no_mon">
	    <input type="hidden" name="chargeMoney"/>
	    <input type="button" class="sub-btn" id="no_month" style="background:#FF7F50" value="钱包充值" onclick="charge_no_mon()"/>
		<input type="hidden" name="card_id" />
		<input type="hidden" name="card_code" />
		<input type="hidden" name="create_time" id="create_time"/>
		<input type="hidden" name="user_id" id="user_id" value="1001"/>
	</form>

</div>


  </body>
</html>
