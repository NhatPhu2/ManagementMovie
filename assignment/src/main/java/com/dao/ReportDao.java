package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.utils.*;
import com.model.Report;

public class ReportDao {
	private EntityManager em = JpaUtils.getEnitManager();
	private EntityTransaction trans = em.getTransaction();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}
	
	
	public List<Report> reportFavoriteVideo() {
		String jpql = "select new Report(o.video.title,count(o),max(o.likeDate),min(o.likeDate)) "
				+ "from Favorite o group by o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		return query.getResultList();
	}
	
	public List<Report> reportFavoriteVideoByTitle(String videoTitle) {
		String jpql = "select new Report(o.video.title,count(o),max(o.likeDate),min(o.likeDate)) "
				+ "from Favorite o where o.video.title=:title group by o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		query.setParameter("title",videoTitle);
		return query.getResultList();
	}
		
	
}
