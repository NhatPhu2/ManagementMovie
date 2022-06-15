package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.UserDao;
import com.model.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		User user = new User();
		Map<String, String> messages = new HashMap<String, String>();
		user.setRoles(false);
		String rePass = request.getParameter("re-pass");
		try {
			BeanUtils.populate(user,request.getParameterMap());
			boolean checkAccount = userDao.findById(user.getId().trim())!=null?true:false;
			if(checkAccount == true) {
				messages.put("account","Account is exist");
				request.setAttribute("messageError",messages);
			}else if(user.getFullName().trim().isEmpty()) {
				messages.put("fullname","Please enter your fullName");
				request.setAttribute("messageError",messages);
			}else if(user.getPasswords().trim().isEmpty()) {
				messages.put("password","Please enter password");
				request.setAttribute("messageError",messages);
			}else if(!user.getPasswords().trim().equals(rePass)) {
				messages.put("repassword","Your password is not match");
				request.setAttribute("messageError",messages);
			}else if(user.getEmail().trim().isEmpty()) {
				messages.put("repassword","Your password is not match");
				request.setAttribute("messageError",messages);
			}else {
				userDao.insert(user);
				response.sendRedirect("/assignment/Login");
				return;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("acc", user.getId());
		request.setAttribute("full", user.getFullName());
		request.setAttribute("pass",user.getPasswords());
		request.setAttribute("ema", user.getEmail());
		request.setAttribute("rep", rePass);
		request.getRequestDispatcher("/view/register.jsp").forward(request, response);
	}

}
