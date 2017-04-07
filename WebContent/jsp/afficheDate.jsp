<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FITEC -J2EE</title>
</head>
<body>
<h1>Heure</h1>
<%
response.setIntHeader("Refresh", 1);
Calendar calendar = GregorianCalendar.getInstance(Locale.FRANCE);
out.println("<p>Il est: <span style=\"color:blue;\">Date: </span>"+new Date() +"</p>");

out.println("<p> Il est: "+calendar.getTime()+"</p>");
out.println("<p> Il est: "+calendar.getTime().getHours()+"h "+calendar.getTime().getMinutes()+"' "+calendar.getTime().getSeconds()+"''</p>");

%>

</body>
</html>