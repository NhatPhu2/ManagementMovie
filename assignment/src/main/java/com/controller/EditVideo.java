package com.controller;

import static sharer.RRsharer.request;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.GenreDao;
import com.dao.VideoDao;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.model.Video;
import com.utils.XForm;

import sharer.RRsharer;


/**
 * Servlet implementation class AddMovie
 */
@MultipartConfig
@WebServlet({ "/loadVideoAdmin", "/editvideo/next", "/editvideo/previous", "/editvideo/last", "/editvideo/first","/editvideo/insert",
	"/editvideo/update","/editvideo/remove","/editvideo/setValueUpdate" })
public class EditVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//starting position to query
	static int countPage = 0;
	//current page
	static int curentPage = 1;
	
	
	private Video video = new Video();
	static int numberPage = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		GenreDao genreDao = new GenreDao();
		String url = request.getRequestURI();
		float n = Float.valueOf(videoDao.selectAll().size()) / 5;
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

		request.setAttribute("editVideo", videoDao.findPage(countPage));
		//total of page
		request.setAttribute("numberOfPage", numberPage);
		
		request.setAttribute("page", curentPage);
		
		request.setAttribute("genreEdit",genreDao.selectAll());
		
		request.getRequestDispatcher("/view/admin/video.jsp").forward(request, response);
	}
	
	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		GenreDao genreDao = new GenreDao();
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
		float n = Float.valueOf(videoDao.selectAll().size()) / 5;
		numberPage = (int) Math.ceil(n);
		
		request.setAttribute("editVideo", videoDao.findPage(countPage));
		//total of page
		request.setAttribute("numberOfPage", numberPage);
		
		request.setAttribute("page", curentPage);
		
		request.setAttribute("genreEdit",genreDao.selectAll());
		
		request.getRequestDispatcher("/view/admin/video.jsp").forward(request, response);
	}
	
	protected void next(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
	
	protected void last(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		countPage = videoDao.selectAll().size() - 4;
		curentPage = numberPage;
	}
	
	protected void first(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		countPage = 0;
		curentPage = 1;
	}
	
	//insert video to DB
	protected void insertVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		GenreDao genreDao = new GenreDao();
		//get id of genre then findById to set Genre object for Video field
		int idGenre = Integer.parseInt(request.getParameter("genre"));
		video.setGenreVideo(genreDao.findById(idGenre));
		
		//set image filename(ex: netflix.(png,jpg....))
		video.setPoster(XForm.save("poster","/images").getName());
		

		try {
			
			//get value parameter
			BeanUtils.populate(video, request.getParameterMap());
			
			String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
			Pattern compiledPattern = Pattern.compile(pattern);
	        Matcher matcher = compiledPattern.matcher(video.getIdVideo()); //url is youtube url for which you want to extract the id.
	        if (matcher.find()) {
	            video.setIdVideo(matcher.group());
	        }
			
			
			//insert to DB
			videoDao.insert(video);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		
		
	}
	//update video in DB
	protected void updateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		GenreDao genreDao = new GenreDao();
		
		//get id of genre then findById to set Genre object for Video field
		int idGenre = Integer.parseInt(request.getParameter("genre"));
		video.setGenreVideo(genreDao.findById(idGenre));
		
		String currentImg = request.getParameter("hdValueImg");
		File fileImg = XForm.save("poster","/images");
		//if selected an image set new image
		if(fileImg!=null)
		video.setPoster(fileImg.getName());
		else  //if do not choose an image set default image
			video.setPoster(currentImg);
		
		try {
			//get value parameter
			BeanUtils.populate(video, request.getParameterMap());
			videoDao.update(video);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//remove video in DB
	protected void removeVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDao videoDao = new VideoDao();
		String idRemove = request.getParameter("idVideoRemove");
		videoDao.delete(idRemove);
	}
	
	//setForm to update
	protected void setFormValueUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   //get id of Video
			String id = request.getParameter("idVideo");
			VideoDao videoDao = new VideoDao();
			
			//Creating Object of ObjectMapper define in Jackson
			ObjectMapper mapper = new ObjectMapper();
			
			// Getting Video object as a json string
			String video = mapper.writeValueAsString(videoDao.findById(id));
			//return in response ajax success
			PrintWriter out = response.getWriter();
			out.print(video);
			out.flush();
			out.close();
			
	}
	
	

}
