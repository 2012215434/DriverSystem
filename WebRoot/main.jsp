
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>约车</title>
		<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">   
   		</style>
<script type="text/javascript" src="js/time.js"></script> 
   <script>
function appoint1()
{
	opW.close();
	var e =document.getElementById(ee);
 	var table = document.getElementById("tab"); 
 	var a=0;
 	var myDate = new Date(); 
	var nowDate = myDate.getDate();
	nowDate = nowDate < 10 ? ("0" + nowDate) : nowDate;
	var nowHours = myDate.getHours();
	var appointDate=document.getElementById(dd).value.split("-");
 	
    for(var i=1;i<table.rows.length;i++)
    {
		var searchText = table.rows[i].cells[searchCol].innerHTML;
		var s = searchText.split('#');
		if(s[1]==getUserID())
		{
			a=1;
		}
    } 
 	if(e)
	{
		alert("不能预约!");
	}
	else if(nowDate-appointDate[2]>0||(appointDate[2]-nowDate==1&&nowHours>22))
	{
		alert("最晚仅可在前一天22点前预约");
	}
	else if(appointDate[2]-nowDate>3)
	{
		alert("最早仅可提前三天预约");
	}
	else if(a==1)
	{
		alert("同一时间只能预约一个老师！");
	}
	else
	{
		document.getElementById("appointUserID").value=getUserID();
		document.getElementById("appointCoachID").value=document.getElementById(aa).value;
		document.getElementById("appointStartTime").value=document.getElementById(bb).value;
		document.getElementById("appointEndTime").value=document.getElementById(cc).value;
		document.getElementById("appointDate").value=document.getElementById(dd).value;

		SubmitAdd(); 
	}
}

function cancel()
{
	opW.close();
	var myDate = new Date(); 
	var nowDate = myDate.getDate();
	nowDate = nowDate < 10 ? ("0" + nowDate) : nowDate;
	var nowHours = myDate.getHours();
	var appointDate=document.getElementById(dd).value.split("-");
	
	if(UID!=""&&UID==getUserID())
	{
		if(appointDate[2]-nowDate>1||(appointDate[2]-nowDate==1&&nowHours<12))
		{
			document.getElementById("appointUserID").value=getUserID();
			document.getElementById("appointCoachID").value=document.getElementById(aa).value;
			document.getElementById("appointStartTime").value=document.getElementById(bb).value;
			document.getElementById("appointEndTime").value=document.getElementById(cc).value;
			document.getElementById("appointDate").value=document.getElementById(dd).value;
			
			SubmitCancel();
		}
		else
		{
			alert("最晚仅可在前一天中午12点前取消预约！");
		}
	}
	else
	{
		alert("你只能取消自己的预约！");
	}
}

 function test1()
{
alert(document.cookie); 
} 

function getUserID()
{
var arrCookie = document.cookie.split('; ');
for(var i=0;i<arrCookie.length;i++)
{
	var arr = arrCookie[i].split('=');
	if(arr[0]=="userID")
	{
		return arr[1];
	}
}
}

function search()
{
	if(document.getElementById("inputDate").value!="")
	{
		SubmitSearch();
	}
	else
	{
		alert("请输入日期！");
	}
}

function SubmitSearch()
{
	appointment.action="/DriverSystem/showAppointmentTable.do";  
	appointment.submit();
}

function SubmitAdd()
{   
	addappointment.action="/DriverSystem/addAppointment.do";  
	addappointment.submit();   
}
function SubmitCancel()
{   
	addappointment.action="/DriverSystem/cancelAppointment.do";  
	addappointment.submit();   
}


 function openw(a,b,c,d,e,col)
{
	aa=a;
	bb=b;
	cc=c;
	dd=d;
	ee=e;
	searchCol=col;
	opW = window.open('sub.jsp','newwindow','height=80, width=290, top=300, left=500, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') ;
}
function pushUID(a)
{	
	UID=a;

}

