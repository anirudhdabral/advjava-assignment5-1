package com.web.util;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import database.AuthorDetails;

public class AuthorDetailsUtil {
public static SessionFactory factory;
	
	public static SessionFactory getSessionFactory() {
		
		if(factory==null) {
			try {
				Configuration cfg = new Configuration();
				
				Properties settings = new Properties();
				settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/library");
				settings.put(Environment.USER, "root");
				settings.put(Environment.PASS, "root");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
				settings.put(Environment.HBM2DDL_AUTO, "update");
				settings.put(Environment.SHOW_SQL, "true");
				
				cfg.setProperties(settings);
				cfg.addAnnotatedClass(AuthorDetails.class);
				
				ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
				factory=cfg.buildSessionFactory(registry);
				return factory;
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return factory;
		
	}

}
