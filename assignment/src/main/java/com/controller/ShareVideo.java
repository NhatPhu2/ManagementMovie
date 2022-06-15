package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ShareDao;
import com.dao.VideoDao;
import com.model.Share;
import com.model.User;

/**
 * Servlet implementation class ShareVideo
 */
@WebServlet("/ShareVideo")
public class ShareVideo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShareDao shareDao = new ShareDao();
		Share share = new Share();
		VideoDao videoDao = new VideoDao();
		//Thong so ket noi
				Properties props = new Properties();
				props.setProperty("mail.smtp.auth","true");
				props.setProperty("mail.smtp.starttls.enable","true");
				props.setProperty("mail.smtp.host","smtp.gmail.com");
				props.setProperty("mail.smtp.port","587");
				props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
				
				//connect smtp server
				Session session = Session.getInstance(props,new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String user = "phusnps19247@fpt.edu.vn";
						String pass = "0399405600";
						return new PasswordAuthentication(user, pass);
					}
				});
				
				User user = (User) request.getSession().getAttribute("user");
				
				
				String emailOfUser = user.getEmail();
				String sendTo = request.getParameter("share-email");
				String idVideo = request.getParameter("idVideoShare");
				
				
				MimeMessage message =  new MimeMessage(session);
				try {
					message.setFrom(new InternetAddress(emailOfUser));
					message.setRecipients(Message.RecipientType.TO,sendTo);
					message.setSubject("Enjoy a great movie with me!! Click the link below to watch now!","UTF-8");
					message.setText("http://localhost:8080/assignment/WatchMovie?idPlay="+idVideo,"UTF-8","html");
					message.setReplyTo(message.getFrom());
					
					Transport.send(message);
					share.setEmail(sendTo);
					share.setShareDate(new Date());
					share.setUserShare(user);
					share.setVideoShare(videoDao.findById(idVideo));
					
					shareDao.insert(share);
				} catch (Exception e) {
					e.printStackTrace();
				}
			
		response.sendRedirect("HomeServlet");
	}

}
