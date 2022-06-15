package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CommentDao;
import com.dao.VideoDao;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.Comment;
import com.model.User;
import com.model.Video;

/**
 * Servlet implementation class WatchMovie
 */
@WebServlet({"/WatchMovie","/watchMovie/addComment"})
public class WatchMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
      static String saveIdVideo = "";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVideo = request.getParameter("idPlay");
		VideoDao videoDao = new VideoDao();
		String url = request.getRequestURI();
		
		if(idVideo!=null) {
			saveIdVideo = idVideo;
		}
		
		loadComment(request, response);
		
		request.setAttribute("playMovie",videoDao.findById(saveIdVideo).getIdVideo());
		if(url.contains("addComment")) {
		addComment(request, response);
		return;
		}
		
		request.getRequestDispatcher("/view/watch.jsp").forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	//add new comment to DB and return comment object as json string to response ajax success
	protected void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao commentDao = new CommentDao();
		VideoDao videoDao = new VideoDao();
		Comment comment = new Comment();
		
		String textComment = request.getParameter("text");
		User user = (User)request.getSession().getAttribute("user");
		Video video = videoDao.findById(saveIdVideo);
		
		comment.setDateComment(new Date());
		comment.setText(textComment);
		comment.setUserComment(user);
		comment.setVideoComment(video);
		
		commentDao.insert(comment);
		
		ObjectMapper Obj = new ObjectMapper();
		String commentJson = Obj.writeValueAsString(comment);
		PrintWriter out = response.getWriter();
		out.print(commentJson);
		out.flush();
		out.close();
		
	}
	
	protected void loadComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao commentDao = new CommentDao();
		String idVideo = request.getParameter("idPlay");
		request.setAttribute("loadComment",commentDao.selectByVideo(idVideo));
	}

}
