package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Desenvolvedor;
import dao.DesenvolvedorDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet({"/usuario/cadastraUsuario" , "/usuario/visualizaUsuario"})
public class ServletUsuario extends HttpServlet {
	private UsuarioDAO userDao = new UsuarioDAO();
	private DesenvolvedorDAO devDao = new DesenvolvedorDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		/*Usuario usuario = new Usuario();
			usuario.setNome("Henrique Barjas");
			usuario.setCpf("123456543300"); 
			usuario.setLogin("henrique.barjar");
			usuario.setSenha("54321");
			usuario.setSobre("Descrição do usuário");
			userDao.save(usuario);
			Desenvolvedor dev = new Desenvolvedor(usuario);
			devDao.save(dev);*/
			ArrayList<Desenvolvedor> lista = devDao.getAll();
    		request.setAttribute("desenvolvedor", lista);
    		String url = request.getRequestURI();
    		String[] aux = url.split("/");
    		String acao = aux[aux.length-1];
    		switch (acao) {
			case "cadastraUsuario":
				
			break;
			case "visualizaUsuario":
				
			break;
			default:
				System.out.println("Ação não encontrada!!");
				break;
			}
	}

}
