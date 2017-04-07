<%@page import="intro.* , java.util.*, java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FITEC - Calcul</title>
</head>
<body>
<%
String debut = request.getParameter("debut");
String fin = request.getParameter("fin");

Long nbrJrs = CalculJours.calculeEcartJours(debut, fin, "yyyy-MM-dd");
out.println(debut+"; "+fin);
out.println("<h1>Ecart en Jours est:<span style=\"color:blue;\">"+nbrJrs+"</span></h2>");
%>
<h1>NOMBRE DE JOURS: <%=nbrJrs%></h1>
</body>
</html>