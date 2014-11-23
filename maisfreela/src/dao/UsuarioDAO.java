package dao;

import java.util.ArrayList;
import java.util.List;

import model.Avaliacao;
import model.Desenvolvedor;
import model.Empresario;
import model.Usuario;
import model.Notificacao;

import org.hibernate.Query;
import org.hibernate.Session;


public class UsuarioDAO extends GenericDAO{

	public Usuario getUsuarioByLoginAndSenha(String login, String senha) {
		Session session = super.Connection();
		String hql = "FROM Usuario user where user.login = '"+login+"' and user.senha = '"+senha+"'";
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		session.close();
		if(results2.size() > 0){
			return (Usuario)results2.get(0);
		}
		
		return null;
		
	}

	public Usuario getById(Integer id) {
		return (Usuario)super.getById("Usuario",id);
	}	
	
	public List<Notificacao> getNotificacoesbyUsuario (Usuario user){
		Session session = super.Connection();
		String hql = "FROM Notificacao n where n.usuario.id = '"+user.getId()+"'";
		Query query = session.createQuery(hql);
		List<Notificacao> notificacoes = (List<Notificacao>) query.list();
		session.close();
		//System.out.println(notificacoes);
		return notificacoes;
		
	}
	
	public List<Avaliacao> getAvaliacoesbyDesenvolvedor (Desenvolvedor dev){
		Session session = super.Connection();
		String hql = "FROM Avaliacao a where a.desenvolvedorDestino.id = '"+dev.getId()+"'";
		Query query = session.createQuery(hql);
		List<Avaliacao> avaliacoes = (List<Avaliacao>) query.list();
		session.close();	
		//System.out.println(avaliacoes);
		return avaliacoes;
	}
		
	public List<Avaliacao> getAvaliacoesbyEmpresario (Empresario emp){
		Session session = super.Connection();
		String hql = "FROM Avaliacao a where a.empresarioDestino.id = '"+emp.getId()+"'";
		Query query = session.createQuery(hql);
		List<Avaliacao> avaliacoes = (List<Avaliacao>) query.list();
		session.close();
		//System.out.println(avaliacoes);
		return avaliacoes;
	}

	public Usuario getLast() {
		return (Usuario)super.getLast("Usuario");
	}
	
}
