package com.babyboy.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import com.babyboy.model.Product;
import com.babyboy.model.User;
import com.babyboy.util.JpaUtil;

public class ProductDao {

	private static EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
	
	public static int size(String category) {
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			String q = "select count(p) from Product p ";
			
			if(category != null) {
				q += "where p.category.name = '" + category + "'";
			}
			 System.out.println(q);
			Query query = em.createQuery(q);
			
			Long res = (Long) query.getSingleResult();
			
			em.getTransaction().commit();
			em.close();
			
			return res.intValue();
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static boolean saveProduct(Product p) {
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			if(p.getId() == null) {
				em.persist(p);				
			} else {
				em.find(Product.class, p.getId());
				em.merge(p);
			}
			
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch(Exception e) {
			e.printStackTrace();
//			System.out.println(e);
			return false;
		}
	} 
	
	public static List<Product> getProductsOfUser(User user) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
//			CriteriaBuilder cb = em.getCriteriaBuilder();
//			CriteriaQuery<Product> cq = cb.createQuery(Product.class);
//			Root<Product> root = cq.from(Product.class);
//			cq.select(root);
//			cq.where(cb.equal(root.get("user"), user));
//			
//			Query query = em.createQuery(cq);
			
			Query query = em.createQuery("from Product p where p.user = :user");
			query.setParameter("user", user);
			
			products = query.getResultList();
			
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static void deleteProductById(Long id) { 
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();

			Query query = em.createQuery("delete from Product p where p.id = :id");
			query.setParameter("id", id);
			
			query.executeUpdate();
			
			em.getTransaction().commit();
			em.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Product> cq = cb.createQuery(Product.class);
			Root<Product> root = cq.from(Product.class);
			cq.select(root);
			
			Query query = em.createQuery(cq);
			
			products = query.getResultList();
			
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	
	public static List<Product> getProductsByContainKey(String keyword) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Product> cq = cb.createQuery(Product.class);
			Root<Product> root = cq.from(Product.class);
			cq.select(root);
			cq.where(cb.like(root.get("name"), "%" + keyword.toLowerCase() + "%"));
			
			Query query = em.createQuery(cq);
			
			products = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static List<Product> getPaginProducts(int size, int current) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();

			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Product> cq = cb.createQuery(Product.class);
			Root<Product> root = cq.from(Product.class);
			cq.select(root);
			
			Query query = em.createQuery(cq);
			int begin = current <= 1 ? 0 : size * (current - 1);
			query.setFirstResult(begin);
			query.setMaxResults(size);
			
			products = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static List<Product> getProductsByCategory(Long cId) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();

			Query query = em.createQuery("FROM Product p WHERE p.category.id = :cid");
			query.setParameter("cid", cId);
			
			products = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static List<Product> getPaginProductsByCategory(Long cId, int size, int current) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();

			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Product> cq = cb.createQuery(Product.class);
			Root<Product> root = cq.from(Product.class);
			cq.select(root);
			cq.where(cb.equal(root.get("category").get("id"), cId));
			
			Query query = em.createQuery(cq);
			int begin = current <= 1 ? 0 : size * (current - 1);
			query.setFirstResult(begin);
			query.setMaxResults(size);
			
			products = query.getResultList();
	
			em.getTransaction().commit();
			em.close();
			
			return products;
		} catch(Exception e) {
			return null;
		}
	}
	
	public static Product getProductById(Long id) {
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			Product p = em.find(Product.class, id);
			em.getTransaction().commit();
			em.close();
			
			return p;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Product getProductByIdAndUserId(Long id, Long uId) {
		
		try {
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			
			Query query = em.createQuery("from Product p where p.id = :id and p.user.id = :u_id");
			query.setParameter("id", id);
			query.setParameter("u_id", uId);
			
			System.out.println(query);
			List<Product> products = query.getResultList();
			
			Product p = null;
			if(products.size() > 0) {
				p = products.get(0);
			}
		
//			System.out.println(p);
			em.getTransaction().commit();
			em.close();
			
			return p;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
