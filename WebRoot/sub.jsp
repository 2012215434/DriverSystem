<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>无标题页</title>
    <link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="./css/style.css" rel='stylesheet' type='text/css' />
    <script type="text/javascript">
    function a()
    {
		window.opener.appoint1();
    }
    function b()
    {
    	window.opener.cancel();
    }
</script>
</head>
<body>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="backButton"  onclick="a()">预约</button>
        <button class="backButton" onclick="b()">取消预约</button>
</body>
</html>