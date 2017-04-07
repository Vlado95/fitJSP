<%@page import="jpa.JPAAuteur, javax.*"%>
<%@page import="metier.Auteur"%>
<%@page import="factory.FactoryDao.typeDao"%>
<%@page import="dao.IDao"%>
<%@page import="factory.FactoryDao"%>
<%@page import="dao.DaoAuteur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FITEC - J2EE - JSP - sql:query</title>
</head>
<body>
	<%
		long debut = System.currentTimeMillis();
		System.out.println(System.currentTimeMillis());
		//IDao<Auteur> daoAuteur = (IDao<Auteur>) FactoryDao.getDAO("Auteur", typeDao.JDBC);
		IDao<Auteur> daoAuteur = (IDao<Auteur>)FactoryDao.getDAO("Auteur", typeDao.JPA);
		List<Auteur> auteurList = new ArrayList<>();
		auteurList = daoAuteur.selectAll();
		//request.setAttribute("auteurList", auteurList);

		long fin = System.currentTimeMillis();
		long delta = fin-debut ;
		out.println(" Temps de chagement: " + delta);
	%>
	<%--     <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"   --%>
	<%--          url="jdbc:mysql://localhost:3306/fitec"   --%>
	<%--          user="java1"  password="java1"/>   --%>

	<%--     <sql:query dataSource="${db}" var="rs">   --%>
	<!--     SELECT * from auteur;   -->
	<%--     </sql:query>   --%>
	<c:set var="auteurList" value="<%=auteurList%>" scope="page" />

	<table style="width: 60%">
		<tr>
			<th style="width: 10%; text-align: left;">Auteur ID</th>
			<th style="width: 25%; text-align: center;">Auteur Nom</th>
			<th style="width: 25%; text-align: center;">Auteur Prénom</th>
		</tr>
		<c:forEach var="auteur" items="${auteurList}">
			<tr>
				<td style="width: 10%"><c:out value="${auteur.id}" /></td>
				<td style="width: 25%; text-align: center;"><c:out
						value="${auteur.getNom()}" /></td>
				<td style="width: 25%; text-align: center;"><c:out
						value="${auteur.prenom}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
