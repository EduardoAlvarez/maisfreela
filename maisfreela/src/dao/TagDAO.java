package dao;
import java.util.ArrayList;

import model.Tag;
import model.Usuario;
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
}
