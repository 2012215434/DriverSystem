
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>学员管理</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">   
      
   </style>
   <script>
function edit(a,b,c,d,e,m)
{
/* x=document.getElementById(i);  // 找到元素
y=document.getElementById(j);
z=document.getElementById(k); */
document.getElementById("da1").value=document.getElementById(a).innerText; 
document.getElementById("db1").value=document.getElementById(b).innerText;
document.getElementById("dc1").value=document.getElementById(c).innerText;  // 改变内容

document.getElementById(m).removeChild(document.getElementById(a));
document.getElementById(m).removeChild(document.getElementById(b));
document.getElementById(m).removeChild(document.getElementById(c));
document.getElementById(m).removeChild(document.getElementById(d));
document.getElementById(m).removeChild(document.getElementById(e));
document.getElementById(m).appendChild(document.getElementById("da"));
document.getElementById(m).appendChild(document.getElementById("db"));
document.getElementById(m).appendChild(document.getElementById("dc"));
document.getElementById(m).appendChild(document.getElementById("dd")); 
}

function FormSubmit()   
{   
	editUser.action="/DriverSystem/updateUser.do";  
	editUser.submit();   
}

function edit2()
{
	document.getElementById("ea1").value=document.getElementById("da1").value; 
	document.getElementById("eb1").value=document.getElementById("db1").value;
	document.getElementById("ec1").value=document.getElementById("dc1").value;
	
 	FormSubmit();
}
</script>
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
			<div class="main1"><br/>
					<table style="display: none;" align="center">
						<tr id="edit">
							<td id="da"><input id="da1" name="userID" type="text"></td>
							<td id="db"><input id="db1" name="userName" type="text"></td>
							<td id="dc"><input id="dc1" name="password" type="text"></td>
							<td id="dd"><input class="btn" type="button" id="dd1" value="修改" onclick="edit2()"/></td>
						</tr>
					</table>
				<form name="editUser">
					<table style="display: none;" align="center">
						<tr id="edit">
							<td id="ea"><input id="ea1" name="userID" type="text"></td>
							<td id="eb"><input id="eb1" name="userName" type="text"></td>
							<td id="ec"><input id="ec1" name="password" type="text"></td>
							<!-- <td id="d"><input id="d1" type="submit" value="修改"/></td> -->
						</tr>
					</table>
				</form>
				<form name="getUserInfo" action="/DriverSystem/getUserInfoByName.do" method="post">
					<div>请输入学员姓名：
					<input type="text" name="userName"/>
					<input class="btn" type="submit" value="查询"/>
					<input class="btn" type="button" value="增加学员" onclick="javascript:location.href='/DriverSystem/addUser.jsp'"/>
					</div>
					<br/>
					<table id="tb1" align="center">
						<tr>
							<td width="200px">学员id</td>
							<td width="200px">学员姓名</td>
							<td width="200px">学员密码</td>
						</tr>
						<c:forEach var="user1" items="${user}" varStatus="status">
						<tr id="m${user1.userID}">
							<td id="a${user1.userID}">${user1.userID}</td>
							<td id="b${user1.userID}">${user1.userName}</td>
							<td id="c${user1.userID}">${user1.password}</td>
							<td id="d${user1.userID}" width="100px"><input class="btn" type="button" value="编辑" onclick="edit('a${user1.userID}','b${user1.userID}','c${user1.userID}','d${user1.userID}','e${user1.userID}','m${user1.userID}')"/></td>
							<td id="e${user1.userID}" width="100px"><input class="btn" type="button" value="删除" onclick="javascrip:location.href='/DriverSystem/deleteUser.do?userID=${user1.userID}'"/></td>
						</tr>
						</c:forEach>
					</table>
				</form>
				<br/>
			</div>
			<br/>
			<div class="backButton"><button class="backButton" onclick="location.href='/DriverSystem/management.jsp'">返回系统管理</button>&nbsp<button class="backButton" onclick="location.href='/DriverSystem/index.jsp'">返回首页</button></div>
</div>
	</body>
</html>

