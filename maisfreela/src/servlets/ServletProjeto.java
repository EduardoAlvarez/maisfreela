package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empresario;
import model.Lance;
import model.Projeto;
import model.Tag;
import model.Usuario;
import dao.ProjetoDAO;
import dao.TagDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletProjeto
 */
@WebServlet({"/projeto/visualizaProjetos", "/projeto/publicarProjeto", "/projeto/projetosPublicados", "/projeto/projetosAtuados", "/projeto/visualizarProjeto", "/projeto/lancesDados", "/projeto/iniciarProjeto","/projeto/reabrirProjeto","/projeto/encerrarProjeto","/projeto/cancelarProjeto","/projeto/darLance","/projeto/confirmarProjeto","/projeto/confirmarEncerramento","/projeto/avaliarEmpresario","/projeto/avaliarProjeto",
	"/projeto/cadastraProjetoAction" , "/projeto/darLanceAction"})
public class ServletProjeto extends HttpServlet {
	private ProjetoDAO projetoDao = new ProjetoDAO();
	private UsuarioDAO userDao = new UsuarioDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length-1];
		switch (acao) {
			case "visualizaProjetos":
				ArrayList<Projeto> projetos = projetoDao.getAll();
				request.setAttribute("projetos", projetos);
				request.getRequestDispatcher("/maisfreela/projetos.jsp").forward(request,response);
			break;			
			case "publicarProjeto":
				TagDAO tagdao = new TagDAO();
				ArrayList<Tag> tags = tagdao.getAll(); 
				request.setAttribute("tags", tags);
				request.getRequestDispatcher("/maisfreela/criarprojeto.jsp").forward(request,response);
			break;	
			case "projetosPublicados":
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;	
			case "projetosAtuados":
				request.getRequestDispatcher("/maisfreela/projetosatuados.jsp").forward(request,response);
			break;
			case "visualizarProjeto":
				System.out.println("asdasdsda");
				String id = request.getParameter("id_projeto");
				if (id != null) {
					ProjetoDAO projDAO = new ProjetoDAO();
					Projeto projeto = (Projeto)projDAO.getById("Projeto", Integer.valueOf(id)); 
					HttpSession session = request.getSession();
					session.setAttribute("v_projeto",projeto);
				}
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "lancesDados":
				request.getRequestDispatcher("/maisfreela/lancesdados.jsp").forward(request,response);
			break;
			case "avaliarDesenvolvedor":
				request.getRequestDispatcher("/maisfreela/avaliardesenvolvedor.jsp").forward(request,response);
			break;
			case "avaliarEmpresario":
				request.getRequestDispatcher("/maisfreela/avaliarempresario.jsp").forward(request,response);
			break;
			case "darLance":
				request.getRequestDispatcher("/maisfreela/darlance.jsp").forward(request,response);
			break;
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length-1];
		switch (acao) {
			case "cadastraProjetoAction":
				String titulo = request.getParameter("titulo");
				String desc = request.getParameter("desc");
				String valor = request.getParameter("valor");
				String prazo = request.getParameter("prazo");
				String[] tags = request.getParameterValues("tags[]");
				Projeto proj = new Projeto();
				proj.setTitulo(titulo);
				proj.setDescricao(desc);
				proj.setPrazo(Integer.valueOf(prazo));
				proj.setValor(Integer.valueOf(valor));
				HttpSession session = request.getSession();
				Usuario user = (Usuario)session.getAttribute("usuario");
				Empresario emp = user.getEmpresario();
				System.out.println(emp == null);
				System.out.println(user == null);
				proj.setEmpresario(emp);
				List<Tag> tags_list = new ArrayList<Tag>();
				TagDAO tagDAO = new TagDAO();
				for(String tag_id : tags){
					Tag tag = (Tag)tagDAO.getById("Tag", Integer.valueOf(tag_id));
					tags_list.add(tag);
				}
				proj.setTags(tags_list);
				proj.setStatus("novo"); //tinha que ser um ENUM.. mas da muito trampo pesquisar isso..
				ProjetoDAO projDAO = new ProjetoDAO();
				projDAO.save(proj);
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "projeto/darLanceAction":
				String comentario = request.getParameter("comentario");
				String valorLance = request.getParameter("valor");
				
				HttpSession sessionLance = request.getSession();
				Usuario userLance = (Usuario)sessionLance.getAttribute("usuario");
				
				String id_projeto = request.getParameter("id_projeto");
				ProjetoDAO pDAO = new ProjetoDAO();
				Projeto p = pDAO.getById(Integer.valueOf(id_projeto));				
				
				Lance lance = new Lance();
				lance.setComentario(comentario);
				lance.setValor(Float.valueOf(valorLance));
				lance.setDesenvolvedor(userLance.getDesenvolvedor());
				lance.setProjeto(p);
				
				pDAO.save(lance);
		}
	}
}


