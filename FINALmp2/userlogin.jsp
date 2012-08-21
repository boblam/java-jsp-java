<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>LogIn</title>
    <link rel="stylesheet" type="text/css" href="./css/default.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
	<span id="pendule"></span>
<script language="javascript" type="text/javascript">
function clock() {
var digital = new Date();
var hours = digital.getHours();
var minutes = digital.getMinutes();
var seconds = digital.getSeconds();
var amOrPm = "AM";
if (hours > 11) amOrPm = "PM";
if (hours > 12) hours = hours - 12;
if (hours == 0) hours = 12;
if (minutes <= 9) minutes = "0" + minutes;
if (seconds <= 9) seconds = "0" + seconds;
dispTime = '<b>'+hours + ":" + minutes + ":" + seconds + " " + amOrPm+'</b>';
document.getElementById('pendule').innerHTML = dispTime;
setTimeout("clock()", 1000);
}
window.onload=clock;
var mydate=new Date()
var year=mydate.getYear()
if (year < 1000)
year+=1900
var day=mydate.getDay()
var month=mydate.getMonth()
var daym=mydate.getDate()
if (daym<10)
daym="0"+daym
var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
document.write("<medium><font color='yellow' face='Arial'><b>"+dayarray[day]+", "+montharray[month]+" "+daym+", "+year+"</b></font></small>")
</script>
<script language="javascript">

function reloadImg(id) {
   var obj = document.getElementById(id);
   var src = obj.src;
   var pos = src.indexOf('?');
   if (pos >= 0) {
      src = src.substr(0, pos);
   }
   var date = new Date();
   obj.src = src + '?v=' + date.getTime();
   return false;
}

</script>
<script language="javascript">
function validateForm()
{
var msg = "";
var x=document.forms["myForm"]["username"].value;
var y=document.forms["myForm"]["password"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  msg+="Not a valid e-mail address. \n";
  }
 if (x=="" || y== "")
 {
 msg+="Supply all the needed fields.\n";
 }
 if (msg != "")
	{
		alert(msg);
		return false;
	}
 
}
</script>
<SCRIPT LANGUAGE="JavaScript">
function checkNumeric3(objName,minval, maxval,comma,period,hyphen)
{
	var numberfield = objName;
	if (chkNumeric(objName,minval,maxval,comma,period,hyphen) == false)
	{
		numberfield.select();
		numberfield.focus();
		return false;
	}
	else
	{
		return true;
	}
}

function chkNumeric3(objName,minval,maxval,comma,period,hyphen)
{
var checkOK = comma + period + hyphen;
var checkStr = objName;
var allValid = true;
var decPoints = 0;
var allNum = "";

for (i = 0;  i < checkStr.value.length;  i++)
{
ch = checkStr.value.charAt(i);
for (j = 0;  j < checkOK.length;  j++)
if (ch == checkOK.charAt(j))
break;
if (j == checkOK.length)
{
allValid = false;
break;
}
if (ch != ",")
allNum += ch;
}
if (!allValid)
{	
alertsay = "Please don't enter:"
alertsay = alertsay + " " + "Comma, period, hyphen"
alert(alertsay);
return (false);
}
}
</script>
<% 
  String cookieName = "user";
  Cookie cookies [] = request.getCookies();
  Cookie myCookie = null;
  if (cookies != null)
  {
	for (int i = 0; i < cookies.length; i++)
	{
		if (cookies [i].getName().equals (cookieName))
		{
			myCookie = cookies[i];
			break;
		}
	}
}
  
  if (myCookie != null)
  { %>
<meta http-equiv = "refresh" content = "0;url=placebet.jsp"/>
<% }  else { %>
  
  </head>
  <body>
    <hr class="hidden" />
    <div id="view">
      
      <div id="head">
        <h1 id="logotype">Jan & Yzza Lottery Store</h1>
      </div>
      
      <hr class="hidden" />
      
    
      <div id="content">
        <div id="contentBlock">
          <center><h2 class="subheader biggest">Log In</h2></center>
          
          <div class="item first">
            <div class="in">
              <center>
			<form method="POST" name="myForm" onsubmit="return validateForm();" action="validatelogin.jsp" >
			<h4>Enter email:</h4>
				<input type="text" name="username" size="30" onBlur="checkNumeric3(this,-5,5000,',','.','-');">
				<br/>
            <h4>Enter password:</h4>
			<input type="password" name="password" size="30" onBlur="checkNumeric3(this,-5,5000,',','.','-');">
			<br/>
			<br/>
			<img id="captcha" src="<c:url value="simpleCaptcha.jpg" />" width="200"><br>
			<a href="#" onClick="return reloadImg('captcha');"><h6>Reload Image</h6></a>
            <form action="captchasubmit.jsp" method="post"><input type="text"name="answer" /><br>
			<input type="submit" value="Submit" onClick="return validateForm();">
			</form>
			<h6>Not Yet a Member?</h6><a href="signup.jsp"><h6>SignUp Now!</h6></a>
			</center>
			</div>
			</div>
       
        </div>
        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="rules.jsp">Rules</a></li>
          <li><a href="aboutus.jsp">About Us</a></li>
          <li><a href="accredit.jsp">Accreditation</a></li>
        </ul>
        <ul id="subMenu">
          <li><strong>LogIn/SignUp</strong></li>
        </ul>
      </div>
      <hr class="hidden noprint" />
            <div id="foot">
        <ul class="support">
        </ul>        <ul class="menu">
        </ul>
		<center>
		Copyright &copy; 2012 <a href="#">PCSO LOTTO GAME</a> | 
        Designed by <a href="#">TEAM JY</a> |
        Prepared for <a href="#">PROGAP3</a>
		</center>
      </div>

    </div>

  </body>
</html>
<% } %>


