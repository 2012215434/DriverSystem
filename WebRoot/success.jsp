<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>操作成功</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="js/time.js"></script> 
	
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
				操作成功！
			<br/><br/><br/>
			</div><br/>
			<div class="backButton">
				<button class="backButton" onclick="javascript:history.back(-1)">返回上一页</button>
				<button class="backButton" onclick="location.href='/DriverSystem/index.jsp'">返回首页</button>
			</div>
		</div>		
	</body>
</html>