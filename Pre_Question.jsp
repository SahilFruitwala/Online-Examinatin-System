<%@ page errorPage="ErrorPage.jsp" %>  
<%
	if(session.getAttribute("eno")==null)
	{
		out.print("<h1 style='color:Red;'>Login First!</h1>");%>
		<jsp:include page="Login.html" />
	<%
	}
	else
	{
		out.print("<html><head>    <link rel='stylesheet' type='text/css' href='Login.css'>    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Arvo'>    <title>ONLINE EXAMINATION SYSTEM</title>    <meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body><center>    <div class='set2'>        <br>        <br>        <img src='avtar.png' alt='Avatar ' style='max-width:30% ; border-radius:50%'>        <br>        <br>        WELCOME        <br>        <br>        <form method='post' action='index.html'>			<table cellpadding='0'>                <tr><td><input type='submit' name='submit' id='button1' value='Home'></input></td></tr>            </table>		</form>		<form method='post' action='Question.jsp'>            <table cellpadding='0'>                <tr><td><input type='submit' name='submit' id='button1' value='Start Exam'></input></td></tr>            </table>        </form>		<form method='post' action='Logout.jsp'>            <table cellpadding='0'>                <tr><td><input type='submit' name='submit' id='button1' value='Logout'></input></td></tr>            </table>        </form>		</br>        </br>        </br>    </div></center></body></html>");
	}
%>