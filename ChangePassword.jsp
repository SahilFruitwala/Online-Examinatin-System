<%@page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	String eno=request.getParameter("t1");
	String pass=request.getParameter("t2");
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	response.setContentType("text/html");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
	ps=con.prepareStatement("Update student SET Password=? where Enrollment_No=?");
	ps.setString(1,pass);
	ps.setString(2,eno);
	ps.executeUpdate();
	out.print("<h1 style='color:Red;' align='center'>Password Changed!</h1>");
%>
<jsp:include page="Login.html" />