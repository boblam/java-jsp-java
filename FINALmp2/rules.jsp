<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<html>
  <head>
    <title>Rules</title>
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
          <h2 class="subheader biggest">Rules Of The Game: 6/55</h2>
          
          <div class="item first">
		  <h3 class="subheader"><a href="">How To Play</a></h3>
            <div class="in">
			<%
            Properties property = null;

			String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
			FileInputStream fis = new FileInputStream(propFile) ;
			property = new Properties();
			property.load(fis);
    
			String rules = property.getProperty("rules.htplay");
			String rules1 = property.getProperty("rules.htplay2");
			String rules2 = property.getProperty("rules.htplay3");
			String rules3 = property.getProperty("rules.htplay4");
			String rules4 = property.getProperty("rules.htplay5");
			String rules5 = property.getProperty("rules.htplay6");
			String rules6 = property.getProperty("rules.htplay7");
			String rules7 = property.getProperty("rules.htplay8");
			String rules8 = property.getProperty("rules.htplay9");
			String rules9 = property.getProperty("rules.htplay10");
                       				  
			out.println(rules);          
			out.println(rules1);  
			out.println(rules2);  
			out.println(rules3);  
			out.println(rules4);  
			out.println(rules5);  
			out.println(rules6);  
			out.println(rules7);  
			out.println(rules8);  
			out.println(rules9);  
			%>
			  </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="">How To Pay</a></h3>
            <div class="in">
			<%
            String rules11 = property.getProperty("rules.htpay");
			String rules12 = property.getProperty("rules.htpay1");
			String rules13 = property.getProperty("rules.htpay2");
                       				  
			out.println(rules11);          
			out.println(rules12);  
			out.println(rules13);   
			%>
              </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="">How To Claim</a></h3>
            <div class="in">
			<%
			String rules14 = property.getProperty("rules.htclaim");
			String rules15 = property.getProperty("rules.htclaim1");
                       				  
			out.println(rules14);          
			out.println(rules15);   
			%>
              </div>
          </div>
        </div>
        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
          <li><a href="index.jsp">Home</a></li>
          <li><strong>Rules</strong></li>
          <li><a href="aboutus.jsp">About Us</a></li>
          <li><a href="accredit.jsp">Accreditation</a></li>
        </ul>
        <ul id="subMenu">
          <li><a href="userlogin.jsp">LogIn/SignUp</a></li>
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
