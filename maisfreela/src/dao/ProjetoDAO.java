package dao;

import java.util.ArrayList;
import model.Projeto;

public class ProjetoDAO extends GenericDAO{
	public ArrayList<Projeto> getAll(){
		ArrayList lista = super.getAll("Projeto");
		
		ArrayList<Projeto> temp = new ArrayList<Projeto>();
		
		for (Object obj: lista) {
			
			temp.add((Projeto)obj);
			
		}
		
		
		return temp;
	}
}
