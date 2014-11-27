package dao;

import java.util.ArrayList;
import java.util.List;

import model.Desenvolvedor;

public class DesenvolvedorDAO extends GenericDAO{
	public ArrayList<Desenvolvedor> getAll(){
		ArrayList lista = super.getAll("Desenvolvedor");
		
		ArrayList<Desenvolvedor> temp = new ArrayList<Desenvolvedor>();
		
		for (Object obj: lista) {
			
			temp.add((Desenvolvedor)obj);
			
		}
		return temp;
	}

	public Desenvolvedor getLast() {
		Desenvolvedor dev = (Desenvolvedor)super.getLast("Desenvolvedor");
		return dev;
	}
}
