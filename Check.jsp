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
		Connection con;
		Statement st1,st;
		ResultSet rs,rs1;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
		st=con.createStatement();
		rs=st.executeQuery("select count(*) from Question");
		rs.next();
		int n1=rs.getInt(1);
		String []a=new String[n1];
		String []s=new String[n1];
		String temp,temp1;

		for(int i=1;i<=n1;i++)
		{
			s[(i-1)]=request.getParameter(""+i);
			a[(i-1)]=request.getParameter("O"+i);
			// out.print(i+". "+s[(i-1)]);
			// out.print("<br>Ans. "+a[(i-1)]+"<hr>");
		}
		
		
		int true_a=0;
		for(int i=0;i<n1;i++)
		{
			if(a[i]!=null)
			{
				st1=con.createStatement();
				rs1=st.executeQuery("Select Answer from question where Question='"+s[i]+"'");
				rs1.next();
				if((rs1.getString(1)).equals(a[i]))
				{
					true_a++;
				}
			}
		}
		out.print("<body><div class='set2'><h1 style='color:Red' align='center'>Student-ID : "+(String)session.getAttribute("eno")+"</h1><center><h1 style='color:lightblue;'>Your Score Is : "+ true_a +"</h1><h4 style='color:lightblue;'>Total No. Of Questions : "+n1+"</h4><form action='Answer1.jsp' method='post'><input type='Submit' value='Show Solutions' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'></input></form><form action='Logout.jsp' method='post'><input type='submit' value='Logout' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'></input></form><form method='post' action='index.html'><input type='submit' value='Home' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'></form></center></body></html>");
	}

%>