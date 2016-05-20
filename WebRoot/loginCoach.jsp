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
		function getCookie()
		{
			var u = document.getElementById("LN").value;
			document.cookie="coachLoginName="+u;
		}
	</script>
</head>


<body>
	<div class="title">
	</div>
	<form action="coachLogin.do" method="post">
		<div class="signIn">
			<input id="LN" type="text" name="loginName" style="width:140px; height:20px;position: absolute;margin-left: -70px;margin-top: -63px;top: 50%;left: 50%;display: block;z-index: 2000;background:none;border:none" />
			<input type="password" name="coachLoginPassword" style="width:140px; height:20px;position: absolute;margin-left: -70px;margin-top:-12px;top: 50%;left: 50%;display: block;z-index: 2000;background:none;border:none" />
			<input type="submit" value="" onclick="getCookie()" style="border:none;background:url('images/button1.png') left top no-repeat;width:183px; height:41px;position: absolute;margin-left: -90px;margin-top: 45px;top: 50%;left: 50%;display: block;z-index: 2000" />
		</div>
	</form>

</body>
</html>