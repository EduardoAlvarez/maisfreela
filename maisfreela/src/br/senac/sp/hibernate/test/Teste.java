package br.senac.sp.hibernate.test;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import br.senac.sp.hibernate.model.Comentario;
import br.senac.sp.hibernate.model.Fornecedor;
import br.senac.sp.hibernate.model.Produto;

public class Teste {

	public static void main(String[] args) {
		SessionFactory sf = new AnnotationConfiguration().configure(
				"hibernate.cfg.xml").buildSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();

		Fornecedor f1 = new Fornecedor();
		f1.setNome("Apple");

		Produto p1 = new Produto();
		p1.setNome("MacBook Pro");
		p1.setDescricao("Core i5, 4GB");
		p1.setPreco(5000.0);
		
		Comentario c1 = new Comentario();
		c1.setConteudo("Produto Ruim!");
		p1.addComentario(c1);
		
		Comentario c2 = new Comentario();
		c2.setConteudo("Ótimo Produto!");
		p1.addComentario(c2);

		Produto p2 = new Produto();
		p2.setNome("iMac");
		p2.setDescricao("Core i5, 4GB");
		p2.setPreco(4000.0);

		f1.addProduto(p1);
		f1.addProduto(p2);
		p1.setFornecedor(f1);
		p2.setFornecedor(f1);

		Fornecedor f2 = new Fornecedor();
		f2.setNome("Samsung");

		Produto p3 = new Produto();
		p3.setNome("Ativ Book 9");
		p3.setDescricao("Core i5, 4GB");
		p3.setPreco(5000.0);

		Produto p4 = new Produto();
		p4.setNome("Galaxy S5");
		p4.setDescricao("Snapdragon 800, 2GB");
		p4.setPreco(4000.0);

		f2.addProduto(p3);
		f2.addProduto(p4);
		p3.setFornecedor(f2);
		p4.setFornecedor(f2);

		session.save(f1);
		session.save(f2);
		tx.commit();

		session.close();

		session = sf.openSession();

//		System.out.println("Recuperando um produto pelo ID:");
//		Produto recuperado = (Produto) session.load(Produto.class, 2);
//		System.out.println(recuperado.getId() + " - " + recuperado.getNome());

		System.out.println("Recuperando todos os dados: ");
		Criteria crit = session.createCriteria(Produto.class);
		for (Object obj : crit.list()) {
			Produto produto = (Produto) obj;
			System.out.println(produto.getId() + " - " + produto.getNome());
		}

		System.out.println("Utilizando HQL");

		String hql = "FROM Fornecedor";
		Query query = session.createQuery(hql);
		List<Fornecedor> results = query.list();
		int lastIdFornecedor = 0;
		for (Fornecedor fornecedor : results) {
			System.out.println(fornecedor.getId() + " - "
					+ fornecedor.getNome());
			lastIdFornecedor = fornecedor.getId();
		}

		hql = "FROM Produto P WHERE P.fornecedor.nome='Apple'";
		query = session.createQuery(hql);
		List<Produto> results2 = query.list();
		int lastIdProduto = 0;
		for (Produto produto : results2) {
			System.out.println(produto.getId() + " - " + produto.getNome());
			lastIdProduto = produto.getId();
		}
		session.close();

		Session session2 = sf.openSession();
		Produto aRemover = new Produto();
		p2.setId(lastIdProduto);
		System.out.println("Removendo Produto de ID: " + lastIdProduto);
		tx = session2.beginTransaction();
		session2.delete(aRemover);
		tx.commit();

		System.out.println("Removendo Fornecedor de ID: " + lastIdFornecedor);
		Fornecedor aRemover2 = (Fornecedor) session2.load(Fornecedor.class,
				lastIdFornecedor);
		tx = session2.beginTransaction();
		for (Produto p : aRemover2.getProdutos()) {
			session2.delete(p);
		}
		session2.delete(aRemover2);
		tx.commit();
		session2.close();
		
		session = sf.openSession();
		hql = "From Produto P where P.comentarios.size > 0";
		query = session.createQuery(hql);
		List<Produto> produtos = query.list();
		Produto aRemover3 = (Produto) session.load(Produto.class, produtos.get(0).getId());
		System.out.println(aRemover3.getId()+" - "+aRemover3.getDescricao());
		tx = session.beginTransaction();
		session.delete(aRemover3);
		tx.commit();
	}

}
