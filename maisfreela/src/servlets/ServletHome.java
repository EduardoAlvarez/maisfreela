package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Desenvolvedor;
import model.Projeto;
import dao.DesenvolvedorDAO;
import dao.ProjetoDAO;

/**
 * Servlet implementaton class ServletHome 
 */
public class ServletHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletHome() {
        super();
    }
    private DesenvolvedorDAO devDao = new DesenvolvedorDAO();
    private ProjetoDAO projetoDao = new ProjetoDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Desenvolvedor> lista = devDao.getAll();
		request.setAttribute("desenvolvedores", lista);
		ArrayList<Projeto> projetos = projetoDao.getAll();
		request.setAttribute("projetos", projetos);
		request.getRequestDispatcher("maisfreela/home.jsp").forward(request,response);
	}

}
