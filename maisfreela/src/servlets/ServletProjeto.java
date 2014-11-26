package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.NotifyController;
import model.Avaliacao;
import model.Empresario;
import model.Lance;
import model.Notificacao;
import model.Projeto;
import model.Tag;
import model.Usuario;
import dao.GenericDAO;
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
	"/projeto/cancelarProjetoAction", "/projeto/encerrarProjetoAction","/projeto/confirmarInicioProjetoAction"})
public class ServletProjeto extends HttpServlet {
	
	private ProjetoDAO projetoDao = new ProjetoDAO();
	private UsuarioDAO userDao = new UsuarioDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length-1];
		switch (acao) {
			case "visualizaProjetos":
				ArrayList<Projeto> projetos = projetoDao.getProjetosDisponiveis(0);
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
				proj.setValor(Float.valueOf(  valor.replace(",",".")));
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

				//Notifica��o
				NotifyController.enviarNotificacao("Lance dado", 
						"Seu projeto:<a class='link_projeto' href='/maisfreela/projeto/visualizarProjeto?id_projeto="+p.getId()+"'>"+p.getTitulo()+"</a> recebeu um lance, clique no t�tulo do projeto para mais informa��es.", 
						p.getEmpresario().getUsuario());	
					
				request.getRequestDispatcher("/maisfreela/lancesdados.jsp").forward(request,response);
			break;
			case "aceitarLanceAction":
				String id_projeto1 = request.getParameter("id_projeto");
				String id_lance = request.getParameter("id_lance");
				ProjetoDAO projDao = new ProjetoDAO();
				LanceDAO lanceDao = new LanceDAO();
				Lance lance1 = lanceDao.getById(Integer.valueOf(id_lance));
				Projeto projeto_blok = projDao.getById(Integer.valueOf(id_projeto1));
				projeto_blok.setStatus("bloqueado");
				
				lance1.setEscolhido(true);
				
				lanceDao.update(lance1);
				projDao.update(projeto_blok);
				
				NotifyController.enviarNotificacao("Lance aceito", 
						"Seu lance foi aceito no projeto", 
						lance1.getDesenvolvedor().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "reabrirProjetoAction":
				String id_projeto2 = request.getParameter("id_projeto");
				ProjetoDAO projeDao = new ProjetoDAO();				
				Projeto reabrir_proj = projeDao.getById(Integer.valueOf(id_projeto2));
				reabrir_proj.setStatus("pendente");
				
				
				LanceDAO lanceDao1 = new LanceDAO();
				
				List<Lance> lances = projeDao.getLancesByProjeto(reabrir_proj);				
				for(Lance reabrir_lance : lances){
					reabrir_lance.setEscolhido(false);
					lanceDao1.update(reabrir_lance);
				}
				
				
				
				projeDao.update(reabrir_proj);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "cancelarProjetoAction":
				String id_projeto3 = request.getParameter("id_projeto");
				ProjetoDAO projetDao = new ProjetoDAO();
				Projeto cancelar_proj = projetDao.getById(Integer.valueOf(id_projeto3));
				cancelar_proj.setStatus("cancelado");
				projetDao.update(cancelar_proj);
				
				//Notifica��o
				NotifyController.enviarNotificacao("Projeto cancelado", 
						"O projeto: "+cancelar_proj.getTitulo()+" foi cancelado! Voc� receber� 40% do valor j� pago.", 
						projetDao.getUsuarioByProjeto(cancelar_proj));
								
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "confirmarInicioProjetoAction":
				String iniciar_id_projeto = request.getParameter("id_projeto");
				ProjetoDAO iniciar_projetDao = new ProjetoDAO();
				Projeto iniciar_proj = iniciar_projetDao.getById(Integer.valueOf(iniciar_id_projeto));
				
				Date dataInicio = new Date();
				iniciar_proj.setDataInicio(dataInicio);
								
				iniciar_proj.setStatus("iniciado");
				iniciar_projetDao.update(iniciar_proj);
				
				//Notifica��o
				NotifyController.enviarNotificacao("In�cio do projeto confirmado",
						"In�cio do projeto confirmado pelo desenvolvedor!", 
						iniciar_proj.getDesenvolvedor().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "encerrarProjetoAction":
				String id_projeto4 = request.getParameter("id_projeto");
				ProjetoDAO projetoDao = new ProjetoDAO();
				Projeto encerrar_proje = projetoDao.getById(Integer.valueOf(id_projeto4));
				encerrar_proje.setStatus("aguardando encerramento");
				projetoDao.update(encerrar_proje);
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "avaliarEmpresario":
				String ava_comentario = request.getParameter("comentario");
				double ava_avaliacao = Double.parseDouble(request.getParameter("avaliacao"));
				Integer id_projeto_ava = Integer.parseInt(request.getParameter("id_projeto"));
							
				HttpSession sessionAvaliacao = request.getSession();
				Usuario userAvaliacao = (Usuario)sessionAvaliacao.getAttribute("usuario");
				
				ProjetoDAO projetoDAO = new ProjetoDAO();
				Projeto projeto = projetoDAO.getById(Integer.valueOf(id_projeto_ava));				
				Avaliacao avalia_emp = new Avaliacao();
				avalia_emp.setComentario(ava_comentario);
				avalia_emp.setGrau(ava_avaliacao);
				avalia_emp.setEmpresarioDestino(projeto.getEmpresario());
				avalia_emp.setRemetente(userAvaliacao);
				GenericDAO save_ava = new GenericDAO();
				save_ava.save(avalia_emp);
				
				//Notifica��o
				NotifyController.enviarNotificacao("Avalia��o recebida",
						"Voc� foi aavaliado, para mais informa��o, favor acessar seu perfil.", 
						avalia_emp.getEmpresarioDestino().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "avaliarDesenvolvedor":
				String ava_comentario2 = request.getParameter("comentario");
				double ava_avaliacao2 = Double.parseDouble(request.getParameter("avaliacao"));
				Integer id_projeto_ava2 = Integer.parseInt(request.getParameter("id_projeto"));
							
				HttpSession sessionAvaliacao2 = request.getSession();
				Usuario userAvaliacao2 = (Usuario)sessionAvaliacao2.getAttribute("usuario");
				
				ProjetoDAO projetoDAO2 = new ProjetoDAO();
				Projeto projeto2 = projetoDAO2.getById(Integer.valueOf(id_projeto_ava2));				
				Avaliacao avalia_emp2 = new Avaliacao();
				avalia_emp2.setComentario(ava_comentario2);
				avalia_emp2.setGrau(ava_avaliacao2);
				avalia_emp2.setDesenvolvedorDestino(projeto2.getDesenvolvedor());
				avalia_emp2.setRemetente(userAvaliacao2);
				GenericDAO save_ava2 = new GenericDAO();
				save_ava2.save(avalia_emp2);
				
				//Notifica��o
				NotifyController.enviarNotificacao("Avalia��o recebida",
						"Voc� foi aavaliado, para mais informa��o, favor acessar seu perfil.", 
						avalia_emp2.getDesenvolvedorDestino().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
		}
	}
}


