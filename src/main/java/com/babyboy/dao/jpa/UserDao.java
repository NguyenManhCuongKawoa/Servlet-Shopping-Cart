package com.babyboy.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.babyboy.model.User;
import com.babyboy.util.JpaUtil;

public class UserDao {

	private static EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();;

	
	public static User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<User> cq = cb.createQuery(User.class);
			Root<User> root = cq.from(User.class);
			cq.select(root);
			Predicate[] predicates = new Predicate[2];
			predicates[0] = cb.equal(root.get("email"), email);
			predicates[1] = cb.equal(root.get("password"), password);
			cq.where(predicates);
			
			Query query = em.createQuery(cq);
			
			List<User> res = query.getResultList();
			
			if(res.size() > 0) {
				user = res.get(0);
			}
			
			em.getTransaction().commit();
			em.close();
			
			return user;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static boolean saveUser(User user) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			em.persist(user);
			
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public static boolean isExistsEmail(String email) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			Query query = em.createQuery("select count(u) from User u where u.email = :email");
			query.setParameter("email", email);
			
			Long res = (Long) query.getSingleResult();
			
			em.getTransaction().commit();
			em.close();
			
			return res != 0;
		} catch(Exception e) {
			return false;
		}
	}
	
	public static boolean changePassword(long id, String password) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			User user = em.find(User.class, id);
			user.setPassword(password);

			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch(Exception e) {
			return false;
		}
	}
}
