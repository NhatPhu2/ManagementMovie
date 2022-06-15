package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.model.User;
import com.utils.XForm;

import sharer.RRsharer;
import com.utils.*;


/**
 * Servlet implementation class Login
 */
@WebServlet({"/Login","/logout"})
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		//messgae when got error
		Map<String, String> messages = new HashMap<String, String>();
		String userAccount = request.getParameter("lg-user");
		String password = request.getParameter("lg-pass");
		RRsharer.add(request, response);
		
		String remember = request.getParameter("remember") ;
		
		int hours = (remember==null)?0:24;
		CookieUtils.add("username",userAccount, hours, response);
		CookieUtils.add("password",password, hours, response);
		
		
		if(!XForm.exist(userAccount)) {		//if text user is empty return error
			messages.put("userAccount","Please enter your email or phone number");

		}if(!XForm.exist(password)) {//if text password is empty return error
			messages.put("password","Please enter your password");
		}else {

			User user = userDao.findById(userAccount);
			
			if(user == null) {//if user is not exist return error
				messages.put("userAccount","Your account is not exist or not correct");
			}else if(!user.getPasswords().equals(password)) { //if password not match return error
				messages.put("password","Your password is not correct");
			}else {
				request.getSession().setAttribute("user",user);

				//if is admin open admin page
				if(user.isRoles()) {
					request.getRequestDispatcher("/view/admin/home.jsp").forward(request, response);
					return;
				}else {
					response.sendRedirect("HomeServlet");
					return;
				}
				
			}

		}
		request.setAttribute("messageError",messages);
		request.setAttribute("user", userAccount);
		request.setAttribute("pass", password);
		request.getRequestDispatcher("/view/login.jsp").forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		
		String username = CookieUtils.get("username",request);
		String password = CookieUtils.get("password",request);
		request.setAttribute("user", username);
		request.setAttribute("pass", password);
		if(!username.isEmpty()) {
			request.setAttribute("status", "checked");
		}
		
		//delete session if user logout
		if(url.contains("logout")) {
			request.getSession().invalidate();
		}
		
		HttpSession session = request.getSession(false);
		if(session!=null && session.getAttribute("user")!=null) {
			response.sendRedirect("HomeServlet");
			return;
		}
		
		request.getRequestDispatcher("/view/login.jsp").forward(request, response);
	}
	
}
