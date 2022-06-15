package com.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Report {
	@Id
	String videoTitle;
	Long likes;
	Date newest;
	Date oldest;
	public Report() {
		
	}

	public Report(String videoTitle, Long likes, Date newest, Date oldest) {
		this.videoTitle = videoTitle;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}
	public String getvideoTitle() {
		return videoTitle;
	}
	public void setvideoTitle(String group) {
		this.videoTitle = group;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	public Date getNewest() {
		return newest;
	}
	public void setNewest(Date newsest) {
		this.newest = newsest;
	}
	public Date getOldest() {
		return oldest;
	}
	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
	
}
