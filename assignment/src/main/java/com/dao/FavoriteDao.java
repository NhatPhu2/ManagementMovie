package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.model.Favorite;
import com.model.Video;
import com.utils.JpaUtils;

public class FavoriteDao implements NetflixSystem<Favorite,Integer> {
	 EntityManager em = JpaUtils.getEnitManager();
	 EntityTransaction trans = em.getTransaction();
	@Override
	public void insert(Favorite entity) {
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
	public void update(Favorite entity) {
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
	public void delete(Integer id) {
		Favorite fv = em.find(Favorite.class,id);
		try {
			trans.begin();
			
			em.remove(fv);
			
			trans.commit();
		}catch(Exception e) {
			trans.rollback();
			e.printStackTrace();
		}
		em.close();
		
	}
	
	@Override
	public List<Favorite> selectAll() {
		String jpql = "select o from Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql,Favorite.class);
		return query.getResultList();
	}
	
	public Favorite checkVideoUserLikedOrUnlike(String idUser,String idVideo) {
		String jpql = "select o from Favorite o where o.user.id=:idUser and o.video.idVideo=:idVideo";
		TypedQuery<Favorite> query = em.createQuery(jpql,Favorite.class);
		query.setParameter("idUser",idUser);
		query.setParameter("idVideo",idVideo);
		try {
			Favorite fv = query.getSingleResult();
			return fv;
		}catch(Exception e) {
			return null;
		}
	}
	
	public List<Favorite> findByKeyWordAUser(String keyWord,String idUser){
		String jpql = "select o from Favorite  o where o.user.id =:idUser and o.video.title like :title";
		TypedQuery<Favorite> query = em.createQuery(jpql,Favorite.class);
		query.setParameter("title","%"+keyWord+"%");
		query.setParameter("idUser",idUser);
		return query.getResultList();
	}


}
