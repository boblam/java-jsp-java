<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@ page import="nl.captcha.Captcha"%>

<html>
	<head><title>Validate</title></head>
	
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

<%			
			Connection conn = null;
			ResultSet rsLogin = null;
			PreparedStatement psLogin = null;
			PreparedStatement pstmt = null;
			
			
				
			try {
			
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			request.setCharacterEncoding("UTF-8");
			String answer = request.getParameter("answer");
					
			if (captcha.isCorrect(answer)) { 
			
			String user = request.getParameter("username");
				if(user == null) {
					user="";
				}
    
					Cookie cookie = new Cookie ("user", user);
					cookie.setMaxAge(60 * 5);
					response.addCookie(cookie);
					
					application.setAttribute("pangalan",user);
			
			String pass = request.getParameter("password");
			String msg = "User " + request.getParameter("username") + " has login successfully";
			StringBuffer buffer=new StringBuffer();
            key = KeyGenerator.getInstance(algorithm).generateKey();
            cipher = Cipher.getInstance(algorithm);
            String input = pass;
            System.out.println("Entered: " + input);
            byte[] encryptionBytes = encrypt(input);
            String passw=new String(encryptionBytes);
		
			
		
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
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time sqlDate2 = new java.sql.Time(new java.util.Date().getTime());
			String strActivity = "User Logged In";
			String strActivity2 = "Admin Logged In";
		
		
		if(request.getParameter("username").equals("dtjako@yahoo.com")) {
				
				String query = "Select Username, Password from Admin Where Username = (?) and Password = (?)";
				psLogin = conn.prepareStatement(query);
				psLogin.setString(1, user);
				psLogin.setString(2, pass);
				rsLogin = psLogin.executeQuery();
				
						String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
						pstmt = conn.prepareStatement(query1);
						pstmt.setDate(1, sqlDate);
						pstmt.setTime(2, sqlDate2);
						pstmt.setObject(3, username);
						pstmt.setString(4, strActivity2);
						pstmt.executeUpdate();

				
				if(rsLogin.next()){ %>
					<jsp:forward page = "admin.jsp"/>
				<%}else {
					msg="No user or password matched" ;
					response.sendRedirect("userlogin.jsp?error="+msg);
					}	
		} else {
				
				String query = "Select Email, Password from Member Where Email = (?) and Password = (?)";
				psLogin = conn.prepareStatement(query);
				psLogin.setString(1, user);
				psLogin.setString(2, passw);
				rsLogin = psLogin.executeQuery();
				

				
						String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
						pstmt = conn.prepareStatement(query1);
						pstmt.setDate(1, sqlDate);
						pstmt.setTime(2, sqlDate2);
						pstmt.setObject(3, username);
						pstmt.setString(4, strActivity);
						pstmt.executeUpdate();
	
				if(rsLogin.next()){ %>
					<meta http-equiv = "refresh" content = "0;url=placebet.jsp"/>
				<% }else {
					msg="No user or password matched" ;
					response.sendRedirect("userlogin.jsp?error="+msg);
					}	
				}
				

			 
			} else { %>
					<jsp:forward page="captchaerror1.jsp"/>
	<%	}
	}
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
		
</body>		
</html>