<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "IA_Project.WebData.*" %>
<%@page import= "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<%
	
	HttpSession requestSession = request.getSession(false);

	
	User user = (User)requestSession.getAttribute("currentUser");
	System.out.println(user);
	%>
<p>Debug info: your current session ID is ${pageContext.session.id}</p>
	<form action="UpdateUser" method=post>
		<table>
			<tr>
			<td><input type=text name=fname value = <%=user.getName().getfName() %>></td>
			</tr>
			<tr>
			<td><input type=text name=mname value =<%=user.getName().getmName()%>></td>
			</tr>
			<tr>
			<td><input type=text name=lname value =<%=user.getName().getlName()%> ></td>
			</tr>
			<tr>
			<td><input type=text name=email value =<%=user.getEmail()%> ></td>
			</tr>
			<tr>
			<td><input type=text name=phonenumber value =<%=user.getPhonenumber()%> ></td>
			</tr>
			<tr>
			<td><label name=username  ><%=user.getUsername()%></label></td>
			</tr>
			<tr>
			<td><input type=password name="oldpassword">
			</tr>
			<tr>
			<td><input type=password name="newpassword">
			</tr>
			<tr>
			<td><input type=submit value=Update>
			</tr>
			
		</table>
	</form>
</body>
</html>