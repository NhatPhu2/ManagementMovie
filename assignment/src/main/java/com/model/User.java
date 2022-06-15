package com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "users")
public class User {
	@Id
	private String id;
	private String passwords;
	private String email;
	private String fullName;
	private boolean roles;
	
	@JsonBackReference @JsonIgnore
	@OneToMany ( cascade = CascadeType.ALL, mappedBy = "user")
	private List<Favorite> fv;
	
	@JsonBackReference @JsonIgnore
	@OneToMany ( cascade = CascadeType.ALL, mappedBy = "userShare")
	private List<Share> share;
	
	@JsonBackReference @JsonIgnore
	@OneToMany(mappedBy = "userComment")
	private List<Comment> comment;
	
	
	public User() {

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswords() {
		return passwords;
	}

	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public boolean isRoles() {
		return roles;
	}

	public void setRoles(boolean roles) {
		this.roles = roles;
	}

}
