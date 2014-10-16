package dao;

import model.Usuario;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class Teste {
	public static void main(String[] args) {
		System.out.println("Oi");
		SessionFactory sf = new AnnotationConfiguration().configure(
				"hibernate.cfg.xml").buildSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		//Usuario
		Usuario usuario = new Usuario();
			usuario.setNome("Joao");
			usuario.setSobre("oi meu nome");
			usuario.setCpf(405346886);
			usuario.setEndereco("Av nosa sfdf sdf ");
			usuario.setLogin("joao");
			usuario.setSenha("123456");
		session.save(usuario);
		tx.commit();
		session.close();
		session = sf.openSession();
		
		
		
		
		
	}
}
