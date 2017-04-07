<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="factory.FactoryDao.typeDao"%>
<%@page import="factory.FactoryDao"%>
<%@page import="metier.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>authentification</title>
</head>
<body>
	<%
    Map<String, String> messages = new HashMap<String, String>();
		String username = request.getParameter("username");
			String password = request.getParameter("password");
			User user = new User();
			 if (username == null || username.isEmpty()) {
		            messages.put("username", "Please enter username");
		            System.err.println(messages);
		        }

		        if (password == null || password.isEmpty()) {
		            messages.put("password", "Please enter password");
		            System.err.println(messages);
		        }

	        if (messages.isEmpty()) {	
				user.setEmail(username);
				user.setPassword(password);
	        	user = FactoryDao.authenticate(user, typeDao.JPA);

	            if (user != null) {
	                request.getSession().setAttribute("user", user);
	                response.sendRedirect(request.getContextPath() + "/jsp/welcome.jsp");
	                return;
	            } else {
	                messages.put("login", "Unknown login, please try again");
	                response.sendRedirect(request.getContextPath() + "/jsp/connexion.jsp");
	                return;
	            }  
	        }else{
	        request.setAttribute("messages", messages);
	       System.err.println("renvoyé vers la page de connexion from auth");
	        response.sendRedirect(request.getContextPath() + "/jsp/connexion.jsp");
	       //request.getRequestDispatcher("/WEB-INF/jsp/connexion.jsp").forward(request, response);

	        }
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			//try{
// 		     user = FactoryDao.authenticate(user, typeDao.JPA);
// 		        if (user == null) {
// 	 				out.println("<h1><span style=\"color:blue;\">vous etes pas connecté</span></h2>");
// 	 		        response.sendRedirect("connexion.jsp");
// 	 		    //   request.getRequestDispatcher("connexion.jsp").forward(request, response);
		       
// 		        } else {
// 		            session.setAttribute("user", user);
// 	 //				out.println("<h1><span style=\"color:blue;\">Bonjour "+user.getNom()+"</span></h2>");
// 			//		HttpServletResponse reqOut = (HttpServletResponse) response;	          
// 			response.sendRedirect("welcome.jsp");
// 		}

		// "redirect:/jsp/welcome.jsp";
		// 			if (user.getId() == 0) {
		// 				out.println("<h1><span style=\"color:blue;\">vous etes pas connecté</span></h2>");
		// 			} else {
		// 				session.setAttribute("user", user);
		// 				out.println("<h1><span style=\"color:blue;\">Bonjour "+user.getNom()+"</span></h2>");

		// 			}
		//}catch(Exception e) {
		// TODO Auto-generated catch block
		//	e.printStackTrace();
		//}
	%>
</body>
</html>