package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Projeto;
import model.Usuario;
import dao.ProjetoDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletProjeto
 */
@WebServlet({"/projeto/visualizaProjetos", "/projeto/publicarProjeto", "/projeto/projetosPublicados", "/projeto/projetosAtuados"})
public class ServletProjeto extends HttpServlet {
	private ProjetoDAO projetoDao = new ProjetoDAO();
	private UsuarioDAO userDao = new UsuarioDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length-1];
		System.out.println(acao);
		switch (acao) {
			case "visualizaProjetos":
				ArrayList<Projeto> projetos = projetoDao.getAll();
				request.setAttribute("projetos", projetos);
				request.getRequestDispatcher("/maisfreela/projetos.jsp").forward(request,response);
			break;			
			case "publicarProjeto":
				request.getRequestDispatcher("/maisfreela/criarprojeto.jsp").forward(request,response);
			break;	
			case "projetosPublicados":
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;	
			case "projetosAtuados":
				request.getRequestDispatcher("/maisfreela/projetosatuados.jsp").forward(request,response);
			break;
			case "visualizaProjeto":
				String id = request.getParameter("id_projeto");
				ProjetoDAO userDAO = new ProjetoDAO();
				Usuario usuario = userDao.getById(Integer.valueOf(id)); 
				request.setAttribute("v_usuario",usuario);
				request.getRequestDispatcher("/maisfreela/usuario.jsp").forward(request,response);
			break;
			
		}
	}
}
