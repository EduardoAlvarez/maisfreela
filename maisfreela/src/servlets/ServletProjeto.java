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
import dao.LanceDAO;
import dao.ProjetoDAO;
import dao.TagDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletProjeto
 */



@WebServlet({"/projeto/visualizaProjetos", "/projeto/publicarProjeto", "/projeto/projetosPublicados", 
	"/projeto/projetosAtuados", "/projeto/visualizarProjeto", "/projeto/lancesDados", "/projeto/iniciarProjeto",
	"/projeto/reabrirProjeto","/projeto/cancelarProjeto","/projeto/darLance",
	"/projeto/confirmarProjeto","/projeto/confirmarEncerramento","/projeto/avaliarEmpresario","/projeto/avaliarProjeto",
	"/projeto/cadastraProjetoAction" , "/projeto/darLanceAction","/projeto/aceitarLanceAction","/projeto/reabrirProjetoAction",
	"/projeto/cancelarProjetoAction", "/projeto/encerrarProjetoAction","/projeto/confirmarInicioProjetoAction", 
	"/projeto/confirmarEncerramentoProjetoAction"})

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
		ProjetoDAO projDao = new ProjetoDAO(); //todos vao usar mesmo.. 
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
			case "darLanceAction":
				String comentario = request.getParameter("comentario");
				String valorLance = request.getParameter("valor");
				String id_projeto = request.getParameter("id_projeto");
				
				HttpSession sessionLance = request.getSession();
				Usuario userLance = (Usuario)sessionLance.getAttribute("usuario");
				
				
				ProjetoDAO pDAO = new ProjetoDAO();
				Projeto p = pDAO.getById(Integer.valueOf(id_projeto));				
				
				Lance lance = new Lance();
				lance.setComentario(comentario);
				lance.setValor(Float.valueOf(  valorLance.replace(",",".")));
				lance.setDesenvolvedor(userLance.getDesenvolvedor());
				lance.setProjeto(p);
				pDAO.save(lance);
				request.getRequestDispatcher("/maisfreela/lancesdados.jsp").forward(request,response);
			break;
			case "aceitarLanceAction":
				String id_projeto1 = request.getParameter("id_projeto");
				String id_lance = request.getParameter("id_lance");
				LanceDAO lanceDao = new LanceDAO();
				Lance lance1 = lanceDao.getById(Integer.valueOf(id_lance));
				Projeto projeto_blok = projDao.getById(Integer.valueOf(id_projeto1));
				projeto_blok.setStatus("bloqueado");
				
				lance1.setEscolhido(true);
				
				lanceDao.update(lance1);
				projDao.update(projeto_blok);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "reabrirProjetoAction":
				String id_projeto2 = request.getParameter("id_projeto");
				Projeto reabrir_proj = projDao.getById(Integer.valueOf(id_projeto2));
				reabrir_proj.setStatus("pendente");
				projDao.update(reabrir_proj);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "cancelarProjetoAction":
				String id_projeto3 = request.getParameter("id_projeto");
				Projeto cancelar_proj = projDao.getById(Integer.valueOf(id_projeto3));
				cancelar_proj.setStatus("cancelado");
				projDao.update(cancelar_proj);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "confirmarInicioProjetoAction":
				String iniciar_id_projeto = request.getParameter("id_projeto");
				ProjetoDAO iniciar_projetDao = new ProjetoDAO();
				Projeto iniciar_proj = iniciar_projetDao.getById(Integer.valueOf(iniciar_id_projeto));
				iniciar_proj.setStatus("iniciado");
				iniciar_projetDao.update(iniciar_proj);
			case "encerrarProjetoAction":
				String id_projeto4 = request.getParameter("id_projeto");
				Projeto encerrar_proje = projetoDao.getById(Integer.valueOf(id_projeto4));
<<<<<<< HEAD
				encerrar_proje.setStatus("cancelado");
				projDao.update(encerrar_proje);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "iniciarProjetoAction":
				String id_projetoI = request.getParameter("id_projeto");
				Projeto projetoI = projetoDao.getById(Integer.valueOf(id_projetoI));
				projetoI.setStatus("aguardando inicio");
				projetoI.setPagamento1(true);
				projDao.update(projetoI);
=======
				encerrar_proje.setStatus("aguardando encerramento");
				projetoDao.update(encerrar_proje);
>>>>>>> f0ddeada63e3b4ebe55e41f90d747d401e2b3269
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "confirmarEncerramentoProjetoAction":
				String id_projeto5 = request.getParameter("id_projeto");
				Projeto confirmar_fim_proj = projetoDao.getById(Integer.valueOf(id_projeto5));
				confirmar_fim_proj.setStatus("finalizado");
				projetoDao.update(confirmar_fim_proj);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
		}
	}
}


