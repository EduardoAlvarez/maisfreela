package dao;
import java.util.ArrayList;
import java.util.List;

import model.Desenvolvedor;
import model.Empresario;
import model.Projeto;
import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;
public class ProjetoDAO extends GenericDAO{
	public ArrayList<Projeto> getAll(){
		ArrayList lista = super.getAll("Projeto");
		ArrayList<Projeto> temp = new ArrayList<Projeto>();
		for (Object obj: lista) {			
			temp.add((Projeto)obj);
		}		
		return temp;
	}
	public Projeto getById(Integer id) {
		return (Projeto)super.getById("Projeto",id);
	}
	public List<Projeto> getProjetosByEmpresario(Empresario emp){
		Session session = this.Connection();
		String hql = "FROM Projeto p where p.empresario.id = "+emp.getId();
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		List<Projeto> projetos = new ArrayList<Projeto>();
		for(Object p : results2){
			projetos.add((Projeto)p);
		}
		return projetos;
		
	}
	
	public List<Projeto> getProjetosByDesenvolvedor(Desenvolvedor dev){
		Session session = super.Connection();
		String hql = "FROM Projeto p where p.desenvolvedor.id = '"+dev.getId()+"'";
		Query query = session.createQuery(hql);
		List<Projeto> atuados = (List<Projeto>) query.list();
		session.close();
		System.out.println(atuados);
		return atuados;
	}
		
}
