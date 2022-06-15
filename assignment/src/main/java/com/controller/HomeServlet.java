package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.FavoriteDao;
import com.dao.GenreDao;
import com.dao.UserDao;
import com.dao.VideoDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.Favorite;
import com.model.Genre;
import com.model.User;
import com.model.Video;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/HomeServlet","/Home/detailVideo","/Home/likeVideo","/Home/loadStatus","/Home/checkStatus","/Home/unLikeVideo"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		VideoDao videoDao = new VideoDao();
		GenreDao genreDao = new GenreDao();
		
		String genre = request.getParameter("genre");
		if(genre==null)
			genre = "";
		
		List<Video> videos = videoDao.findByGenre(genre);
		
		//return list genre have video
		List<Genre> genresByVideo = genreDao.selectByVideo(genre);
		//return all video 
		request.setAttribute("videos",videos);
		
		//return all genres
		request.setAttribute("genres",genreDao.selectAll());
		
		request.setAttribute("genresByVideo",genresByVideo);
		//random list video
		Collections.shuffle(videos);
		
		request.setAttribute("trailer", videos);

		if(url.contains("loadStatus")) {
		statusVideo(request, response);
		return;
		}
		request.getRequestDispatcher("/view/home.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = request.getRequestURI();
		if(url.contains("detailVideo")) {
			detailVideo(request, response);
		}else if(url.contains("checkStatus")) {
			checkStatus(request, response);
		}
		else if(url.contains("likeVideo")) {
			likeVideo(request, response);
		}else if(url.contains("unLikeVideo")) {
			unLikeVideo(request, response);
		}
		
	}
	
	protected void detailVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		//convert video object asString json
		/*
		 * [{
		 * idVideo:
		 * title:
		 * poster:
		 * viewss:
		 * descriptions:
		 * active:
		 * genre:
		 * fv:
		 * share:
		 * 
		 *
		 * director:
		 * actor:
		 * }]
		 * 
		 */
		String idVd = request.getParameter("idVideo");
		ObjectMapper Obj = new ObjectMapper();
		User user = (User) request.getSession().getAttribute("user");
		String idUser  = user.getId(); 
		
		
		List<Video> listFavoriteOfUser = videoDao.favoriteOfUser(idUser);
		String fv = Obj.writeValueAsString(listFavoriteOfUser);
		String videoById = Obj.writeValueAsString(videoDao.findById(idVd));
		//Creating Object of ObjectMapper define in Jackson
		
		
		String bothJson = "["+videoById+","+fv+"]";
		
		//return value in response ajax success
		PrintWriter out = response.getWriter();
		out.print(bothJson);
		out.flush();
		out.close();
	}
	
	protected void statusVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		// Getting Video object as a json string
		User user = (User) request.getSession().getAttribute("user");
		String idUser = user.getId(); 

		List<Video> list = videoDao.favoriteOfUser(idUser);
		//Creating Object of ObjectMapper define in Jackson
		ObjectMapper obj = new ObjectMapper();
		//return a list object Video to response ajax success
		String likedVideoOfUser = obj.writeValueAsString(list);
		PrintWriter out = response.getWriter();
		out.print(likedVideoOfUser);
		out.flush();
		out.close();
	}
	
	
	protected void likeVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDao fvDao = new FavoriteDao();
		Favorite fv = new Favorite();
		
		VideoDao videoDao = new VideoDao();
		//get id user from session
		User user = (User) request.getSession().getAttribute("user");
		String idVideo = request.getParameter("idVideo");
		
		fv.setUser(user);
		fv.setVideo(videoDao.findById(idVideo));
		fv.setLikeDate(new Date());
	
			//insert to DB
		fvDao.insert(fv);
	}
	
	protected void unLikeVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDao fvDao = new FavoriteDao();
		String idVideo = request.getParameter("idVideo") ;
		User user = (User) request.getSession().getAttribute("user");
		
		Integer favoriteId = fvDao.checkVideoUserLikedOrUnlike(user.getId(),idVideo).getId();
		fvDao.delete(favoriteId);
		
	}
	
	protected void checkStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		// Getting Video object as a json string
		User user = (User) request.getSession().getAttribute("user");
		String idUser = user.getId(); 
		
		String idVideo = request.getParameter("idVideo");

		Video video = videoDao.checkVideoUserLikedOrUnlike(idUser,idVideo);
		//Creating Object of ObjectMapper define in Jackson
		ObjectMapper obj = new ObjectMapper();
		//return a list object Video to response ajax success
		String likedVideoOfUser = obj.writeValueAsString(video);
		PrintWriter out = response.getWriter();
		out.print(likedVideoOfUser);
		out.flush();
		out.close();
	}
	
	
}
