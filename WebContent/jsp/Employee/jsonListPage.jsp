<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户管理</title>
<link rel="stylesheet" href="./js/jqueryMobile/jquery.mobile-1.4.5.min.css" />
<script src="./js/jqueryMobile/jquery.min.js"></script>
<script src="./js/jqueryMobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="./js/common.js" ></script>
</head>
<body>
	<div data-role="page">
		<div data-role="header" align="center">
			<p>用户管理</p>
		</div>
		<div data-role="content">
			<a href="/ParkCharge/Employee_addPage" >新户登记</a>
			<table data-role="table" id="table-collumn-toggle" data-mode="columntoggle" class="ui-responsive table-stroke" >
				<thead>
					<tr>
						<th data-priority="1">车主编号</th>
						<th data-priority="2">姓名</th>
						<th data-priority="3">车辆号码</th>
						<th data-priority="4">车辆品牌</th>
						<th data-priority="5">车辆颜色</th>
						<th data-priority="6">到期时间</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list_employee">
					<tr>
						<td><s:property value="employee_id" /></td>
						<td>
							<a onclick='editPage(<s:property value="employee_id" />)'>
								<s:property value="emp_name" />
							</a>
						</td>
						<td><s:property value="car_num" /></td>
						<td><s:property value="car_brand_name" /></td>
						<td><s:property value="car_color_name" /></td>
						<td><s:property value="expire_date" /></td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
			<script type="text/javascript">
				//用户修改
				function editPage(employee_id){
					location.href='/ParkCharge/Employee_editPage?id='+employee_id;
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