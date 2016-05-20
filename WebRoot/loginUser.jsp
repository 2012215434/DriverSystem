<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>登陆</title>

	<style type="text/css">
		div.signIn{width: 320px;height:255px;position: absolute;margin-left: -170px;margin-top: -130px;top: 50%;left: 50%;display: block;z-index: 2000;background:url(images/signIn.png)}
		div.title{width: 730px;height:90px;position: absolute;margin-left: -373px;margin-top: -300px;top: 50%;left: 50%;display: block;z-index: 2000;background:url(images/title.png)}
		BODY {background-image: URL(images/bg.jpg);
		background-size:cover;}
	</style>
	<script>
/*  function getCookies() 
 { 
 	u = document.getElementById("userName").value;
 	document.cookie="userName="+u;
 	
 	 alert(document.cookie); 
 }  
 */
</script>
</head>


<body>
	<div class="title">
	</div>
	<form action="login.do" method="post">
		<div class="signIn">
			<input id="userName" type="text" name="userName" style="width:140px; height:20px;position: absolute;margin-left: -70px;margin-top: -63px;top: 50%;left: 50%;display: block;z-index: 2000;background:none;border:none" />
			<input id="password" type="password" name="password" style="width:140px; height:20px;position: absolute;margin-left: -70px;margin-top:-12px;top: 50%;left: 50%;display: block;z-index: 2000;background:none;border:none" />
			<input type="submit" onclick="getCookies()" value="" style="border:none;background:url('images/button1.png') left top no-repeat;width:183px; height:41px;position: absolute;margin-left: -90px;margin-top: 45px;top: 50%;left: 50%;display: block;z-index: 2000" />
		</div>
	</form>

</body>
</html>