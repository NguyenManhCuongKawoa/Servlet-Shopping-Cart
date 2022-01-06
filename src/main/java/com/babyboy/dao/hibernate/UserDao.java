package com.babyboy.dao.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.babyboy.model.User;
import com.babyboy.util.HibernateUtil;

public class UserDao {

	private SessionFactory sessionFactory;
	
	public UserDao( ) {
		sessionFactory = HibernateUtil.getSessionFactory();
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		transaction.begin();
		
		List<User> users = session.createQuery("").getResultList();
		
		transaction.commit();
		session.close();
		return null;
	}
}
