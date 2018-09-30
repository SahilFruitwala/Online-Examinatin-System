<%@ page errorPage="ErrorPage.jsp" %>  
<%
	if(session.getAttribute("id")==null)
	{
		out.print("<h1 style='color:red;'>You Are Already Logged Out!</h1>");
	}
	else
	{
		session.invalidate();
	}
%>
<%@include file="index.html" %>
		