function setUID()
{
	alert("set");
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
	<form name="addappointment">
		<table style="display:none;" align="center">
			<tr id="appointTR">
				<td id="appointTD1"><input id="appointUserID" name="userID" type="text"></td>
				<td id="appointTD2"><input id="appointCoachID" name="coachID" type="text"></td>
				<td id="appointTD3"><input id="appointStartTime" name="appointStartTime" type="text"></td>
				<td id="appointTD4"><input id="appointEndTime" name="appointEndTime" type="text"></td>
				<td id="appointTD5"><input id="appointDate" name="date" type="text"></td>
			</tr>
		</table>
	</form>
	<form name="appointment">
		<p>请输入日期</p>
		<input type="text" id="inputDate" name="date" style="width:70px" onfocus="HS_setDate(this)">
		<input type="button" class="btn" onclick="search()" value="查询"/><br/>
		<div>点击表格空白处预约或取消预约</div>
		<div>
			<c:forEach var="d" items="${date}" varStatus="status">
    		${d.appointDate}
    		</c:forEach>
    	</div>
		<table id="tab" border="1" bordercolor="#BFBFBF" align="center" cellspacing="0" cellpadding="0">
  			<tr>
    			<td>车辆号码</td>
    			<td>教练姓名</td>
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
			<c:forEach var="book" items="${coachList}" varStatus="status">
			<c:if test="${book.state==0}">
  				<tr>
  					<td> ${book.carPlateNumber}</td>
    				<td> ${book.coachName}</td>
					<td id="7${book.coachID}" onclick="openw('7a${book.coachID}','7b${book.coachID}','7c${book.coachID}','7d${book.coachID}','7e${book.coachID}','2')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '07:00:00' and book1.appointEndTime >= '08:00:00'}">
       							<div id="7e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="7a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="7b${book.coachID}" value="07:00:00" style="display: none;" type="text"/>
							<input id="7c${book.coachID}" value="08:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="7d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="8${book.coachID}" onclick="openw('8a${book.coachID}','8b${book.coachID}','8c${book.coachID}','8d${book.coachID}','8e${book.coachID}','3')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '08:00:00' and book1.appointEndTime >= '09:00:00'}">
       							<div id="8e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="8a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="8b${book.coachID}" value="08:00:00" style="display: none;" type="text"/>
							<input id="8c${book.coachID}" value="09:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="8d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="9${book.coachID}" onclick="openw('9a${book.coachID}','9b${book.coachID}','9c${book.coachID}','9d${book.coachID}','9e${book.coachID}','4')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '09:00:00' and book1.appointEndTime >= '10:00:00'}">
       							<div id="9e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="9a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="9b${book.coachID}" value="09:00:00" style="display: none;" type="text"/>
							<input id="9c${book.coachID}" value="10:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="9d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="10${book.coachID}" onclick="openw('10a${book.coachID}','10b${book.coachID}','10c${book.coachID}','10d${book.coachID}','10e${book.coachID}','5')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '10:00:00' and book1.appointEndTime >= '11:00:00'}">
       							<div id="10e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="10a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="10b${book.coachID}" value="10:00:00" style="display: none;" type="text"/>
							<input id="10c${book.coachID}" value="11:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="10d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="11${book.coachID}" onclick="openw('11a${book.coachID}','11b${book.coachID}','11c${book.coachID}','11d${book.coachID}','11e${book.coachID}','6')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '11:00:00' and book1.appointEndTime >= '12:00:00'}">
       							<div id="11e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="11a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="11b${book.coachID}" value="11:00:00" style="display: none;" type="text"/>
							<input id="11c${book.coachID}" value="12:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="11d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="14${book.coachID}" onclick="openw('14a${book.coachID}','14b${book.coachID}','14c${book.coachID}','14d${book.coachID}','14e${book.coachID}','7')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '14:00:00' and book1.appointEndTime >= '15:00:00'}">
       							<div id="14e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="14a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="14b${book.coachID}" value="14:00:00" style="display: none;" type="text"/>
							<input id="14c${book.coachID}" value="15:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="14d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="15${book.coachID}" onclick="openw('15a${book.coachID}','15b${book.coachID}','15c${book.coachID}','15d${book.coachID}','15e${book.coachID}','8')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '15:00:00' and book1.appointEndTime >= '16:00:00'}">
       							<div id="15e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="15a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="15b${book.coachID}" value="15:00:00" style="display: none;" type="text"/>
							<input id="15c${book.coachID}" value="16:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="15d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="16${book.coachID}" onclick="openw('16a${book.coachID}','16b${book.coachID}','16c${book.coachID}','16d${book.coachID}','16e${book.coachID}','9')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '16:00:00' and book1.appointEndTime >= '17:00:00'}">
       							<div id="16e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="16a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="16b${book.coachID}" value="16:00:00" style="display: none;" type="text"/>
							<input id="16c${book.coachID}" value="17:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="16d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
					<td id="17${book.coachID}" onclick="openw('17a${book.coachID}','17b${book.coachID}','17c${book.coachID}','17d${book.coachID}','17e${book.coachID}','10')">
						<c:forEach var="book1" items="${appointmentList}" varStatus="status">
    						<c:if test="${book1.coachID == book.coachID and book1.appointStartTime <= '17:00:00' and book1.appointEndTime >= '18:00:00'}">
       							<div id="17e${book.coachID}" onclick="pushUID('${book1.userID}')" class="appiontted">${book1.userName}</div>
       							<div style="display:none;">#${book1.userID}#</div>
							</c:if>
    					</c:forEach>
							<input id="17a${book.coachID}" value="${book.coachID}" style="display: none;" type="text"/>
							<input id="17b${book.coachID}" value="17:00:00" style="display: none;" type="text"/>
							<input id="17c${book.coachID}" value="18:00:00" style="display: none;" type="text"/>
							<c:forEach var="d" items="${date}" varStatus="status">
    							<input id="17d${book.coachID}" value="${d.appointDate}" style="display: none;" type="text"/> 			
    						</c:forEach> 
					</td>
  				</tr>
  				</c:if>
			</c:forEach>
		</table>
	</form><br/><br/>
	</div><br/>
	<div class="backButton"><button class="backButton" onclick="location.href='/DriverSystem/index.jsp'">返回首页</button></div>
</div>
</body>
</html>