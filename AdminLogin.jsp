<%@ page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String id,pass1;
	response.setContentType("text/html");
	id=request.getParameter("t7");
	pass1=request.getParameter("t8");
	if(id.equals(" ") || pass1.equals(" "))
	{
		out.print("<h1 style='color:Red;'>Enter Valid Details!</h1>");%>
        <jsp:include page="index.html" />
	<%}
	else
	{
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
			ps=con.prepareStatement("select * from Admin where Admin_ID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(!rs.next())
			{
				out.print("<h1 style='color:Red;'>Enter Valid Enrollment No!</h1>");
			}
			else
			{
				String temp=rs.getString(3);
				if(temp.equals(pass1))
				{
					session.setAttribute("id",id);
					response.sendRedirect("AdminHome.jsp");
				}
				else
				{
					out.print("<h1 style='color:Red;'>Enter Valid Password!</h1>");%>
					<jsp:include page="index.html" />
				<%}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}%>