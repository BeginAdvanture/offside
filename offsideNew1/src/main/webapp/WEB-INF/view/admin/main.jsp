<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #F2F2F2;
}

h1 {
	text-align: center;
	margin-top: 40px;
}

.menu_item {
	margin-bottom: 20px;
	text-align: center;
}

.menu_item a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #30DA;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.menu_item a:hover {
	background-color: #228B22;
}
</style>
</head>
<body>
	<h1>관리자페이지</h1>

	<div class="menu_item">
		<a href="/admin/groundEnroll">경기장 등록</a>
	</div>
	<div class="menu_item">
		<a href="/admin/groundManage">경기장 관리</a>
	</div>
	<div class="menu_item">
		<a href="/admin/matchEnroll">매치 등록</a>
	</div>
	<div class="menu_item">
		<a href="/admin/matchManage">매치 관리</a>
	</div>
	<div class="menu_item">
		<a href="/admin/orderList">매치 현황</a>
	</div>
</body>
</html>
