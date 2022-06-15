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

@Entity
@Table(name="share")
public class Share {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne @JoinColumn(name="usersid")
	private User userShare;
	
	@ManyToOne @JoinColumn(name="videoid")
	private Video videoShare;
	
	private String email;
	
	@Temporal(TemporalType.DATE)
	private Date shareDate = new Date();
	
	public Share() {
		
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public User getUserShare() {
		return userShare;
	}
	
	public void setUserShare(User userShare) {
		this.userShare = userShare;
	}
	
	public Video getVideoShare() {
		return videoShare;
	}

	public void setVideoShare(Video videoShare) {
		this.videoShare = videoShare;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getShareDate() {
		return shareDate;
	}

	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}
	
	
}
