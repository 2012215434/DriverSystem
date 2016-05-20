<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>驾校预约</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	

	</head>
	<body>
		<div class="bg">
		<!----- start-header---->
		<div class="container">
			<div id="home" class="header wow bounceInDown" data-wow-delay="0.4s">
					<div class="top-header">
						<div class="logo">
							<a href="http://www.scuec.edu.cn/">SCUN</a>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!----- //End-header---->
			<!---- banner-info ---->
			<div class="banner-info">
				<div class="container">
				<h1 class="wow fadeIn" data-wow-delay="0.5s">&nbsp;&nbsp;&nbsp;&nbsp;<span>&nbsp;胜凡康&nbsp;</span><br />&nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;&nbsp;驾校预约&nbsp;&nbsp;&nbsp;</label></h1>
				<div class="top-banner-grids wow bounceInUp" data-wow-delay="0.4s">
				    <div class="asd">
					</div>
					<div class="banner-grid text-center" onclick='location.href="/DriverSystem/loginUser.jsp";'>
						<span class="top-icon1"> </span>
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;在线约车</h3>
					</div>
					<div class="banner-grid text-center" onclick='location.href="/DriverSystem/loginCoach.jsp";'>
						<span class="top-icon4"></span>
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教练端</h3>
					</div>
					<div class="banner-grid text-center" onclick='location.href="/DriverSystem/loginAdmin.jsp";'>
						<span class="top-icon2"> </span>
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;系统管理</h3>
					</div>
					<div class="clearfix"> </div>
				</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</body>
</html>

