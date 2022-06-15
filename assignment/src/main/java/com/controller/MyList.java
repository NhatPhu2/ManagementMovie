package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FavoriteDao;
import com.model.User;

/**
 * Servlet implementation class MyList
 */
@WebServlet({"/MyList","/mylist/removeFavorite"})
public class MyList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDao fvDao = new FavoriteDao();
		User user = (User) request.getSession().getAttribute("user");
		String idUser = user.getId();
		String keyWord = request.getParameter("value-search");
		String url = request.getRequestURI();
		
		if(keyWord==null)
			keyWord = "";
		if(url.contains("removeFavorite")) {
			removeFv(request, response);
		}
		
		request.setAttribute("listFavorite",fvDao.findByKeyWordAUser(keyWord, idUser));
		request.setAttribute("keyword",keyWord);
		request.getRequestDispatcher("/view/myfavorite.jsp").forward(request, response);
	}
	protected void removeFv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDao fvDao = new FavoriteDao();
		Integer idFv = Integer.valueOf(request.getParameter("idFv")) ;
		fvDao.delete(idFv);
	}

}
