<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>请假</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="js/time.js"></script> 
		<script>
window.onload=function() 
 {	
 	document.getElementById("CLN").value=getCoachLoginName();
 };
 
function getCoachLoginName()
{
var arrCookie = document.cookie.split('; ');
for(var i=0;i<arrCookie.length;i++)
{
	var arr = arrCookie[i].split('=');
	if(arr[0]=="coachLoginName")
	{
		return arr[1];
	}
}
}

function addLeave()
{
	if(document.getElementById("inputDate").value!="")
	{
		leave.action="/DriverSystem/addLeave.do";
		leave.submit();
	}
	else
	{
		alert("请输入日期！");
	}
}

function search()
{
	if(document.getElementById("inputDate2").value!="")
	{
		document.getElementById("loginName").value=getCoachLoginName();
		appointment.action="/DriverSystem/showAppointmentList.do";  
		appointment.submit();
	}
	else
	{
		alert("请输入日期！");
	}
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
				<div><font size="4" color="grey">请假</font></div>
				<form name="leave">
					<table align="center">
						<tr style="display:none;">
							<td><input id="CLN" type="text" name="coachLoginName"/></td>
						</tr>
						<tr>
							<td>请假日期</td>
							<td><input id="inputDate" type="text" name="leaveDate" style="width:70px" onfocus="HS_setDate(this)"></td>
						</tr>
					</table>
				</form>
				<input class="btn" type="button" onclick="addLeave()" value="确认"/>
			<br/><br/>
			</div><br/>
		<div class="main1"><br/>
		<form name="appointment">
		<div><font size="4" color="grey">预约信息</font></div>
		<input type="text" id="inputDate2" name="date" style="width:70px" onfocus="HS_setDate(this)">
		<input type="text" id="loginName" name="coachLoginName" style="display:none;">
		<input type="button" class="btn" onclick="search()" value="查询"/><br/><br/>
		<table id="tab" border="1" bordercolor="#BFBFBF" align="center" cellspacing="0" cellpadding="0">
  			<tr>
   				<td width="100">7:00-8:00</td>
   				<td width="100">8:00-9:00</td>
  		 		<td width="100">9:00-10:00</td>
   				<td width="100">10:00-11:00</td>
   			 	<td width="100">11:00-12:00</td>
   				<td width="100">14:00-15:00</td>
   				<td width="100">15:00-16:00</td>
   				<td width="100">16:00-17:00</td>
   				<td width="100">17:00-18:00</td>
  			</tr>
  				<tr>
					<td>
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '07:00:00' and book1.appointEndTime >= '08:00:00'}">
       							<div id="7e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="8${book.coachID}" onclick="openw('8a${book.coachID}','8b${book.coachID}','8c${book.coachID}','8d${book.coachID}','8e${book.coachID}','3')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '08:00:00' and book1.appointEndTime >= '09:00:00'}">
       							<div id="8e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="9${book.coachID}" onclick="openw('9a${book.coachID}','9b${book.coachID}','9c${book.coachID}','9d${book.coachID}','9e${book.coachID}','4')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '09:00:00' and book1.appointEndTime >= '10:00:00'}">
       							<div id="9e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="10${book.coachID}" onclick="openw('10a${book.coachID}','10b${book.coachID}','10c${book.coachID}','10d${book.coachID}','10e${book.coachID}','5')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '10:00:00' and book1.appointEndTime >= '11:00:00'}">
       							<div id="10e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="11${book.coachID}" onclick="openw('11a${book.coachID}','11b${book.coachID}','11c${book.coachID}','11d${book.coachID}','11e${book.coachID}','6')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '11:00:00' and book1.appointEndTime >= '12:00:00'}">
       							<div id="11e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach> 
					</td>
					<td id="14${book.coachID}" onclick="openw('14a${book.coachID}','14b${book.coachID}','14c${book.coachID}','14d${book.coachID}','14e${book.coachID}','7')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '14:00:00' and book1.appointEndTime >= '15:00:00'}">
       							<div id="14e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="15${book.coachID}" onclick="openw('15a${book.coachID}','15b${book.coachID}','15c${book.coachID}','15d${book.coachID}','15e${book.coachID}','8')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '15:00:00' and book1.appointEndTime >= '16:00:00'}">
       							<div id="15e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="16${book.coachID}" onclick="openw('16a${book.coachID}','16b${book.coachID}','16c${book.coachID}','16d${book.coachID}','16e${book.coachID}','9')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '16:00:00' and book1.appointEndTime >= '17:00:00'}">
       							<div id="16e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					<td id="17${book.coachID}" onclick="openw('17a${book.coachID}','17b${book.coachID}','17c${book.coachID}','17d${book.coachID}','17e${book.coachID}','10')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.appointStartTime <= '17:00:00' and book1.appointEndTime >= '18:00:00'}">
       							<div id="17e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
					</td>
					
  				</tr>
		</table>
	</form><br/></div>
				<div class="backButton"><button class="backButton" onclick="location.href='/DriverSystem/index.jsp'">返回首页</button></div>
		</div>		
	</body>
</html>