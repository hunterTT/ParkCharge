<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车辆颜色管理</title>
<link rel="stylesheet" href="./js/jqueryMobile/jquery.mobile-1.4.5.min.css" />
<script src="./js/jqueryMobile/jquery.min.js"></script>
<script src="./js/jqueryMobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="./js/common.js" ></script>
</head>
<body>
	<div data-role="page">
		<div data-role="header" align="center">
			<p>车辆颜色管理</p>
		</div>
		<div data-role="content">
			<a href="#" onclick="addCarColorPage()" >添加车辆颜色</a>
			<table data-role="table" id="table-collumn-toggle" data-mode="columntoggle" class="ui-responsive table-stroke" >
				<thead>
					<tr>
						<th data-priority="1">编号</th>
						<th data-priority="2">车辆颜色</th>
						<th data-priority="3">修改</th>
						<th data-priority="4">删除</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list_carColor">
					<tr>
						<td><s:property value="id" /></td>
						<td><s:property value="name" /></td>
						<td><a onclick='editPage(<s:property value="id" />)'>修改</a></td>
						<td><a onclick='del(<s:property value="id" />)'>删除</a></td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
			<script type="text/javascript">
				//修改车辆颜色
				function editPage(car_color_id){
					location.href='/ParkCharge/CarColor_editPage?id='+car_color_id;
				}
				
				//删除车辆颜色
				function del(car_brand_id){
					var data={'id':car_brand_id};
					var isdel=confirm("是否要删除该车辆颜色?");
					if(isdel==true){
						$.getJSON('/ParkCharge/CarColor_del',data,function(json){
							if(json.data==true){
								alert("删除车辆颜色成功...");
								location.href='/ParkCharge/CarColor_jsonListPage';
							}else{
								alert("该车辆颜色已经被使用...");
							}
						});
					}
				}
				
				//添加车辆品牌页面
				function addCarColorPage(){
					$.mobile.changePage('/ParkCharge/CarColor_addPage'); 
				}
				
			</script>
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="left">
				<ul>
					<li><a href="#" data-rel="back" data-icon="back">返回</a></li>
					<li><a href="#" onclick="goHome()" data-icon="home">主页</a></li>
					<li><a href="#aboutJsonListPage" data-icon="comment" data-transition="flow" data-rel="popup" data-position-to="window">关于</a></li>
				</ul>
			</div>
			<div data-role="popup" id="aboutJsonListPage" class="ui-content">
				<p><s:property value="#application.projectName" /></p>
			</div>
		</div>
	</div>
</body>
</html>