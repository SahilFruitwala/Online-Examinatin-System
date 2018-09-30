<%@ page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	out.print("<html><head><link rel='stylesheet' type='text/css' href='Login.css'><link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Arvo'><title>ONLINE EXAMINATION SYSTEM</title><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body>");
	if(session.getAttribute("id")==null)
	{
		out.println("<center><h1 style='color:red'>Login First</h1><center>");
	}
	else
	{
		String que=request.getParameter("t1");
		String o1=request.getParameter("t2");
		String o2=request.getParameter("t3");
		String o3=request.getParameter("t4");
		String ans=request.getParameter("t5");
		Class.forName("com.mysql.jdbc.Driver");
		PreparedStatement ps;
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select count(*) from Question");
		rs.next();
		int n=rs.getInt(1);
		out.print(n);
		String query="insert into Question values("+(n+1)+",'"+que+"','"+o1+"','"+o2+"','"+o3+"','"+ans+"')";
		st.executeUpdate(query);
		out.println("<center><h1 style='color:red'>Question Is Inserted!</h1><center>");%>
		<jsp:include page="Admin_Work.jsp" />
	<%}
%>