package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.User;
import com.model.Video;
import com.utils.JpaUtils;

public class UserDao implements NetflixSystem<User, String>  {
	 EntityManager em = JpaUtils.getEnitManager();
	 EntityTransaction trans = em.getTransaction();
	
	
	@Override
	public void insert(User entity) {
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
	public void update(User entity) {
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
			trans.begin();
			User entity = new User();
		
			entity = em.find(User.class,id);
			em.remove(entity);
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
	}

	@Override
	public List<User> selectAll() {
		String jpql = "select o from User o";
		TypedQuery<User> query = em.createQuery(jpql,User.class);
		return query.getResultList();
	}
	
	public List<User>findPage(int start){
		String jpql = "select o from User o";
		TypedQuery<User> query = em.createQuery(jpql,User.class);
		query.setFirstResult(start);
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	
	public User findById(String userId) {
		return em.find(User.class, userId);
	}

	
	
	
	
}
