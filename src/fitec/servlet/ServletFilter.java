package fitec.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class ServletFilter
 */
@WebFilter("/ServletFilter")
public class ServletFilter implements Filter {
	
	private ServletContext context;
    /**
     * Default constructor. 
     */
    public ServletFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//	System.out.println("filter appelé");
//		HttpServletRequest reqIn = (HttpServletRequest) request;
//		HttpServletResponse reqOut = (HttpServletResponse) response;
//		HttpSession session = reqIn.getSession();
//		
//		String sId = null;
//		//String uName = null;
//		String uName = (String) session.getAttribute("uName");
//		String srvp = reqIn.getServletPath();
//		
//		if(uName!= null /*|| srvp.contains("connexion")*/){
//			sId= session.getId();
//			System.out.println("URL ->"+srvp+" User:"+uName+ " Session ID:"+sId);
//			//chain.doFilter(request, response);
//			request.getRequestDispatcher(srvp).forward(request, response);
//			
//		}else{
//			System.out.println("URL ->"+srvp+" User sans session");
//			request.getRequestDispatcher("/connexion").forward(request, response);
//			//reqOut.sendRedirect("/connexion.html");
//		}
//		
//		// pass the request along the filter chain
//		//chain.doFilter(request, response);
//	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("filtre connexion appelé");
		
		 HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse res = (HttpServletResponse) response;
	        HttpSession session = req.getSession(false);
	        String loginURI = req.getContextPath() + "/jsp/connexion.jsp";
	        String authURI = req.getContextPath() + "/jsp/authentification.jsp";

	        boolean loggedIn = session != null && session.getAttribute("user") != null;
	        boolean loginRequest = req.getRequestURI().equals(loginURI);
	        boolean authRequest = req.getRequestURI().equals(authURI);

	        if (loggedIn || loginRequest || authRequest) {
	        	System.out.println("URL OK ->"+req.getRequestURI());
	         	System.out.println("vous etes renvoyé vers la page d'acceuil");
	            chain.doFilter(req, res);
	        
	        } else {
	        	System.out.println("URL ->"+req.getRequestURI());
	        	System.out.println("vous etes renvoyé vers la page de conexion");
	            res.sendRedirect(loginURI);
	        }
		
		
		
//		final HttpServletRequest req = (HttpServletRequest) request;
//		final HttpServletResponse reqOut = (HttpServletResponse) response;
//		final HttpSession session = req.getSession();
//	//	HttpServletRequest reqIn = (HttpServletRequest) request;
////		HttpServletResponse reqOut = (HttpServletResponse) response;
////		HttpSession session = reqIn.getSession();
//		
////		String sId = null;
////		//String uName = null;
////		String uName = (String) session.getAttribute("uName");
//		String srvp = req.getServletPath();
//		System.out.println("filtre Http passé");
//		if (session != null && session.getAttribute("user") != null  || srvp.contains("authentification") ) {
//			System.out.println("filtre user ok");
//		//	session.getAttribute(")
// 		//chain.doFilter(request, response);
//
//			request.getRequestDispatcher(srvp).forward(request, response);
//		} else {
//			System.out.println("filtre non user");
//			System.out.println("Nouvelle session");
//			req.getRequestDispatcher("/jsp/connexion.jsp").forward(request, response);
//		 // reqOut.sendRedirect("/jsp/connexion.jsp");
//		}
			
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("ServletFilter initialized");
	}

}
