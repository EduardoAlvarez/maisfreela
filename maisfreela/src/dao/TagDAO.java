package dao;
import java.util.ArrayList;
import java.util.List;

import model.Desenvolvedor;
import model.Projeto;
import model.Tag;

import org.hibernate.Session;
public class TagDAO extends GenericDAO{
	public ArrayList<Tag> getAll(){
		ArrayList lista = super.getAll("Tag");
		ArrayList<Tag> temp = new ArrayList<Tag>();
		for (Object obj: lista) {
			temp.add((Tag)obj);
		}
		return temp;
	}
	
	public Tag getById(Integer id) {
		return (Tag)super.getById("Tag",id);
	}
	
	public List getTagsByDesenvolvedor(Desenvolvedor dev){
		Session session = this.Connection();
		List results = session.createSQLQuery("SELECT tag.nome from tag inner join desenvolvedor_has_tags dht on dht.id_tag = tag.id_tag where id_desenvolvedor = "+dev.getId()+";").list();    
		return results;
	}
	public List<String> getTagsByProjeto(Projeto proj){
		Session session = this.Connection();
		List<String> results = session.createSQLQuery("SELECT tag.nome from tag inner join projeto_has_tags pht on pht.id_tag = tag.id_tag where id_projeto = "+proj.getId()+";").list();    
		return results;
	}
}
