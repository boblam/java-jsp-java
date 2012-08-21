<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<html>
  <head>
    <title>Main Page</title>
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
          <h2 class="subheader biggest">Welcome Admin!</h2>
          
          <div class="item first">
            <h3 class="subheader"><a href="showlistmembers.jsp">List of Members</a></h3>
            <div class="in">
              </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="showlistcp.jsp">List of Players for the Current Draw</a></h3>
            <div class="in">
                <p></p>
              </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="generatenum.jsp">Draw Winning Numbers</a></h3>
            <div class="in">
			<p> </p>
              </div>
          </div>
		  <div class="item first">
            <h3 class="subheader"><a href="audit.jsp">Audit Trail</a></h3>
            <div class="in">
			<p></p>
              </div>
          </div>
		  <div class="item first">
            <h3 class="subheader"><a href="reports.jsp">Generate Report</a></h3>
            <div class="in">
			<p></p>
              </div>
          </div>
        </div>
        
        <hr class="hidden" />
        <div id="rightBlock">
          <div class="box submenu">
            <h3 class="subheader">Number of Visitors</h3>
            <div class="in">
              <ul>
                <%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* First visit */
       hitsCount = 1;
    }else{
       /* return visit */
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>
<center><li><%= hitsCount%></li></center>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
          <li><strong>Home</strong></li>
        </ul>
        <ul id="subMenu">
          <li><a href="logout.jsp"><strong>Logout</strong></a></li>
        </ul>
      </div>
      <hr class="hidden noprint" />
            <div id="foot">
        <ul class="support">
        </ul>        <ul class="menu">
        </ul>
		<center>
		Copyright &copy; 2012 <a href="#">PCSO LOTTO GAME</a> | 

  </body>
        Designed by <a href="#">TEAM JY</a> |
        Prepared for <a href="#">PROGAP3</a>
		</center>
      </div>

    </div>
</html>
