package com.babyboy.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {

	private static EntityManagerFactory entityManagerFactory;
	
	public static EntityManagerFactory getEntityManagerFactory() {
		if(entityManagerFactory == null) {
			entityManagerFactory = Persistence.createEntityManagerFactory("jpa_config");
		}
		
		return entityManagerFactory;
	}
	
	public static void closeEntityManagerFactory() {
		if(entityManagerFactory.isOpen()) {
			entityManagerFactory.close();
		}
	}
}
