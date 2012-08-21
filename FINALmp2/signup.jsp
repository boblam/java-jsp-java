<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>Sign-Up</title>
    <link rel="stylesheet" type="text/css" href="./css/default.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="./css/print.css" media="print" />
	<script language="JavaScript" src="/FinalMP/js/javascript.js"></script>
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
<script language="JavaScript">      
        function validateForm() {
          var msg = "";
      		if (!checkStrLength(trim(document.registrationForm.email))) {
      			 msg += "Email\n";
      		} else {
      			if (!checkEmail(document.registrationForm.email)) {
      				msg += "Invalid email.\n";
      			}
      		}
      		
      		if (!checkStrLength(trim(document.registrationForm.password))) msg += "Password\n";
      		if (!checkStrLength(trim(document.registrationForm.cust_password2))) msg += "Confirm Password\n";
      		      		
      		if (document.registrationForm.password.value != document.registrationForm.cust_password2.value) {
      			msg += "The passwords do not match.\n";			
      		}
      		
            if (!checkStrLength(trim(document.registrationForm.firstname))) msg += "First Name\n";
      		if (!checkStrLength(trim(document.registrationForm.lastname))) msg += "Last Name\n"; 
      		if (!checkLength(document.registrationForm.address)) msg += "Address\n";
			if (!checkLength(document.registrationForm.cpNum)) msg += "Cell Number\n";
      		
      	  checkNum(document.registrationForm.phone);
      		
      		if (msg != "") {
      			alert("You Must Provide The Following Information:\n\n" + msg);
      			return false;
      		}	
      		
      		document.registrationForm.submit();
          
          function checkNum(phone) {
      		  formobj = document.registrationForm;
      			var phoneNumber = "";
      	
      			formobj.phone.value = trim(formobj.phone);
      			
      			phoneNumber = extractPhoneOrFaxNumber(phone);
      						
      			if (!checkLength(formobj.phone)) {
      				msg += "Phone\n";	
      			} else {
      				if (!isANum(phoneNumber)) {
      					msg += "Phone must be numeric.\n";
      				}
      			}				
      			return;
      	 } 				
       }
    </script>
	<SCRIPT LANGUAGE="JavaScript">
function checkNumeric(objName,minval, maxval,comma,period,hyphen)
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

function chkNumeric(objName,minval,maxval,comma,period,hyphen)
{
var checkOK = "0123456789" + comma + period + hyphen;
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
alertsay = "Please enter:"
alertsay = alertsay + " " + "Numbers Only"
alert(alertsay);
return (false);
}
var chkVal = allNum;
var prsVal = parseInt(allNum);
if (chkVal != "" && !(prsVal >= 18 && prsVal <= 100))
{
alertsay = "You must be atleast 18 years old and above to be qualified member."
alertsay = alertsay + " " + "Please make sure to input a valid age."
alert(alertsay);
return (false);
}
}
</script>
<SCRIPT LANGUAGE="JavaScript">
function checkNum(objName,minval, maxval,comma,period,hyphen)
{
	var numberfield = objName;
	if (chkNum1(objName,comma,period,hyphen) == false)
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

function chkNum1(objName,minval,maxval,comma,period,hyphen)
{
var checkOK = "0123456789" + comma + period + hyphen;
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
alertsay = alertsay + " " + "Comma, period, hyphen, letters"
alert(alertsay);
return (false);
}
}
</script>
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
          <center><h2 class="subheader biggest">Sign-Up Form</h2></center>
          
          <div class="item first">
            <div class="in">
			<form method="post" name="registrationForm" action="addUser.jsp" onsubmit="return validateForm();">
			<p><h5> First Name:<input type="text" name="firstname" size="40" placeholder="Juna Andres"></h5></p>
			<p><h5> Last Name:<input type="text" name="lastname" size="40" placeholder="DelaCruz"></h5></p>
			<h5>Age:<input type="text" name="age" size="40" placeholder="18" onBlur="checkNumeric(this,-5,5000,',','.','-');"></h5><br/>
			</p>
			<p><h5>Address:<input type="text" name="address" size="40" placeholder="721 Mabute St., Malate, Manila"></h5><br/> 
            </p>			
			<p><h5>Home Number:<input type="text" name="phone" size="33"placeholder="2521784" maxlength="7"></h5><br/>
			</p>
			<p><h5>Cell Number:<input type="text" name="cpNum" size="35" placeholder="09167727274" maxlength="11" onBlur="checkNum(this,-5,5000,',','.','-');"></h5><br/>
			</p>
			<p><h5>Email Address:<input type="text" name="email" size="33" placeholder="juandelacruz@gmail.com"></h5><br/>
			</p>
			<p><h5>Password:<input type="password" name="password" size="39" ></h5><br/>
			<p/>
			<p><h5>Confirm Password:<input type="password" name="cust_password2" size="29"></h5>
			</p>
			<img id="captcha" src="<c:url value="simpleCaptcha.jpg" />" width="200">
			<a href="#" onClick="return reloadImg('captcha');"><h6>Reload Image</h6></a><form action="captchasubmit.jsp" method="post"><input type="text"name="answer" /><br/>
			<input type="Submit" value="Submit">
		</form>
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
