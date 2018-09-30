<%@page import="java.sql.*"%>
<%@ page errorPage="ErrorPage.jsp" %>  

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Login.css">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Arvo">
		<title>ONLINE EXAMINATION SYSTEM</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<center>
			<div class="set2">
				<br>
				<br>
				<br>
				<br>
				FORGET PASSWORD
				<br>
				<br>
				<form method="post" action="Reset.jsp">
					<table cellpadding="0">
						<%
						String eno=request.getParameter("f1");
						if(eno.equals(""))
						{
							response.sendRedirect("Login.html");
						}
						else
						{
							Connection con;
							PreparedStatement ps;
							ResultSet rs;
							response.setContentType("text/html");
							Class.forName("com.mysql.jdbc.Driver");
							con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
							ps=con.prepareStatement("select Ver_Que,Ver_Ans from student where Enrollment_No=?");
							ps.setString(1, eno);
							rs=ps.executeQuery();
							if(rs.next())
							{%>
						<tr><td style="font-size:13px">Enrollment No</td></tr>
						<tr><td ><input type="text" value="<%=eno%>"  id="textbox1" name="f1" readonly></input><br/><br/></td></tr>
						<tr><td style="font-size:13px">Question</td></tr>
						<tr><td ><input type="text" value="<%=rs.getString(1)%>"  id="textbox1" name="f2" readonly></input><br/><br/></td></tr>
						<tr><td style="font-size:13px">Answer</td></tr>
						<tr><td ><input type="text" placeholder="Enter Answer(Only One Word)"  id="textbox1" name="f3"></input><br/><br/></td></tr>
						<tr><td><input type="submit" id="button1" value="Forgot"></input></td></tr>
						<%}
						}
						%>
					</table>
				</form>
				</br>
				</br>
				</br>
			</div>
		</center>
	</body>
</html>