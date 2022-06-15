package com.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="comment",uniqueConstraints = {
		@UniqueConstraint(columnNames = {"usersId","videoId"})
		
})
public class Comment {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String text;
	
	
	@ManyToOne @JoinColumn(name="usersId")
	private User userComment;
	

	@ManyToOne @JoinColumn(name="videoId")
	private Video videoComment;
	
	@Temporal(TemporalType.DATE) @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm a z")
	private Date dateComment;
	
	public Comment() {
		
	}

	
	public Date getDateComment() {
		return dateComment;
	}


	public void setDateComment(Date dateComment) {
		this.dateComment = dateComment;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public User getUserComment() {
		return userComment;
	}


	public void setUserComment(User userComment) {
		this.userComment = userComment;
	}


	public Video getVideoComment() {
		return videoComment;
	}


	public void setVideoComment(Video videoComment) {
		this.videoComment = videoComment;
	}





	
	
	
}
