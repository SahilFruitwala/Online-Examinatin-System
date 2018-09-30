<%@ page errorPage="ErrorPage.jsp" %>  
<%
	if(session.getAttribute("eno")==null)
	{
		out.print("<h1 style='color:red;'>You Are Already Logged Out!</h1>");
	}
	else
	{
		session.invalidate();
	}
%>
<%@include file="index.html" %>
	