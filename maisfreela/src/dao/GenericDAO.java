package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;


@SuppressWarnings("deprecation")
public class GenericDAO{
	private Session Connection(){
		SessionFactory sf = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sf.openSession();
		return session;
	}
	public void save(Object obj){
		Session session = this.Connection();
		Transaction tx = session.beginTransaction();
			session.save(obj);
		tx.commit();
		session.close();
	}
}
