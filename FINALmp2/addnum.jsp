<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="pk" class="betBean.bet" scope="session"/>
<jsp:setProperty name="pk" property="*"/>

<%
  String cookieName = "user";
  Cookie cookies [] = request.getCookies();
  Cookie myCookie = null;
  
  if(cookies !=null) {
     for (int i=0; i < cookies.length; i++) {
      if(cookies[i].getName().equals(cookieName)) {
        myCookie=cookies[i];
        break;
        }
        }
        }
        %>

<%
			Object username = myCookie.getValue();
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			java.sql.Time sqlDate2 = new java.sql.Time(new java.util.Date().getTime());
			
			String strActivity = "Added Bet via PlayerPick";
			
			try {
			
			int iPick1 = Integer.valueOf(request.getParameter("num1"));
			int iPick2 = Integer.valueOf(request.getParameter("num2"));
			int iPick3 = Integer.valueOf(request.getParameter("num3"));
			int iPick4 = Integer.valueOf(request.getParameter("num4"));
			int iPick5 = Integer.valueOf(request.getParameter("num5"));
			int iPick6 = Integer.valueOf(request.getParameter("num6"));
			
			
			
			
			Properties property = null;

			String propFile = "C:/Users/Jako Laureano/Desktop/apache-tomcat-6.0.29/webapps/dbconnection/dbsource.property";
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
			
			System.out.println(iPick1);
			System.out.println(iPick2);
			System.out.println(iPick3);
			System.out.println(iPick4);
			System.out.println(iPick5);
			System.out.println(iPick6);

			System.out.println(sqlDate);
			
			String query = "insert into Bet(Pick1, Pick2, Pick3,Pick4 ,Pick5 ,Pick6, Email, date, status, cost) values (?, ?, ?, ?, ?, ?, ?, ?,'live','20')";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, iPick1);
			pstmt.setInt(2, iPick2);
			pstmt.setInt(3, iPick3);
			pstmt.setInt(4, iPick4);
			pstmt.setInt(5, iPick5);
			pstmt.setInt(6, iPick6);
			pstmt.setObject(7, username);
			pstmt.setDate(8, sqlDate);
			pstmt.executeUpdate();
			
				String query1 = "insert into AuditLog(Date, Time, username, ActivityLog) values (?, ?, ?, ?)";
				 pstmt = conn.prepareStatement(query1);
				 pstmt.setDate(1, sqlDate);
				 pstmt.setTime(2, sqlDate2);
				 pstmt.setObject(3, username);
				 pstmt.setString(4, strActivity);
				 pstmt.executeUpdate();
			
			
			} catch (IOException ioe) {
				System.out.println("IOException occured: " + ioe.getMessage());
			} catch (SQLException sqle) {
				System.out.println("SQLException occured: " + sqle.getMessage());  	
			} catch (Exception e) {				
  				System.out.println(e.getMessage());			  								
			} finally {

			
			   if (conn!=null) {
			     application.setAttribute("connection",conn);
				 response.sendRedirect("placebet.jsp");
				}
				 
			} %>	