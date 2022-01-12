package com.babyboy.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.babyboy.model.Bill;
import com.babyboy.model.Cart;
import com.babyboy.model.Category;
import com.babyboy.model.Product;
import com.babyboy.util.JpaUtil;

public class BillDao {
	
	private static EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
	
	public static List<Bill> getBills() {
		List<Bill> bills = new ArrayList<Bill>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			Query query = em.createQuery("FROM Bill");
			
			bills = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return bills;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static List<Bill> getBillsByUserId(Long id) {
		List<Bill> bills = new ArrayList<Bill>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Query query = em.createQuery("SELECT b FROM Bill b WHERE b.user.id = :id");
			query.setParameter("id", id);
			
			bills = query.getResultList();
			em.getTransaction().commit();
			em.close();
			
			return bills;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean saveBill(Bill bill) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			em.persist(bill);
	
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
