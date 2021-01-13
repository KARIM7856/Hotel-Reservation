<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.Session" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.criterion.Criterion" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<%
request.getSession(false).setAttribute("path", "/hotel_imgs"); 
List<String> images = (List<String>)request.getSession(false).getAttribute("currentImages");
String browserType = request.getHeader("User-Agent");
System.out.println(browserType);
String path="";
if(browserType.contains("Chrome")){
	path="chrome-extension://fpkldibdchnmbdhanpbfpojdlfcblgij/";
}
else{
	path="C:/Users/gkari/javatry/IA_Project/hotel_imgs/";
}
System.out.println("path " + path);
%>
<style type="text/css">
label::before {
    background-image: url(../path/to/unchecked.png);
}
</style>
<body>

<form action = uploadphotos enctype = "multipart/form-data" method=post>
<input type=file multiple name=uploadedimages>
<input type=submit value=upload>
</form>

<form action = deleteimages method=post>
<%
int j=0;
for(String i : images){
	System.out.println(i.substring(i.lastIndexOf("\\")));
	%>
	<input type=checkbox id="selectedimages<%=j %>" name=selectedimages value = <%=i %>>
	<label for=selectedimages<%=j %>><img src="<%=path+i.substring(i.lastIndexOf("\\")+1)%>" height=100 width=100></label>
</div>
	<%
	j++;
}

%>
<input type=submit value=delete>
</form>
</body>
</html>