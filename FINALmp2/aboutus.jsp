<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<html>
  <head><title>About Us</title>
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
          <h2 class="subheader biggest">About Us</h2>
          
          <div class="item first">
		  <h3 class="subheader"><a href="">History</a></h3>
            <div class="in">
			<p>
			<%
			Properties property = null;

			String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
			FileInputStream fis = new FileInputStream(propFile) ;
			property = new Properties();
			property.load(fis);
            
			
			String aboutus = property.getProperty("aboutus.history");
			String aboutus1 = property.getProperty("aboutus.history1");
			String aboutus2 = property.getProperty("aboutus.history2");
			String aboutus3 = property.getProperty("aboutus.history3");
			String aboutus4 = property.getProperty("aboutus.history4");   
                       				  
			out.println(aboutus);          
			out.println(aboutus1);
			out.println(aboutus2);
			out.println(aboutus3);
			out.println(aboutus4);
			%>
            </p>
			  </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="">Organization(Partners)</a></h3>
            <div class="in">
                <p> 
				<%

            
			
			String aboutus5 = property.getProperty("aboutus.org");
			String aboutus6 = property.getProperty("aboutus.org1");
			String aboutus7 = property.getProperty("aboutus.org2");
			String aboutus8 = property.getProperty("aboutus.org3");
                       				  
			out.println(aboutus5);          
			out.println(aboutus6);
			out.println(aboutus7);
			out.println(aboutus8);
			%>
				</p>
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
          <li><strong>About Us</strong></li>
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
