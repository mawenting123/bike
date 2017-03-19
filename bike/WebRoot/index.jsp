<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公共自行车系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/public.css">
</head>
<body>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href=""><i>LOGO</i><h3>公共自行车系统</h3></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name">****管理员 您好！</p>
				<div class="public-header-fun fr">
					<a href="" class="public-header-man">管理</a>
					<a href="" class="public-header-loginout">安全退出</a>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">
		<div class="clearfix"></div>
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="">首页</a>
				</div>
			</div>
			<ul class="left-nav-list">
				<li class="public-ifame-item">
					<a href="javascript:;">组织机构信息</a>
					<div class="ifame-item-sub">
						<ul>
							<li class="active"><a href="信息管理/cate_manage.html" target="content">权限</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">角色</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">人员登记</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">人员列表</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">业务基础信息</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="protect/vender.jsp" target="content">供应商维护</a></li>
							<li><a href="card/addCard.jsp" target="content">办卡</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">车辆信息</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="bicycle/basic_message/bicycle_station_pile.jsp" target="content">车点车桩信息</a></li>
							<li><a href="bicycle/basic_message/bicycle_catagory.jsp" target="content">车辆类型信息</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">车辆业务</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="信息管理/cate_manage.html" target="content">车辆购入</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">新车入桩</a></li>
							<li><a href="bicycle/bicycle_deal/rent_bicycle.jsp" target="content">车辆租出</a></li>
							<li><a href="bicycle/bicycle_deal/rent_bicycle.jsp" target="content">车辆归还</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">车辆维修</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">车辆维修调出</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">车辆维修调入</a></li>
							<li><a href="vehicle/bike_away_chezhuang.jsp" target="content">车辆调出</a></li>
							<li><a href="vehicle/bike_in_bikes.jsp" target="content">车辆调入</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">车辆报废</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">卡业务</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="card/chargeCard.jsp" target="content">卡充值</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">统计查询</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="信息管理/cate_manage.html" target="content">车点车辆信息查询</a></li>
							<li><a href="bicycle/query_statistics/show_bicycle_fee_statistics.jsp" target="content">月度/年度车辆费用统计</a></li>
							<li><a href="信息管理/cate_manage.html" target="content">车点使用率信息统计分析</a></li>
							<li><a href="report/RealTimeCardReport.jsp" target="content">实时卡费用统计</a></li>
							<li><a href="report/year_month_cardfee.jsp" target="content">月度/年度卡费用统计</a></li>
						</ul>
					</div>
				</li>
			</ul>	
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		<iframe name="content" src="welcome.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");

	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			$(".ifame-item-sub").hide();
			if($(this.lastElementChild).css('display') == 'block'){
				$(this.lastElementChild).hide()
				$(".ifame-item-sub li").removeClass("active");
			}else{
				$(this.lastElementChild).show();
				$(".ifame-item-sub li").on('click',function(){
					$(".ifame-item-sub li").removeClass("active");
					$(this).addClass("active");
				});
			}
		});
	}
});
</script>
</body>
</html>
