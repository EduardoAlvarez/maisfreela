package dao;

import java.util.ArrayList;
import java.util.List;

import model.Avaliacao;
import model.Desenvolvedor;
import model.Empresario;
import model.Lance;
import model.Projeto;
import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;

public class ProjetoDAO extends GenericDAO {
	public ArrayList<Projeto> getAll() {
		ArrayList lista = super.getAll("Projeto");
		ArrayList<Projeto> temp = new ArrayList<Projeto>();
		for (Object obj : lista) {
			temp.add((Projeto) obj);
		}
		return temp;
	}

	public Projeto getById(Integer id) {
		return (Projeto) super.getById("Projeto", id);
	}

	public List<Projeto> getProjetosByEmpresario(Empresario emp) {
		Session session = this.Connection();
		String hql = "FROM Projeto p where p.empresario.id = " + emp.getId();
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		List<Projeto> projetos = new ArrayList<Projeto>();
		for (Object p : results2) {
			projetos.add((Projeto) p);
		}
		return projetos;

	}

	public List<Projeto> getProjetosByDesenvolvedor(Desenvolvedor dev) {
		Session session = super.Connection();
		String hql = "FROM Projeto p where p.desenvolvedor.id = '"
				+ dev.getId() + "'";
		Query query = session.createQuery(hql);
		List<Projeto> atuados = (List<Projeto>) query.list();
		session.close();
		System.out.println(atuados);
		return atuados;
	}

	public List<Lance> getLancesByProjeto(Projeto p) {
		Session session = super.Connection();
		String hql = "FROM Lance l where l.projeto.id = '" + p.getId() + "'";
		Query query = session.createQuery(hql);
		List<Lance> lances = (List<Lance>) query.list();
		session.close();
		return lances;
	}

	public boolean getAvaliado(Projeto p, String string){
		boolean avaliado = false;
		Session session = super.Connection();
		if(string == "empresario"){		
			String hql = "FROM Avaliacao a where a.projeto.id = '"+p.getId()+"' AND a.empresarioDestino != NULL";
			Query query = session.createQuery(hql);
			List<Avaliacao> avaliacoes = (List<Avaliacao>) query.list();
			session.close();
			if(avaliacoes.size() > 0){
				avaliado = true;
			}
		}
		else if(string == "desenvolvedor"){
			String hql = "FROM Avaliacao a where a.projeto.id = '"+p.getId()+"' AND a.desenvolvedorDestino != NULL";
			Query query = session.createQuery(hql);
			List<Avaliacao> avaliacoes = (List<Avaliacao>) query.list();
			session.close();
			if(avaliacoes.size() > 0){
				avaliado = true;
			}
		}
		return avaliado;
	}
	public ArrayList getProjetosDisponiveis(int limit){
		Session session = this.Connection();
		String hql = "FROM Projeto p where p.status = 'pendente' OR p.status = 'novo'";
		Query query = session.createQuery(hql);
		if(limit != 0){
			query.setMaxResults(limit);
		}
		ArrayList<Object> projetosDisponiveis = (ArrayList<Object>) query.list();
		session.close();
		return projetosDisponiveis;
	}
	
	
	
	public Usuario getUsuarioByProjeto(Projeto p){
		Session session = this.Connection();
		String hql = "SELECT desenvolvedor FROM Projeto p where p.id = "+p.getId();
		Query query = session.createQuery(hql);
		ArrayList<Object> desenvolvedor = (ArrayList<Object>) query.list();
		session.close();
		return (Usuario)desenvolvedor.get(0);
	}
	
	
}
