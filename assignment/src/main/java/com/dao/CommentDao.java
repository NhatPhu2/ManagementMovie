package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.Comment;
import com.utils.JpaUtils;

public class CommentDao implements NetflixSystem<Comment,Integer> {
	EntityManager em = JpaUtils.getEnitManager();
	EntityTransaction trans = em.getTransaction();
	
	@Override
	public void insert(Comment entity) {
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
	public void update(Comment entity) {
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
		Comment comment = em.find(Comment.class, key);
		try {
			trans.begin();
			
			em.persist(comment);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
		
	}

	@Override
	public List<Comment> selectAll() {
		String jpql = "select o from Comment o ";
		TypedQuery<Comment> query = em.createQuery(jpql,Comment.class);
		return query.getResultList();
	}
	
	public List<Comment> selectByVideo(String idVideo){
		String jpql = "select o from Comment o where o.videoComment.idVideo=:idVideo";
		TypedQuery<Comment> query = em.createQuery(jpql,Comment.class);
		query.setParameter("idVideo",idVideo);
		return query.getResultList();
	}
	

}
