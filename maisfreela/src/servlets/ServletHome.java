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

@WebServlet({ "/home/comoFunciona", "/home", "/home/faleConosco" })
public class ServletHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DesenvolvedorDAO devDao = new DesenvolvedorDAO();
	private ProjetoDAO projetoDao = new ProjetoDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length - 1];
		switch (acao) {
		case "comoFunciona":			
			request.getRequestDispatcher("/maisfreela/comofunciona.jsp").forward(request, response);
		break;
		case "faleConosco":			
			request.getRequestDispatcher("/maisfreela/faleconosco.jsp").forward(request, response);
		break;
		case "home":
			System.out.println("Vc esta na Home");
			ArrayList<Desenvolvedor> lista = devDao.getAllLimited("Desenvolvedor", 3);
			request.setAttribute("desenvolvedores", lista);
			ArrayList<Projeto> projetos = projetoDao.getProjetosDisponiveis(3);
			request.setAttribute("projetos", projetos);
			request.getRequestDispatcher("maisfreela/home.jsp").forward(request, response);
			break;
		}

	}

}
