package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.UserDao;
import com.model.User;

/**
 * Servlet implementation class Profile
 */
@WebServlet({"/Profile","/profile/save"})
public class Profile extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user");
		
		request.setAttribute("userProfile",user);
		request.getRequestDispatcher("/view/profile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userOld = (User)request.getSession().getAttribute("user");
		User user = new User();
			user.setId(userOld.getId());
			user.setRoles(userOld.isRoles());
		UserDao userDao = new UserDao();
		
		try {
			BeanUtils.populate(user, request.getParameterMap());
			request.getSession().setAttribute("user",user);//set new value user if update
			userDao.update(user);
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/assignment/Profile");
	}

}
