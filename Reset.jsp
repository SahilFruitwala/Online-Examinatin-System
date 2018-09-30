<%@ page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	String eno=request.getParameter("f1");
	String ans=request.getParameter("f3");
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	response.setContentType("text/html");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
	ps=con.prepareStatement("select Ver_Ans from student where Enrollment_No=?");
	ps.setString(1, eno);
	rs=ps.executeQuery();
	if(rs.next())
	{
		if(rs.getString(1).equals(ans))
		{
			out.print("<html><head><link rel='stylesheet' type='text/css' href='Login.css'><link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Arvo'><title>ONLINE EXAMINATION SYSTEM</title><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><center><div class='set2'><br><br><img src='avtar.png' alt='Avatar ' style='max-width:30% ; border-radius:50%'><br><br>New Password<br><br><form method='post' action='ChangePassword.jsp'><table cellpadding='0'><tr><td style='font-size:13px'>Enrollment_No</td></tr><tr><td ><input type='text' value='"+eno +"' id='password' name='t1' ></input><br/></td></tr><tr><td style='font-size:13px'>Enter New Password</td></tr><tr><td ><input type='password' placeholder='Confirm Password' id='password' name='t2' ></input><br/></td></tr><tr><td><input type='submit' name='submit' id='button1' value='Change Password'></input></td></tr></table></form></br></br></br></div></center></body></html>");
		}
		else
		{	out.print("<h1 style='color: red'>Wrong Answer!</h1>");
			%>
			<jsp:include page="Login.html" />
		<%}
	}%>