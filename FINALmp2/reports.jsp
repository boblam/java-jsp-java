<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>	



<html>
<head></head>
<body>

	
<%
	Connection conn = null;     
 java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());	
			 
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
		Statement pstmt = conn.createStatement();
		Statement xstmt = conn.createStatement();
			
			  ResultSet rs = stmt.executeQuery("Select SUM(cost) as X from Bet");
			  ResultSet prs = pstmt.executeQuery("Select Num1, Num2, Num3, Num4, Num5, Num6, date from WinComb where date = '" + sqlDate + "'");
			  ResultSet xrs = xstmt.executeQuery("Select Email, date, WinBy, prize from WinPlayer");
			  int iCtr = 0;
			  int lCtr = 0;
			  int xCtr = 0;
		  	 %>
			<h1> REPORTS as of <%=sqlDate %> </h1>
			<p><b>INCOME:</b></p>
  			<% while (rs.next()) { 
				iCtr++; 
				%>
			<tr><ul>
				<li> PHP <%= rs.getInt("X") %>.00</p>
			</tr></ul>

		 <% } %>
			<td><b>WINNERS:</b></td>
			
		<%	while (xrs.next()){
				lCtr++; %>
			<tr><ul>
				<li><td>Date Won: <%= xrs.getDate("date") %> </td>
				<li><td>Email: <%= xrs.getString("Email") %> </td>
				<li><td>Win By: <%= xrs.getInt("WinBy") %> Digits </td>
				<li><td>Prize: PHP <%= xrs.getInt("prize") %>.00 </td>
			</tr></ul>

		<%	} %>
			<p><b>WINNING NUMBERS: </b></p>
		<% while(prs.next()) {  %>
			<tr><ul>
				<li><td><%= prs.getInt("Num1") %>-<%= prs.getInt("Num2") %>-<%= prs.getInt("Num3") %>-<%= prs.getInt("Num4") %>-<%= prs.getInt("Num5") %>-<%= prs.getInt("Num6") %></td>
			</tr></ul>	
		<%	}
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
      }	%>
</body>
</html>