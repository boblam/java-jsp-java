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
          <h2 class="subheader biggest">Welcome To Our Store!</h2>
          
          <div class="item first">
            <h3 class="subheader"><a href="">Information About the Game</a></h3>
            <div class="in">
              <p>This is a 6/55 Lottery Game. You can win millions just by placing your six combination numbers as your bet or you can choose to use the lucky pick of the day. What are you waiting for? Play Now!</p>
			  </div>
          </div>
          
          <div class="item first">
            <h3 class="subheader"><a href="">Previous Winning Numbers</a></h3>
            <div class="in"><div id="yzza">
			<table border="1">
            <thead>
            <th>Date</th>
            <th>Pick1</th>
            <th>Pick2</th>
            <th>Pick3</th>
            <th>Pick4</th>
            <th>Pick5</th>
            <th>Pick6</th>
            </thead>			
			<tbody>
			<%
		Connection conn = null;       				
			 
       try {								
        Properties property = null;

		String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/FINALmp2/dbsource.property";
        FileInputStream fis = new FileInputStream(propFile) ;
        property = new Properties();
        property.load(fis);
            
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
            
       
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = DriverManager.getConnection(url, name, password);
		
       

        Statement stmt = conn.createStatement();
			
			  ResultSet rs = stmt.executeQuery("Select TOP 1 Num1, Num2, Num3, Num4, Num5, Num6, date from WinComb Order by date DESC");
			  int iCtr = 0;
		  	  			      
  			while (rs.next()) { 
  			  iCtr++; 
        %>
  			 
            <tr>
			  <td><%= rs.getDate("date")%></td>
              <td><%= rs.getInt("Num1")%></td>
              <td><%= rs.getInt("Num2")%></td>
              <td><%= rs.getInt("Num3")%></td>
              <td><%= rs.getInt("Num4")%></td>
			  <td><%= rs.getInt("Num5")%></td>
              <td><%= rs.getInt("Num6") %></td>
            </tr> 
            			
    <% } 			
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage());  	
    	}	catch (Exception e) {				
  				System.out.println(e.getMessage());			  								
			}	finally {
			   if (conn!=null) {
			     conn.close();
         }
      }					
		%>		
			</tbody></table>	
              </div>
          </div></div>
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
       hitsCount += 0;
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
          <li><a href="rules.jsp">Rules</a></li>
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
