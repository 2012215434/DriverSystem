<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script>
window.onload=function() 
 { 
 	setInterval("redirect();",100); 
 } 
 function redirect() 
 { 
 	var myDate = new Date(); 
   	var y = myDate.getFullYear(); 
   	var m = myDate.getMonth()+ 1;
   	m = m < 10 ? ("0" + m) : m; 
   	var d = myDate.getDate()+ 1; 
   	d = d < 10 ? ("0" + d) : d;
 	var hr = "http://172.16.0.130:8080/DriverSystem/showAppointmentTable.do?date=" + y + "-" + m + "-" + d; 
 	window.location.href = hr; 
 }  

</script>
	<meta http-equiv="Content-Language" content="zh-CN">
	<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
	<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="./css/style.css" rel='stylesheet' type='text/css' />
	<style type="text/css">    
	</style>
   <title></title>
</head>
<body>
<div class="bg">
</div>
</body>
</html>