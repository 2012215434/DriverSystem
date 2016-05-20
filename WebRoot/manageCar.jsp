
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>车辆管理</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">   
      
   </style>
   <script>
function edit(a,b,c,d,e,f,m)
{
document.getElementById("da1").value=document.getElementById(a).innerText; 
document.getElementById("db1").value=document.getElementById(b).innerText;
document.getElementById("dc1").value=document.getElementById(c).innerText;
document.getElementById("dd1").value=document.getElementById(d).innerText;  // 改变内容

document.getElementById(m).removeChild(document.getElementById(a));
document.getElementById(m).removeChild(document.getElementById(b));
document.getElementById(m).removeChild(document.getElementById(c));
document.getElementById(m).removeChild(document.getElementById(d));
document.getElementById(m).removeChild(document.getElementById(e));
document.getElementById(m).removeChild(document.getElementById(f));
document.getElementById(m).appendChild(document.getElementById("da"));
document.getElementById(m).appendChild(document.getElementById("db"));
document.getElementById(m).appendChild(document.getElementById("dc"));
document.getElementById(m).appendChild(document.getElementById("dd"));
document.getElementById(m).appendChild(document.getElementById("de")); 
}

function FormSubmit()   
{   
	editCar.action="/DriverSystem/updateCar.do";  
	editCar.submit();   
}

function edit2()
{
	document.getElementById("ea1").value=document.getElementById("da1").value; 
	document.getElementById("eb1").value=document.getElementById("db1").value;
	document.getElementById("ec1").value=document.getElementById("dc1").value;
	document.getElementById("ed1").value=document.getElementById("dd1").value;
	
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
							<td id="da"><input id="da1" name="carID" type="text"></td>
							<td id="db"><input id="db1" name="model" type="text"></td>
							<td id="dc"><input id="dc1" name="carPlateNumber" type="text"></td>
							<td id="dd"><input id="dd1" name="usedYears" type="text"></td>
							<td id="de"><input type="button" id="de1" value="修改" onclick="edit2()"/></td>
						</tr>
					</table>
				<form name="editCar">
					<table style="display: none;" align="center">
						<tr id="edit">
							<td id="ea"><input id="ea1" name="carID" type="text"></td>
							<td id="eb"><input id="eb1" name="model" type="text"></td>
							<td id="ec"><input id="ec1" name="carPlateNumber" type="text"></td>
							<td id="ed"><input id="ed1" name="usedYears" type="text"></td>
						</tr>
					</table>
				</form>
				<form name="getCarInfo" action="/DriverSystem/searchCarByCarPlateNumber.do" method="post">
					<div>请输入车牌号：
					<input type="text" name="carPlateNumber"/>
					<input class="btn" type="submit"  value="查询"/>
					<input class="btn" type="button" value="增加车辆" onclick="javascript:location.href='/DriverSystem/addCar.jsp'"/>
					</div>
					<br/>
					<table id="tb1" align="center">
						<tr>
							<td width="200px">车号</td>
							<td width="200px">车型</td>
							<td width="200px">车牌号</td>
							<td width="200px">使用年数</td>
						</tr>
						<c:forEach var="car1" items="${car}" varStatus="status">
						<tr id="m${car1.carID}">
							<td id="a${car1.carID}">${car1.carID}</td>
							<td id="b${car1.carID}">${car1.model}</td>
							<td id="c${car1.carID}">${car1.carPlateNumber}</td>
							<td id="d${car1.carID}">${car1.usedYears}</td>
							<td id="e${car1.carID}" width="100px"><input class="btn" type="button" value="编辑" onclick="edit('a${car1.carID}','b${car1.carID}','c${car1.carID}','d${car1.carID}','e${car1.carID}','f${car1.carID}','m${car1.carID}')"/></td>
							<td id="f${car1.carID}" width="100px"><input class="btn" type="button" value="删除" onclick="javascrip:location.href='/DriverSystem/deleteCar.do?carID=${car1.carID}'"/></td>
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

