<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>增加学员</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	<body>
		<div class="bg">
		<div class="container">
			<div id="home" class="header wow bounceInDown" data-wow-delay="0.4s">
					<div class="top-header">
						<div class="logo">
							<a href="http://www.scuec.edu.cn/">SCUN</a>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="main1"><br/><br/>
				<form name="addUser" action="/DriverSystem/addUser.do" method="post">
					<table align="center">
						<tr>
							<td>学员ID</td>
							<td><input type="text" name="userID"/></td>
						</tr>
						<tr>
							<td>学员姓名</td>
							<td><input type="text" name="userName"/></td>
						</tr>
						<tr>
							<td>学员密码</td>
							<td><input type="password" name="password"/></td>
						</tr>
						<tr>
							<td><input class="btn" type="submit" value="增加"/></td>
						</tr>
					</table>
				</form>
			<br/><br/>
			</div>
			<br/>
			<div class="backButton">
				<button class="backButton" onclick="javascript:history.back(-1)">返回上一页</button>
<button class="backButton" onclick="location.href='/DriverSystem/management.jsp'">返回系统管理</button>			</div>
		</div>
	</body>
</html>

