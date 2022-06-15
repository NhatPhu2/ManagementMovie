package com.model;



import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "video",uniqueConstraints = {
		@UniqueConstraint(columnNames = {"idgenre"})
		
})
public class Video {
	@Id
	private String idVideo;
	private String title;
	private String poster;
	private int viewss;
	private String descriptions;
	private boolean active;
	
	@JsonManagedReference
	@ManyToOne @JoinColumn(name="idgenre")
	private Genre genreVideo;

	@JsonBackReference
	@OneToMany (mappedBy = "video")
	private List<Favorite> fv;
	
	@JsonBackReference
	@OneToMany (mappedBy = "videoShare")
	private List<Share> share;
	
	@JsonIgnore
	@OneToMany(mappedBy = "videoComment")
	private List<Comment> comment;
	
	private String director;
	private String actor;
	
	public Video() {
		
	}
	 
	public Genre getGenreVideo() {
		return genreVideo;
	}

	public void setGenreVideo(Genre genreVideo) {
		this.genreVideo = genreVideo;
	}

	public List<Favorite> getFv() {
		return fv;
	}

	public void setFv(List<Favorite> fv) {
		this.fv = fv;
	}

	public List<Share> getShare() {
		return share;
	}

	public void setShare(List<Share> share) {
		this.share = share;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public String getIdVideo() {
		return idVideo;
	}

	public void setIdVideo(String idVideo) {
		this.idVideo = idVideo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getViewss() {
		return viewss;
	}

	public void setViewss(int viewss) {
		this.viewss = viewss;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}
	
	
}
