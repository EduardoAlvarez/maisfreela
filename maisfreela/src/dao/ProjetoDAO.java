package dao;

import java.util.ArrayList;

import model.Projeto;
import model.Tag;

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
}
