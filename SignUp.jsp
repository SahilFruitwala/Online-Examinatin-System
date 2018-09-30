<%@ page import="java.sql.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String id,sem,name,pass,reco,ans;
	response.setContentType("text/html");
	name=request.getParameter("t3");
	id=request.getParameter("t4");
	sem=request.getParameter("t5");
	pass=request.getParameter("t6");
	reco=request.getParameter("reco");
	ans=request.getParameter("ans");
	if(name.equals("") || id.equals("") || sem.equals("") || pass.equals(""))
	{
		out.print("<h1 style='color:Red;'>Enter Valid Details</h1>");%>
		<jsp:include page="SignUp.html" />
	<%}
	else
	{
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
			ps=con.prepareStatement("Select * from student where Enrollment_No=?");
			ps.setString(1,id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				out.print("<h1 style='color:Red;'>Enrollment No is already Exist!</h1>");%>
				<jsp:include page="SignUp.html" />
			<%}
			else
			{
				ps=con.prepareStatement("insert into student values(?,?,?,?,?,?,?)");
				ps.setString(1,name);
				ps.setString(2,id);
				ps.setInt(3,Integer.parseInt(sem));
				ps.setString(4,pass);
				ps.setInt(5,0);
				ps.setString(6,reco);
				ps.setString(7,ans);
				ps.executeUpdate();
				session.setAttribute("eno",id);
				response.sendRedirect("Pre_Question.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}%>