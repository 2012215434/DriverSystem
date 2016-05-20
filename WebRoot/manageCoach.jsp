<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>教练管理</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">   
      
   </style>
   <script>
function edit(a,b,c,d,e,f,g,m)
{
/* x=document.getElementById(i);  // 找到元素
y=document.getElementById(j);
z=document.getElementById(k); */
document.getElementById("da1").value=document.getElementById(a).innerText; 
document.getElementById("db1").value=document.getElementById(b).innerText;
document.getElementById("dc1").value=document.getElementById(c).innerText; 
document.getElementById("dd1").value=document.getElementById(d).innerText;
document.getElementById("de1").value=document.getElementById(e).innerText; // 改变内容

document.getElementById(m).removeChild(document.getElementById(a));
document.getElementById(m).removeChild(document.getElementById(b));
document.getElementById(m).removeChild(document.getElementById(c));
document.getElementById(m).removeChild(document.getElementById(d));
document.getElementById(m).removeChild(document.getElementById(e));
document.getElementById(m).removeChild(document.getElementById(f));
document.getElementById(m).removeChild(document.getElementById(g));
document.getElementById(m).appendChild(document.getElementById("da"));
document.getElementById(m).appendChild(document.getElementById("db"));
document.getElementById(m).appendChild(document.getElementById("dc"));
document.getElementById(m).appendChild(document.getElementById("dd")); 
document.getElementById(m).appendChild(document.getElementById("de"));
document.getElementById(m).appendChild(document.getElementById("df"));
}

function FormSubmit()   
{   
	editCoach.action="/DriverSystem/updateCoach.do";  
	editCoach.submit();   
}

function edit2()
{
	document.getElementById("ea1").value=document.getElementById("da1").value; 
	document.getElementById("eb1").value=document.getElementById("db1").value;
	document.getElementById("ec1").value=document.getElementById("dc1").value;
	document.getElementById("ed1").value=document.getElementById("dd1").value;
	document.getElementById("ee1").value=document.getElementById("de1").value;
	
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
							<td id="da"><input id="da1" name="coachID" type="text"></td>
							<td id="db"><input id="db1" name="coachName" type="text"></td>
							<td id="dc"><input id="dc1" name="coachLoginName" type="text"></td>
							<td id="dd"><input id="dd1" name="coachLoginPassword" type="text"></td>
							<td id="de"><input id="de1" name="carID" type="text"></td>
							<td id="df"><input type="button" id="df1" value="修改" onclick="edit2()"/></td>
						</tr>
					</table>
				<form name="editCoach">
					<table style="display: none;" align="center">
						<tr id="edit">
							<td id="ea"><input id="ea1" name="coachID" type="text"></td>
							<td id="eb"><input id="eb1" name="coachName" type="text"></td>
							<td id="ec"><input id="ec1" name="coachLoginName" type="text"></td>
							<td id="ed"><input id="ed1" name="coachLoginPassword" type="text"></td>
							<td id="ee"><input id="ee1" name="carID" type="text"></td>
							<!-- <td id="d"><input id="d1" type="submit" value="修改"/></td> -->
						</tr>
					</table>
				</form>
<!-- 				<form name="deleteUser" action="/DriverSystem/deleteUser.do" method="post">
					<table align="center">
						<tr>
							<td><input name="userID" type="text" value=""></td>
							<td><input type="submit" value="删除"/></td>
					</tr>
					</table>
				</form> -->
				<form name="getCoachInfo" action="/DriverSystem/getCoachInfoByName.do" method="post">
					<div>请输入教练姓名：
					<input type="text" name="coachName"/>
					<input type="submit" class="btn" value="查询"/>
					<input type="button" class="btn" value="增加教练" onclick="javascript:location.href='/DriverSystem/addCoach.jsp'"/>
					</div>
					<br/>
					<table id="tb1" align="center">
						<tr>
							<td width="200px">教练id</td>
							<td width="200px">教练姓名</td>
							<td width="200px">教练登陆名</td>
							<td width="200px">教练密码</td>
							<td width="200px">车号</td>
						</tr>
						<c:forEach var="coach1" items="${coach}" varStatus="status">
						<tr id="m${coach1.coachID}">
							<td id="a${coach1.coachID}">${coach1.coachID}</td>
							<td id="b${coach1.coachID}">${coach1.coachName}</td>
							<td id="c${coach1.coachID}">${coach1.coachLoginName}</td>
							<td id="d${coach1.coachID}">${coach1.coachLoginPassword}</td>
							<td id="e${coach1.coachID}">${coach1.carID}</td>
							<td id="f${coach1.coachID}" width="100px"><input class="btn" type="button" value="编辑" onclick="edit('a${coach1.coachID}','b${coach1.coachID}','c${coach1.coachID}','d${coach1.coachID}','e${coach1.coachID}','f${coach1.coachID}','g${coach1.coachID}','m${coach1.coachID}')"/></td>
							<td id="g${coach1.coachID}" width="100px"><input class="btn" type="button" value="删除" onclick="javascrip:location.href='/DriverSystem/deleteCoach.do?coachID=${coach1.coachID}'"/></td>
						</tr>
						</c:forEach>
					</table>
				</form>
				<br/>
			</div><br/>
					<div class="backButton"><button class="backButton" onclick="location.href='/DriverSystem/management.jsp'">返回系统管理</button>&nbsp<button class="backButton" onclick="location.href='/DriverSystem/index.jsp'">返回首页</button></div>
		

		</div>

	</body>
</html>



