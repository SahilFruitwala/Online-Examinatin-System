<%@ page import="java.sql.*,java.util.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String eno,pass1;
	response.setContentType("text/html");
	eno=request.getParameter("t1");
	pass1=request.getParameter("t2");
	if(eno.equals("") || pass1.equals(""))
	{
		out.print("<h1 style='color:Red;'>Enter Valid Details!</h1>");%>
		<jsp:include page="Admin_Login.html" />
	<%}
	else if(session.getAttribute("eno")!=null)
	{
		out.print("<h1 style='color:Red;'>You Are Already Login As Student!</h1>");%>
		<jsp:include page="Pre_Question.jsp" />
	<%
	}
	else if(session.getAttribute("id")!=null)
	{
		out.print("<h1 style='color:Red;'>You Are Already Login As Admin!</h1>");%>
		<jsp:include page="Admin_Work.jsp" />
	<%
	}
	else
	{
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
			ps=con.prepareStatement("select * from admin where Admin_ID=?");
			ps.setString(1, eno);
			rs=ps.executeQuery();
			if(!rs.next())
			{
				out.print("<h1 style='color:Red;'>Enter Valid Admin ID!</h1>");%>
					<jsp:include page="Admin_Login.html" />
			<%}
			else
			{
				String temp=rs.getString(3);
				if(temp.equals(pass1))
				{
					session.setAttribute("id",eno);
					response.sendRedirect("Admin_Work.jsp");
				}
				else
				{
					out.print("<h1 style='color:Red;' align='center'>Enter Valid Password!</h1>");
				}
					%>
					<jsp:include page="Admin_Login.html" />
		  <%}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}%>