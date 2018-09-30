<%@ page import="java.sql.*,java.util.*" %>
<%@ page errorPage="ErrorPage.jsp" %>  

<%!
	Map<String,Integer> map=new HashMap<String,Integer>();
%>

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
		<jsp:include page="Login.html" />
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
	<%}
	else
	{
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
			ps=con.prepareStatement("select * from student where Enrollment_No=?");
			ps.setString(1, eno);
			rs=ps.executeQuery();
			if(!rs.next())
			{
				out.print("<h1 style='color:Red;'>Enter Valid Enrollment No!</h1>");%>
					<jsp:include page="Login.html" />
			<%}
			else
			{
				ps=con.prepareStatement("select * from student where Enrollment_No=?");
				ps.setString(1, eno);
				rs=ps.executeQuery();
				rs.next();
				if(rs.getInt(5)==0)
				{
				String temp=rs.getString(4);
				if(temp.equals(pass1))
				{
					session.setAttribute("eno",eno);
					response.sendRedirect("Pre_Question.jsp");
				}
				else
				{
					out.print("<h1 style='color:Red;' align='center'>Enter Valid Password!</h1>");
					if(map.isEmpty())
					{
						// out.print("IS Empty<br>");
						map.put(eno,1);
					}
					else
					{
						int temp1=0;
						try{
							temp1=(Integer)map.get(eno);
						}catch(Exception e){}
						if(temp1==0)
						{
							// out.print("In IF<br>");
							map.put(eno,1);
						}
						else
						{
							int t=(Integer)map.get(eno);
							// out.print("In Else<br>");
							map.put(eno,(t+1));
							if(t==2)
							{
								// out.print("In IF Lock_Account<br>");
								ps=con.prepareStatement("Update student SET Lock_Account=? where Enrollment_No=?");
								ps.setInt(1, 1);
								ps.setString(2, eno);
								ps.executeUpdate();
								out.print("<h1 style='color:Red;'>Your Account Is Locked</h1>");%>
								
								<jsp:include page="Login.html" />
							<%}
						}
					}
					// out.print("<h1 style='color:Red;'>Count : "+map.get(eno)+"</h1>");
					%>
					<jsp:include page="Login.html" />
				<%}
				}
				else
				{
					out.print("<h1 style='color:Red;'>Your Account Is Blocked! Please,Contact Admin.</h1>");%>
					<jsp:include page="index.html" />
				<%}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}%>