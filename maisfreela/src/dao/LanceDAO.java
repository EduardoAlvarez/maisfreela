package dao;
import model.Lance;
public class LanceDAO extends GenericDAO{
	public Lance getById(Integer id) {
		return (Lance)super.getById("Lance",id);
	}
}
