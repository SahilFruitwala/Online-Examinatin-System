<%@ page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	if(session.getAttribute("eno") == null)
	{
		out.print("<h1 style='color:Red' align='center'>Login Or Sign Up First...</h1>");
		%>
		<jsp:include page="index.html" />
	<%}
	else
	{	
		out.print("<html><head><link rel='stylesheet' type='text/css' href='Login.css'><link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Arvo'><title>ONLINE EXAMINATION SYSTEM</title><meta name='viewport' content='width=device-width, initial-scale=1.0'></head>");
		out.print("<h1 style='color:Red' align='center'>Student-ID : "+(String)session.getAttribute("eno")+"</h1>");
		out.print("<body><p align='center' style='font-size:45px;font-weight:bold;'>Solution</p><table border='1' rules='all' align='center' style='font-size:25px;' cellpadding='10' cellspacing='10'><tr><td><label style='font-size:34px;'><b>No.</b></label><td><label style='font-size:34px;'></b>Question</b></label></tr>");
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
		Statement st=con.createStatement();
		rs=st.executeQuery("select count(*) from Question");
		rs.next();
		int n=rs.getInt(1);
		st.close();
		ps=con.prepareStatement("Select Question,Answer from question where No=?");
		for(int i=1;i<=n;i++)
		{
			ps.setInt(1,i);
			rs=ps.executeQuery();
			rs.next();
			out.print("<tr><td><label style='font-size:30px;'>"+ i +"</label></td><td><label style='font-size:30px;'>"+ rs.getString(1) +"</label></tr><tr><td>Ans.</td><td>"+rs.getString(2)+"</tr>");
		}
		out.print("</table><br>
		<center>
			<table cellpadding='10' cellspacing='10'>
				<tr>
					<td>
						<form action='Logout.jsp'><input type='submit' value='Logout' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'></form>
		</center>
		<td>
			<form method='post' action='index.html'><input type='submit' value='Home' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'></form>
		<td>
			</tr>
			</table>
			</center>
			</body>");
	}
%>

</html>