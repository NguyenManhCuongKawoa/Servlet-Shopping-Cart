package com.babyboy.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.babyboy.model.Category;
import com.babyboy.util.JpaUtil;

public class CategoryDao {

	private static EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();

	
	public static List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<Category>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			Query query = em.createQuery("FROM Category");
			
			categories = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return categories;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static Category getCategoryById(Long id) {
		Category p = null;
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			p = em.find(Category.class, id);
			
			em.getTransaction().commit();
			em.close();
			
			return p;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static Category getCategoryByName(String name) {
		Category c = null;
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			List<Category> categories = em.createQuery("from Category c where c.name = :name")
					.setParameter("name", name).getResultList();
			if(categories.size() > 0) {
				c = categories.get(0);
			}
			
			em.getTransaction().commit();
			em.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public static boolean addNewCategory(Category category) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			em.persist(category);
			
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch(Exception e) {
			return false;
		}
	}
}
