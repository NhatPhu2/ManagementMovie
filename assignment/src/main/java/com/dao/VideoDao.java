package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.Favorite;
import com.model.Genre;
import com.model.User;
import com.model.Video;
import com.utils.JpaUtils;

public class VideoDao implements NetflixSystem<Video,String> {
	EntityManager em = JpaUtils.getEnitManager();
	EntityTransaction trans = em.getTransaction();
	@Override
	public void insert(Video entity) {
		try {
			trans.begin();
			
			em.persist(entity);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
	}

	@Override
	public void update(Video entity) {
		try {
			trans.begin();
			
			em.merge(entity);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
		
	}

	@Override
	public void delete(String id) {
		try {
			Video entity = new Video();
			trans.begin();
			
		
			entity = em.find(Video.class,id);
			em.remove(entity);
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
	}
	
	@Override
	public List<Video> selectAll() {
		String jpql = "select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		return query.getResultList();
	}
	
	public List<Video>findPage(int start){
		String jpql = "select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		query.setFirstResult(start);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	public Video findById(String idVideo) {
		return em.find(Video.class, idVideo);
	}
	
	public List<Video> favoriteOfUser(String idUser) {
		String jpql = "select o.video from Favorite o where o.user.id=:idUser";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		query.setParameter("idUser",idUser);
		return query.getResultList();
	}
	
	public Video checkVideoUserLikedOrUnlike(String idUser,String idVideo) {
		String jpql = "select o.video from Favorite o where o.user.id=:idUser and o.video.idVideo=:idVideo";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		query.setParameter("idUser",idUser);
		query.setParameter("idVideo",idVideo);
		try {
			Video v = query.getSingleResult();
			return v;
		}catch(Exception e) {
			return null;
		}
	}
	
	public List<Video> findByKeyWord(String keyWord){
		String jpql = "select o from Video o where o.genreVideo.genre like :genre or o.title like :title ";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		query.setParameter("genre","%"+keyWord+"%");
		query.setParameter("title","%"+keyWord+"%");
		return query.getResultList();
	}
	
	public List<Video> findByGenre(String genre){
		String jpql = "select o from Video o where o.genreVideo.genre like :genre";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		query.setParameter("genre","%"+genre+"%");
		return query.getResultList();
	}
	

	
}
