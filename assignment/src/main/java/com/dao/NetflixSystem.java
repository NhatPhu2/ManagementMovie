package com.dao;

import java.util.List;

public interface NetflixSystem<E,K> {
	public void insert(E entity);
	public void update(E entity);
	public void delete(K key);
	public List<E> selectAll();
}
