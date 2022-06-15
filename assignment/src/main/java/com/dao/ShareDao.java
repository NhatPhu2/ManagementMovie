package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.Share;
import com.model.Video;
import com.utils.JpaUtils;

public class ShareDao implements NetflixSystem<Share,Integer> {
	 EntityManager em = JpaUtils.getEnitManager();
	 EntityTransaction trans = em.getTransaction();
	@Override
	public void insert(Share entity) {
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
	public void update(Share entity) {
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
		Share share = em.find(Share.class, key);
		try {
			trans.begin();
			
			em.remove(share);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
		
	}

	@Override
	public List<Share> selectAll() {
		String jpql = "select o from Share o";
		TypedQuery<Share> query = em.createQuery(jpql,Share.class);
		return query.getResultList();
	}
	
	public List<Share> findByTitle(String title){
		String jpql = "select o from Share o where o.videoShare.title=:title";
		TypedQuery<Share> query = em.createQuery(jpql,Share.class);
		query.setParameter("title",title);
		return query.getResultList();
	}

}
