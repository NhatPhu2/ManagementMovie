package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.GenreDao;
import com.dao.UserDao;
import com.dao.VideoDao;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.User;
import com.utils.XForm;

import sharer.RRsharer;


/**
 * Servlet implementation class EditUser
 */
@WebServlet({ "/loadUser", "/edituser/next", "/edituser/previous", "/edituser/last", "/edituser/first","/edituser/insert",
	"/edituser/update","/edituser/remove","/edituser/setValueUpdate" })
public class EditUser extends HttpServlet {
	// starting position to query
	static int countPage = 0;
	// current page
	static int curentPage = 1;

	private User user = new User();
	static int numberPage = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		String url = request.getRequestURI();
		float n = Float.valueOf(userDao.selectAll().size()) / 5;
		numberPage = (int) Math.ceil(n);

		if (url.contains("next")) {
			next(request, response);
		} else if (url.contains("previous")) {
			previous(request, response);
		} else if (url.contains("last")) {
			last(request, response);
		} else if (url.contains("first")) {
			first(request, response);
		}

		request.setAttribute("editUser", userDao.findPage(countPage));
		// total of page
		request.setAttribute("numberOfPage", numberPage);

		request.setAttribute("page", curentPage);

		request.getRequestDispatcher("/view/admin/user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		RRsharer.add(request, response);

		String url = request.getRequestURI();
		if(url.contains("insert")) {
			insertVideo(request, response);
		}else if(url.contains("update")) {
			updateVideo(request, response);
		}else if(url.contains("remove")) {
			removeVideo(request, response);
		}else if(url.contains("setValueUpdate")) {
			setFormValueUpdate(request, response);
			return;
		}
		float n = Float.valueOf(userDao.selectAll().size()) / 5;
		numberPage = (int) Math.ceil(n);
		
		request.setAttribute("editUser", userDao.findPage(countPage));
		//total of page
		request.setAttribute("numberOfPage", numberPage);
		
		request.setAttribute("page", curentPage);
		
		request.getRequestDispatcher("/view/admin/user.jsp").forward(request, response);

	}

	protected void next(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (curentPage < numberPage) {
			countPage += 5;

			curentPage += 1;
		}
	}

	protected void previous(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (curentPage != 1) {
			countPage -= 5;
			curentPage -= 1;
		}
	}

	protected void last(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		countPage = userDao.selectAll().size() -2 ;// 7 - 5  10 -2  
		curentPage = numberPage;
	}

	protected void first(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		countPage = 0;
		curentPage = 1;
	}
	
	protected void insertVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		try {	
			//get value parameter
			BeanUtils.populate(user, request.getParameterMap());
			//insert to DB
			userDao.insert(user);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	
	}
	//update video in DB
	protected void updateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		try {
			//get value parameter
			BeanUtils.populate(user, request.getParameterMap());
		
			userDao.update(user);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//remove video in DB
	protected void removeVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		String idRemove = request.getParameter("idUser");
		userDao.delete(idRemove);
	}
	
	//setForm to update
	protected void setFormValueUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   //get id of User
			String id = request.getParameter("idUser");
			UserDao userDao = new UserDao();
			
			//Creating Object of ObjectMapper define in Jackson
			ObjectMapper mapper = new ObjectMapper();
			
			// Getting Video object as a json string
			String user= mapper.writeValueAsString(userDao.findById(id));
			//return in response ajax success
			PrintWriter out = response.getWriter();
			out.print(user);
			out.flush();
			out.close();
	}
	
	

}
