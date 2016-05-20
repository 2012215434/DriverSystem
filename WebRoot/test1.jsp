<HTML>
<HEAD>
<META NAME="GENERATOR"Content="oscar999">
</HEAD>
<script>
function a()
{	
	var myDate = new Date(); 
	var nowTime = myDate.getHours();
	if(nowTime<14)
	{
		alert(nowTime);
	}
}
</script>
<BODY>
<INPUT id=button1 type=button value="a" name=button1 onclick="a()">
</BODY>
</HTML>