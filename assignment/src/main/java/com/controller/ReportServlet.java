package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ReportDao;
import com.dao.ShareDao;
import com.dao.VideoDao;
import com.model.Report;
import com.model.Share;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet({"/ReportServlet","/report/favorite","/report/Title","/report/share"})
public class ReportServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		ReportDao rpDao = new ReportDao();
		VideoDao videoDao = new VideoDao();
		ShareDao shareDao = new ShareDao();
		
		request.setAttribute("listTitleVideo", videoDao.selectAll());
		String titleVideo = request.getParameter("list-title");
		request.setAttribute("currentTitle",titleVideo);
		List<Report> listReportFavorite;
		if(url.contains("favorite")) {
			listReportFavorite = rpDao.reportFavoriteVideo();
			request.setAttribute("listReportFavorite",listReportFavorite);
			request.getRequestDispatcher("/view/admin/favorite.jsp").forward(request, response);
		}else if(url.contains("Title")) {
			listReportFavorite = rpDao.reportFavoriteVideoByTitle(titleVideo);
			
			request.setAttribute("listReportFavorite",listReportFavorite);
			request.getRequestDispatcher("/view/admin/favoriteUser.jsp").forward(request, response);
		}else if(url.contains("/report/share")) {
			List<Share> listShare = shareDao.findByTitle(titleVideo);
			request.setAttribute("listShare",listShare);
			request.getRequestDispatcher("/view/admin/share.jsp").forward(request, response);
		}
		
		
	}
}
