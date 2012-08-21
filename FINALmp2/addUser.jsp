<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%@ page import="nl.captcha.Captcha"%>
<jsp:useBean id="mbm" class="memberBean.member" scope="session"/>
<jsp:setProperty name="mbm" property="*"/>

 
<html>
	<head><title>Add User</title>
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
<%!
private static String algorithm = "DESede";
        private static Key key = null;
        private static Cipher cipher = null;
 private static byte[] encrypt(String input)throws Exception {
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] inputBytes = input.getBytes();
            return cipher.doFinal(inputBytes);
        }
%>
<%!
        private static String decrypt(byte[] encryptionBytes)throws Exception {
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
            String recovered =  new String(recoveredBytes);
            return recovered;
          }
          %>

<%
			String strFirstName = null;
			String strLastName = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time sqlDate2 = new java.sql.Time(new java.util.Date().getTime());
			
			String strActivity = "Registered New Player";
				
			try {
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			request.setCharacterEncoding("UTF-8");
			String answer = request.getParameter("answer");
					
			if (captcha.isCorrect(answer)) { 
			
			String strEmail = mbm.getEmail();
				strFirstName = mbm.getFirstname();
				strLastName = mbm.getLastname();
			String strPassword = mbm.getPassword(); 
			String strAddress = mbm.getAddress();
			int iAge = mbm.getAge();
			long lCell = mbm.getCpNum();
			int iPhone = mbm.getPhone();
            StringBuffer buffer=new StringBuffer();
            key = KeyGenerator.getInstance(algorithm).generateKey();
            cipher = Cipher.getInstance(algorithm);
            String input = strPassword;
            System.out.println("Entered: " + input);
            byte[] encryptionBytes = encrypt(input);
            String passw=new String(encryptionBytes);
			
				
				System.out.println("player email: " + strEmail);
				System.out.println("player first name: " + strFirstName);
				System.out.println("player last name: " + strLastName);
				System.out.println("player password: " + strPassword);
				System.out.println("player address: " + strAddress);
				System.out.println("player age: " + iAge);
				System.out.println("player cellphone: " + lCell);
				System.out.println("player homephone: " + iPhone);
								
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
       
        String query = "insert into Member(Email, LastName, FirstName, Password, Address, Age, Cell, Home) values(?,?,?,?,?,?,?,?)";
        
        pstmt = conn.prepareStatement(query); 
        pstmt.setString(1, strEmail); 
        pstmt.setString(2, strLastName); 
        pstmt.setString(3, strFirstName); 
        pstmt.setString(4, passw); 
        pstmt.setString(5, strAddress); 
		pstmt.setInt(6, iAge);
		pstmt.setLong(7, lCell);
		pstmt.setInt(8, iPhone);
        pstmt.executeUpdate(); 
		
		
				String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
				 pstmt = conn.prepareStatement(query1);
				 pstmt.setDate(1, sqlDate);
				 pstmt.setTime(2, sqlDate2);
				 pstmt.setString(3, strEmail);
				 pstmt.setString(4, strActivity);
				 pstmt.executeUpdate();
			} else { %>
			
				<jsp:forward page="captchaerror.jsp"/>
			
		<% } 
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
			   <center><h4><%=strLastName%>&nbsp;<%=strFirstName%>
			   <br/>
			   <br/>
			   Your Registration was Succesful!</h4></center>
			   <br/>
               <center><h2><a href="userlogin.jsp">Click here To LogIn</a></h2></center>
			
			</div>
			</div>
       
        </div>
        
        <hr class="hidden" />
      </div>
      <hr class="hidden noprint" />
      <div id="menu">
        <ul id="mainMenu">
        </ul>
        <ul id="subMenu">
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