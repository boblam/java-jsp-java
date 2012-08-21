<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<meta http-equiv = "refresh" content = "0;url=userlogin.jsp"/>
<html>
  <head>
    <title>LogOut</title>
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
          <center><h2 class="subheader biggest">Welcome!</h2></center>
          
          <div class="item first">
		  <h3 class="subheader"><a href="">LogOut</a></h3>
            <div class="in">
				<%			
			Connection conn = null;
			ResultSet rsLogin = null;
			PreparedStatement psLogin = null;
			PreparedStatement pstmt = null;

				
			try { 
		
			
    
				Cookie cookie = new Cookie ("user", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
					
			String pass = request.getParameter("password");
			String user = request.getParameter("username");
			String msg = "User " + request.getParameter("username");
		
		
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
	      //String url = "jdbc:jtds:sqlserver://"+db.getServerName()+":"+db.getPortDB()+"//"+db.getDBName();
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = DriverManager.getConnection(url, name, password);
		
			Object username = application.getAttribute("pangalan");

		
		
		if(username.equals("dtjako@yahoo.com")) {
				
			System.out.println("Admin Logged Out");
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time sqlDate2 = new java.sql.Time(new java.util.Date().getTime());
			String strActivity2 = "Admin Logged Out";
			
			String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query1);
			pstmt.setDate(1, sqlDate);
			pstmt.setTime(2, sqlDate2);
			pstmt.setObject(3, username);
			pstmt.setString(4, strActivity2);
			pstmt.executeUpdate();
			
			response.sendRedirect("index.jsp");

		} else {
			System.out.println("User Logged Out");
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time sqlDate2 = new java.sql.Time(new java.util.Date().getTime());
			String strActivity = "User Logged Out";
			
				
			String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query1);
			pstmt.setDate(1, sqlDate);
			pstmt.setTime(2, sqlDate2);
			pstmt.setObject(3, username);
			pstmt.setString(4, strActivity);
			pstmt.executeUpdate();
			
			
			response.sendRedirect("index.jsp");
						
			
	}}
		catch (IOException ioe) {
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
          </div>
        </div>
        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="subMenu">
          <li><a href="index.jsp"><strong>LogOut<strong></li></a>
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
