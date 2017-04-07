<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>connexion</title>
</head>
<body>
<%
// request.setAttribute("messages", request.getAttribute("messages"));
%>
<c:if test="${!messages.isEmpty()}">
<a></a>
           <c:forEach items="${messages}" var="mapEntry">
           
           </c:forEach>
  </c:if>
<form action="authentification.jsp" method="post">
  Username:<input type="text" name="username" value="">
  <br>
  Password:  <input type="password" name="password" value="">${password}
  <br><br>
  <input type="submit" value="Submit">
</form> 

</body>
</html>