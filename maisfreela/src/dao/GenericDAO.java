package dao;

import java.util.ArrayList;
import java.util.List;

import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import br.senac.sp.hibernate.model.Produto;


@SuppressWarnings("deprecation")
public class GenericDAO{
	private Class clazz;
	protected Session Connection(){
		SessionFactory sf = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = sf.openSession(); //
		return session;
	}
	public void save(Object obj){
		Session session = this.Connection();
		Transaction tx = session.beginTransaction();
			session.save(obj);
		tx.commit();
		session.close();
	}
	public void delete(Object obj){
		Session session = this.Connection();
		Transaction tx = session.beginTransaction();
			session.delete(obj);
		tx.commit();
		session.close();
	}
	public void update(Object obj){
		Session session = this.Connection();
		Transaction tx = session.beginTransaction();
			session.update(obj);
		tx.commit();
		session.close();
	}
	public ArrayList getAll(String table){
		Session session = this.Connection();
		String hql = "FROM "+table;
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		return results2;
	}
	public ArrayList getAllLimited(String table , int limit){
		//TODO
		Session session = this.Connection();
		String hql = "FROM "+table;
		Query query = session.createQuery(hql);
		query.setMaxResults(limit);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		return results2;
	}
	public Object getById(String table, Integer id) {
		Session session = this.Connection();
		String hql = "FROM "+table+" where id_"+table.toLowerCase()+" = "+id;
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		return results2.get(0);
	}
	public Object getLast(String table) {
		Session session = this.Connection();
		String hql = "FROM "+table+" t order by t.id desc";
		Query query = session.createQuery(hql);
		ArrayList<Object> results3 = (ArrayList<Object>) query.list();
		session.close();
		return results3.get(0);
	}
}
