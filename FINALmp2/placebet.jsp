<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%
  
  String username=
  (String) application.getAttribute("pangalan");
  if(username==null) {
    username="";
  }
  
  %>

<html>
  <head>
    <title>Place Your Bet</title>
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
<script language = "javascript">

	function validateForm() {
	var msg = "";

	var randone=document.forms["bet"]["num1"].value;
	var randtwo=document.forms["bet"]["num2"].value;
	var randthree=document.forms["bet"]["num3"].value;
	var randfour=document.forms["bet"]["num4"].value;
	var randfive=document.forms["bet"]["num5"].value;
	var randsix=document.forms["bet"]["num6"].value;

	if (randone == "" || randtwo == "" || randthree == "" || randfour == "" || randfive == "" || randsix == "") 
	{
	msg += "Please supply all 6 fields.\n";
	}
	
	if (randone == randtwo || randtwo == randthree || randthree == randfour || randfive == randix || randone == randthree || randone == randfour || randone == randfive || randone == randsix || randtwo == randfour || randtwo == randfive || randtwo == randsix || randthree == randfive || randthree == randsix || randfour == randsix) 
	{
	msg += "You have entered duplicate digits.\n";
	}
	
	
	
	if (msg != "")
	{
		alert(msg);
		return false;
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
alertsay = "Please enter only these values \""
alertsay = alertsay + "numbers from 1-55" + "\" in the \"" + checkStr.name + "\" field."
alert(alertsay);
return (false);
}
var chkVal = allNum;
var prsVal = parseInt(allNum);
if (chkVal != "" && !(prsVal >= 1 && prsVal <= 55))
{
alertsay = "Please enter a value greater than or "
alertsay = alertsay + "equal to \"" + 1 + "\" and less than or "
alertsay = alertsay + "equal to \"" + 51 + "\" in the \"" + checkStr.name + "\" field."
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
  { 
  
  %>
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
          <center><h2 class="subheader biggest">Welcome! <%=myCookie.getValue()%> </h2></center>
          
          <div class="item first">
		  <h3 class="subheader"><a href="">Game Rules</a></h3>
            <div class="in">
            <p>1.You can give 6 number combinations.</p>
			<p>2.You are only allowed to play this game within 5 minutes.</p>
			<p>3.You can only play anytime of the Day.</p>
			<p>3.You can use the LUCKY PICK to generate automatically the six winning numbers.</p>
			</div>
			</div>
			<div class="item first">
		    <h3 class="subheader"><a href="">Instructions</a></h3>
            <div class="in">
            <p>1.You can only input numbers ranging from 1 up to 55.</p>
			<p>2.You can't input any characters aside from numbers.</p>
			</div>
			</div>
			<div class="item first">
		    <h3 class="subheader"><a href="">Winning Amount</a></h3>
            <div class="in">
            <p>3 numbers: 20.00PHP</p>
			 <p>4 numbers: 500.00PHP</p>
			 <p>5 numbers: 20,000.00PHP</p>
			 <p>6 numbers(JACKPOT): 100,000,000.00PHP</p>
			</div>
			</div>
			<div class="item first">
		    <h3 class="subheader"><a href="">Place Your Bet</a></h3>
            <div class="in">
            <p>
			<form method="POST" name="bet" action="addnum.jsp" onsubmit="return validateForm()">
			<p><h6>Pick 1:
				<input type="text" name="num1" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');">
            Pick 2:
			<input type="text" name="num2" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');">
			 Pick 3:
			<input type="text" name="num3" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');"></h6></p>
			<p><h6> Pick 4:
			<input type="text" name="num4" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');">
			 Pick 5:
			<input type="text" name="num5" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');">
			 Pick 6:
			<input type="text" name="num6" size="5" maxlength="2" onBlur="checkNumeric(this,-5,5000,',','.','-');"></h6></p>
			<input type="Submit" value="Submit" onClick="validateForm()">
			<h6>Do You Like To try Our Lucky Pick?</h6><a href="luckypick.jsp"><h6>Click ME Now!</h6></a>
			</form>
			</div>
			</div>
			<div class="item first">
		  <h3 class="subheader"><a href="">Your Bets</a></h3>
            <div class="in"><div id="yzza">
			 <table border="1"> 
			 <thead>
			<th>Date</th>
			 <th>Pick 1</th>
			 <th>Pick 2</th>
			 <th>Pick 3</th>
			 <th>Pick 4</th>
			 <th>Pick 5</th>
			 <th>Pick 6</th>

			 </thead>
               
               <%
			 Connection conn = null;  
							 
			 
       try {								
        Properties property = null;

		String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
        FileInputStream fis = new FileInputStream(propFile) ;
        property = new Properties();
        property.load(fis);
            
        // getting file name from properties
        String name = property.getProperty("username");
        String password = property.getProperty("password");
        String server = property.getProperty("servername");
        String typedriver = property.getProperty("typedriver");
        String dbName = property.getProperty("databasename");   
                       				  
        System.out.println("name: " + name);          
			  System.out.println("password: " + password);
        System.out.println("server: " + server);
        System.out.println("typedriver: " + typedriver);
        System.out.println("dbName: " + dbName);
            
        //db setup and connection
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = (Connection) application.getAttribute("connection");
		
       
        //get result set for employee
        Statement stmt = conn.createStatement();
			  ResultSet rs = stmt.executeQuery("Select * FROM Bet where Email ='"+ username  + "'");
			  int iCtr = 0;
		  	  			       
  			while (rs.next()) { 
  			  iCtr++; 
          System.out.println(rs.getString("Email"));
        %>
  			 
  			      
          <tbody>
            <tr>
			  <td><%= rs.getDate(9) %></td>
              <td><%= rs.getInt(3)%></td>
              <td><%= rs.getInt(4)%></td>
              <td><%= rs.getInt(5)%></td>
			  <td><%= rs.getInt(6)%></td>
              <td><%= rs.getInt(7) %></td>
			  <td><%= rs.getInt(8) %></td>
			  
			  
            </tr> 
		</tbody>			
    <% } 	%></table><%			
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage());  	
    	}	catch (Exception e) {				
  				System.out.println(e.getMessage());			  								
			}	finally {
			   if (conn!=null) {
			     application.setAttribute("connection",conn);
         }
      }					
		%>		  
          </div>
        </div></div>
      </div>

        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
		  <li><strong>Place Bet</strong></li>
        </ul>
        <ul id="subMenu">
          <li><a href="logout.jsp"><strong>LogOut<strong></li></a>
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

<% } else { %>
<meta http-equiv = "refresh" content = "0;url=userlogin.jsp"/>
<% } %>
