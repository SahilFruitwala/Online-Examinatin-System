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
		try
		{
		String eno=request.getParameter("t1");
		String work=request.getParameter("del_lock");
		Class.forName("com.mysql.jdbc.Driver");
		PreparedStatement ps;
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
		if(work.equalsIgnoreCase("Delete Account"))
		{
			ps=con.prepareStatement("delete from student where Enrollment_No=?");
			ps.setString(1, eno);
			ps.executeUpdate();
			ps.close();
			con.close();
			out.println("<center><h1 style='color:red'>Student Is Deleted!</h1><center>");%>
			<jsp:include page="Admin_Work.jsp" />
		<%}
		else if(work.equalsIgnoreCase("Lock Account"))
		{
			ps=con.prepareStatement("update student SET Lock_account=? where Enrollment_No=?");
			ps.setInt(1, 1);
			ps.setString(2,eno);
			ps.executeUpdate();
			ps.close();
			con.close();
			out.println("<center><h1 style='color:red'>Student Data Is Locked!</h1><center>");%>
			<jsp:include page="Admin_Work.jsp" />
	  <%}
		else
		{
			ps=con.prepareStatement("update student SET Lock_account=? where Enrollment_No=?");
			ps.setInt(1, 0);
			ps.setString(2,eno);
			ps.executeUpdate();
			ps.close();
			con.close();
			out.println("<center><h1 style='color:red'>Student Data Is Unlocked!</h1><center>");%>
			<jsp:include page="Admin_Work.jsp" />
	  <%}
	}catch(Exception e)
	{
		out.print(e);
	}
	}
%>