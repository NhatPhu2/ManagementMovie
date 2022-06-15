package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.Genre;
import com.model.Video;
import com.utils.JpaUtils;

public class GenreDao implements NetflixSystem<Genre,Integer> {
	 EntityManager em = JpaUtils.getEnitManager();
	 EntityTransaction trans = em.getTransaction();
	@Override
	public void insert(Genre entity) {
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
	public void update(Genre entity) {
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
	public void delete(Integer key) {
		Genre entity = new Genre();
		try {
			trans.begin();
			entity = em.find(Genre.class, key);
			em.remove(entity);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
		
	}

	@Override
	public List<Genre> selectAll() {
		String jpql = "select o from Genre o";
		TypedQuery<Genre> query = em.createQuery(jpql,Genre.class);
		return query.getResultList();
	}
	
	public List<Genre> selectByVideo(String genre){
		String jpql = "select o from Genre o where o.video is not empty and o.genre like :genre";
		TypedQuery<Genre> query = em.createQuery(jpql,Genre.class);
		query.setParameter("genre","%"+genre+"%");
		return query.getResultList();
	}
	
	public Genre findById(int id) {
		return em.find(Genre.class,id);
	}

}
