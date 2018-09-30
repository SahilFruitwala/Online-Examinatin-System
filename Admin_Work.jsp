<%@ page errorPage="ErrorPage.jsp" %>  
<%
	out.print("<html><head><link rel='stylesheet' type='text/css' href='Login.css'><link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Arvo'><title>ONLINE EXAMINATION SYSTEM</title><meta name='viewport' content='width=device-width, initial-scale=1.0'></head><body>");
	if(session.getAttribute("id")==null)
	{
		out.print("<center><h1 style='color:red'>Login First</h1><center>");%>
		<jsp:include page="Admin_Login.html" />
	<%}
	else
	{
		out.print("<center><br><table><tr><td><form method='post' action='index.html'><input type='submit' value='Home' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'/></form><td><form method='post' action='Admin_Logout.jsp'><input type='submit' value='Logout' style='transition: 0.5s;border-radius:25px;width:36vh;height:30px;background:#00c3ff;font-family:Times new Roman;font-size:18px;'/></form></tr></table></center>");
		out.print("<center><div style='position:absolute;box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;top:24%;left:18%;border-radius:10px;background-color:white;'><form method='post' action='Lock_Del_Student.jsp'><br><br><img src='avtar.png' alt='Avatar' style='max-width:30% ; border-radius:50%'><br><br>Delete Student<br><br><table cellpadding='0'><tr><td style='font-size:13px'>Student Enrollment No.</td></tr><tr><td ><input type='text' placeholder='Enter Student Enrollment No'  id='textbox1' name='t1' ></input><br/><br/></td></tr><br><tr ><td><input type='radio' name='del_lock' value='Delete Account' style='width:15px' checked>Delete Account</input></td></tr><tr><td><input type='radio' style='width:15px' name='del_lock' value='Lock Account'/>Lock Account</tr><tr><td><input type='radio' style='width:15px' name='del_lock' value='UnLock Account'/>UnLock Account</tr><tr><td><br><br><input type='submit' name='submit' id='button1' value='Procced'></input></td></tr></table></br></br></br></form></div></center>");
		out.print("<center><div style='position:absolute;box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;width: 50vh;top:24%;left:54%;border-radius:10px;background-color:white;'><br><br>Enter Question<br><br><form method='post' action='Question_Add.jsp'><table cellpadding='0'><tr><td style='font-size:13px'>Enter Question</td></tr><tr><td ><input type='text' placeholder='Enter Question'  id='textbox1' name='t1' ></input><br/><br/></td></tr><tr><td style='font-size:13px'>Enter OptionA</td></tr><tr><td ><input type='text' placeholder='Enter OptionA'  id='textbox1' name='t2' ></input><br/><br/></td></tr><tr><td style='font-size:13px'>Enter OptionB</td></tr><tr><td ><input type='text' placeholder='Enter OptionB'  id='textbox1' name='t3' ></input><br/><br/></td></tr><tr><td style='font-size:13px'>Enter OptionC</td></tr><tr><td ><input type='text' placeholder='Enter OptionC'  id='textbox1' name='t4' ></input><br/><br/></td></tr><tr><td style='font-size:13px'>Enter Answer</td></tr><tr><td ><input type='text' placeholder='Enter Answer(In One Word)' id='password' name='t5' ></input><br/></td></tr><br><tr><td><input type='submit' name='submit' id='button1' value='Submit Data'></input></td></tr></table></form></br></br></br></div></center>");
	}
	out.print("</body></html>");
%>


