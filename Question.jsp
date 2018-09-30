<html>
<head>

<%@ page errorPage="ErrorPage.jsp" %>  
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<script>
	document.onkeydown=function()
	{
		switch(event.keyCode)
		{
			case 116:
					event.returnValue=false;
					event.keyCode=0;
					return false;
			case 82:
					if(event.ctrlKey)
					{
						event.returnValue=false;
						event.keyCode=0;
						return false;
					}
		}
	}
	function startTimer(duration, display)
	{
		var timer = duration, minutes, seconds;setInterval(function (){
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);
			minutes = minutes < 10 ? '0' + minutes : minutes;
			seconds = seconds < 10 ? '0' + seconds : seconds;
			display.textContent = minutes + ':' + seconds;
			if (--timer < 0)
			{
				if(minutes < 1 && seconds < 1)
				{
					document.theform.submit();
				}
				else
				{
					timer = duration;
				}
			}
		}, 1000);
		}
		window.onload = function () 
		{
			var Minutes = 60 * 10;
			display = document.querySelector('#time');
			startTimer(Minutes, display);
		}
</script>
</head>

<%!
	int count=1;
%>

<%
	if(session.getAttribute("eno") == null)
	{
		out.print("<h1 style='color:Red' align='center'>Login Or Sign Up First...</h1>");%>
		<%@ include file="index.html" %>
	<%}
	else
	{
		ArrayList<Integer> arr=new ArrayList<Integer>();
		out.print("<html><head><title>ONLINE EXAMINATION SYSTEM</title><meta name='viewport' content='width=device-width, initial-scale=1.0'></head>");
		out.print("<center><h1 style='color:Red' align='center'>Student-ID : "+(String)session.getAttribute("eno")+"</h1></center>");
		out.print("<body style='background:linear-gradient(to right,#00c3ff,#ffff1c);'><center><h1 style='color:orange'>Online Examination</h1></center><center><table><tr><td><td><form action='Logout.jsp'><input type='submit' value='Logout' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;font-family:Times new Roman;font-size:18px;background:#00c3ff;'></form><td><form method='post' action='index.html'><input type='submit' value='Home' style='transition: 0.5s;border-radius:25px;font-family:Times new Roman;font-size:18px;width:36vh;height:30px;background:#00c3ff;'></input></form></tr></table></center><div><h3>Remaining Time : <span id='time'>10:00</h3></span></div><form id='question' action='Check.jsp' name='theform' ><center><table border='1' rules='all' cellpadding='5'><tr><td><p style='font-size:34px'><b>No.</p></b><td><p style='font-size:34px'><b>Question</p></b></tr>");
		Random rand;
		int n;
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		rand=new Random();
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oep","root","root");
		Statement st=con.createStatement();
		rs=st.executeQuery("select count(*) from Question");
		rs.next();
		int n1=rs.getInt(1);
		n=rand.nextInt(n1)+1;
		int i=0,q_no=1;
			while(i<n1)
			{
				while(arr.contains(n))
				{
					n=rand.nextInt(n1)+1;
				}
				i++;
				arr.add(n);
				ps=con.prepareStatement("Select * from question where No=?");
				ps.setInt(1,n);
				rs=ps.executeQuery();
				if(rs.next())
				{
					out.print("<tr><td><center><label style='font-size:30px;'>"+ q_no +"</label></center></td><td><input type='text' size='100' name='"+ q_no +"' value='"+ rs.getString(2) +"' style='background:transparent;border:0px;font-size:30px;font-family:times new roman;' readonly><br><br><input type='radio' name='"+ ("O"+q_no) +"' value='"+ rs.getString(3) +"' ><label style='font-size:22px;'>"+ rs.getString(3) +"</label><br><input type='radio' name='"+ ("O"+q_no) +"' value='"+ rs.getString(4) +"' ><label style='font-size:22px;'>"+ rs.getString(4) +"</label><br><input type='radio' name='"+ ("O"+(q_no++)) +"' value='"+ rs.getString(5) +"' ><label style='font-size:22px;'>"+ rs.getString(5) +"</label><br><br></tr>");
				}
			}
		out.print("</table><center><br><input type='submit' value='Submit Answer' align='cente' style='font-family:Times new Roman;font-size:18px;transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;'></center></form></body></html>");
	}
%>