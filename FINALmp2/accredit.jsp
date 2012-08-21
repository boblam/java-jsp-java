<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<html>
  <head>
    <title>Accreditation</title>
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
          <h2 class="subheader biggest">Accreditation by PCSO</h2>
          
          <div class="item first">
		  <h3 class="subheader"><a href=""></a></h3>
            <div class="in">
			     <%
            Properties property = null;

			String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
			FileInputStream fis = new FileInputStream(propFile) ;
			property = new Properties();
			property.load(fis);
            
			String accreditation = property.getProperty("accredit");
			String accreditation1 = property.getProperty("accredit1");
			String accreditation2 = property.getProperty("accredit1.1");
			String accreditation3 = property.getProperty("accredit1.2");
			String accreditation4 = property.getProperty("accredit2");
			String accreditation5 = property.getProperty("accredit2.1");
			String accreditation6 = property.getProperty("accredit2.2");
			String accreditation7 = property.getProperty("accredit3");
			String accreditation8 = property.getProperty("accredit3.1");
			String accreditation9 = property.getProperty("accredit3.2");
			String accreditation10 = property.getProperty("accredit4");
			String accreditation11 = property.getProperty("accredit4.1");
			String accreditation12 = property.getProperty("accredit4.2");
			String accreditation13 = property.getProperty("accredit5");
			String accreditation14 = property.getProperty("accredit5.1");
			String accreditation15 = property.getProperty("accredit5.2");
			String accreditation16 = property.getProperty("accredit6");
			String accreditation17 = property.getProperty("accredit6.1");
			String accreditation18 = property.getProperty("accredit6.2");
			String accreditation19 = property.getProperty("accredit7");
			String accreditation20 = property.getProperty("accredit7.1");
			String accreditation21 = property.getProperty("accredit7.2");
			String accreditation22 = property.getProperty("accredit8");
			String accreditation23 = property.getProperty("accredit8.1");
			String accreditation24 = property.getProperty("accredit8.2");
			String accreditation25 = property.getProperty("accredit9");
			String accreditation26 = property.getProperty("accredit9.1");
			String accreditation27 = property.getProperty("accredit9.2");
			String accreditation28 = property.getProperty("accredit10");
			String accreditation29 = property.getProperty("accredit10.1");
			String accreditation30 = property.getProperty("accredit10.2");
		    String accreditation31 = property.getProperty("accredit11");
                       				  
			out.println(accreditation);
            out.println(accreditation1 );
            out.println(accreditation2);
			out.println(accreditation3);
			out.println(accreditation4);
			out.println(accreditation5);
			out.println(accreditation6);
			out.println(accreditation7);
			out.println(accreditation8);
			out.println(accreditation9);
			out.println(accreditation10);
			out.println(accreditation11);
			out.println(accreditation12);
			out.println(accreditation13);
			out.println(accreditation14);
			out.println(accreditation15);
			out.println(accreditation16);
			out.println(accreditation17);
			out.println(accreditation18);
			out.println(accreditation19);
			out.println(accreditation20);
			out.println(accreditation21);
			out.println(accreditation22);
			out.println(accreditation23);
			out.println(accreditation24);
			out.println(accreditation25);
			out.println(accreditation26);
			out.println(accreditation27);
			out.println(accreditation28);
			out.println(accreditation29);
			out.println(accreditation30);
			out.println(accreditation31);
			
			
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
          <li><a href="rules.jsp">Rules</a></li>
          <li><a href="aboutus.jsp">About Us</a></li>
          <li><strong>Accreditation</strong></li>
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
