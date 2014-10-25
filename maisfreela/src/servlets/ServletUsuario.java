package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Desenvolvedor;
import model.Usuario;
import dao.DesenvolvedorDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletProjeto
 * @WebServlet("/usuario/*")
 */
public class ServletUsuario extends HttpServlet {
	private UsuarioDAO userDao = new UsuarioDAO();
	private DesenvolvedorDAO devDao = new DesenvolvedorDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		Usuario usuario = new Usuario();
			usuario.setNome("Henrique Barjas");
			usuario.setCpf("123456543300"); 
			usuario.setLogin("henrique.barjar");
			usuario.setSenha("54321");
			usuario.setSobre("Descriçao do usuário");
			userDao.save(usuario);
			//Desenvolvedor dev = new Desenvolvedor(usuario);
			//devDao.save(dev);
	}

}
