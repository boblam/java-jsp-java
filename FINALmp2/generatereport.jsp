<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>


<%
   response.setContentType("application/pdf");
   Document document = new Document();
   String x = "HELLO WORLD";
   PdfWriter.getInstance(document, response.getOutputStream());
   document.open();
   document.addTitle("Generated Report");
   document.add(new Paragraph("Income"));

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
			
			  ResultSet rs = stmt.executeQuery("Select SUM(cost) as X from Bet");
			  int iCtr = 0;
		  	  			      
  			while (rs.next()) { 
  			  
				int test = rs.getInt("X");
				document.add(Paragraph(test));
          } 			
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
		


   
  
   document.close();
%>