package com.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

@WebFilter("/*")
public class Logger implements HttpFilter {
	   private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
	 	        Arrays.asList("","/index.jsp", "/Login", "/view/start.jsp", "/view/register.jsp","/Register")));
	   
	   private static final Set<String> notAllowedPaths = Collections.unmodifiableSet(new HashSet<>(
	 	        Arrays.asList("", "/view/admin/home.jsp", "/view/admin/favorite.jsp", "/view/admin/favoriteUser.jsp","/view/admin/share.jsp",
	 	        		"/view/admin/user.jsp","/view/admin/video.jsp","/view/admin/modaluser.jsp","/view/admin/modalvideo.jsp")));
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession(false);
		String loginURI = req.getContextPath() + "/Login";

	     boolean loggedIn = session != null && session.getAttribute("user") != null;
	     User user = loggedIn?(User)session.getAttribute("user"):null;
	     boolean isAdmin = false;
	     if(user!=null)
	     isAdmin = user.isRoles();
	     
	     String path = req.getRequestURI().substring(req.getContextPath().length()).replaceAll("[/]+$", ""); 
	     
	     boolean allowedPath = ALLOWED_PATHS.contains(path);
	     boolean notAllowedPath = notAllowedPaths.contains(path);

	      
	    	  if (loggedIn || allowedPath) {
	    		  chain.doFilter(req, resp);
	    		  	  if(isAdmin == false && notAllowedPath)
	    		  		resp.sendRedirect(loginURI);
		        } else {
		            resp.sendRedirect(loginURI);
		        }
	       
	}

}
