package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Projeto;
import model.Usuario;
import dao.ProjetoDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletProjeto
 * @WebServlet("/projeto/*")
 */
public class ServletProjeto extends HttpServlet {
	private ProjetoDAO projetoDao = new ProjetoDAO();
	private UsuarioDAO userDao = new UsuarioDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
