package controller;
import model.Desenvolvedor;
import model.Empresario;
import model.Usuario;
public class UserController {
	public static boolean isLogged(String perfil,Usuario usuario){
		if(usuario != null){
			if(perfil == "desenvolvedor"){
				Desenvolvedor dev = usuario.getDesenvolvedor();
				if(dev != null){
					return true;
				}else{
					return false;
				}
			}else if(perfil == "empresario"){
				Empresario emp = usuario.getEmpresario();
				if(emp != null){
					return true;
				}else{
					return false;
				}
			}
		}
		return false;
	}
	public static boolean isLogged(Usuario usuario){
		if(usuario != null){
			return true;
		}
		return false;
	}
}
