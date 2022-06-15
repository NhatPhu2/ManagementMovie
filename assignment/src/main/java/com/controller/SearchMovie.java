package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.VideoDao;

/**
 * Servlet implementation class SearchMovie
 */
@WebServlet("/SearchMovie")
public class SearchMovie extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		String keyWord = request.getParameter("value-search");
		request.setAttribute("listVideoSearch", videoDao.findByKeyWord(keyWord));
		request.setAttribute("keyword",keyWord);
		if(!keyWord.isEmpty())
		request.getRequestDispatcher("/view/search.jsp").forward(request, response);
		else
		response.sendRedirect("HomeServlet");
	}


}
