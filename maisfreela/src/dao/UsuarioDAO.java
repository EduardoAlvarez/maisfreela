package dao;

import java.util.ArrayList;

import model.Usuario;

import org.hibernate.Query;
import org.hibernate.Session;


public class UsuarioDAO extends GenericDAO{

	public Usuario getUsuarioByLoginAndSenha(String login, String senha) {
		Session session = super.Connection();
		String hql = "FROM Usuario user where user.login = '"+login+"' and user.senha = '"+senha+"'";
		Query query = session.createQuery(hql);
		ArrayList<Object> results2 = (ArrayList<Object>) query.list();
		if(results2.size() > 0){
			return (Usuario)results2.get(0);
		}
		return null;
		
	}

	public Usuario getById(Integer id) {
		return (Usuario)super.getById("Usuario",id);
	}	
	
}
