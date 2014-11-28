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

import model.Avaliacao;
import model.Desenvolvedor;
import model.Empresario;
import model.Lance;
import model.Projeto;
import model.Tag;
import model.Usuario;
import controller.NotifyController;
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
	"/projeto/confirmarProjeto","/projeto/confirmarEncerramento","/projeto/avaliarEmpresario", "/projeto/avaliarEmpresarioAction",
	"/projeto/avaliarDesenvolvedorAction", "/projeto/avaliarDesenvolvedor",
	"/projeto/cadastraProjetoAction" , "/projeto/darLanceAction","/projeto/aceitarLanceAction","/projeto/reabrirProjetoAction",
	"/projeto/cancelarProjetoAction", "/projeto/encerrarProjetoAction","/projeto/confirmarInicioProjetoAction","/projeto/iniciarProjetoAction",
	"/projeto/atualizarProjetoAction", "/projeto/confirmarEncerramentoProjetoAction"})
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
					Projeto projeto = (Projeto)this.projetoDao.getById("Projeto", Integer.valueOf(id)); 
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
				this.projetoDao.save(proj);
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "darLanceAction":
				String comentario = request.getParameter("comentario");
				String valorLance = request.getParameter("valor");
				String id_projeto = request.getParameter("id_projeto");
				
				HttpSession sessionLance = request.getSession();
				Usuario userLance = (Usuario)sessionLance.getAttribute("usuario");				
				
				Projeto p = this.projetoDao.getById(Integer.valueOf(id_projeto));				
				
				Lance lance = new Lance();
				lance.setComentario(comentario);
				lance.setValor(Float.valueOf(  valorLance.replace(",",".")));
				lance.setDesenvolvedor(userLance.getDesenvolvedor());
				lance.setProjeto(p);
				this.projetoDao.save(lance);

				//NotificaÃ§Ã£o
				NotifyController.enviarNotificacao("Lance dado", 
						"Seu projeto:<a class='link_projeto' href='/maisfreela/projeto/visualizarProjeto?id_projeto="+p.getId()+"'>"+p.getTitulo()+"</a> recebeu um lance, clique no tï¿½tulo do projeto para mais informaï¿½ï¿½es.", 
						p.getEmpresario().getUsuario());	
					
				request.getRequestDispatcher("/maisfreela/lancesdados.jsp").forward(request,response);
			break;
			case "aceitarLanceAction":
				String id_projeto1 = request.getParameter("id_projeto");
				String id_lance = request.getParameter("id_lance");
				LanceDAO lanceDao = new LanceDAO();
				Lance lance1 = lanceDao.getById(Integer.valueOf(id_lance));
				Projeto projeto_blok = this.projetoDao.getById(Integer.valueOf(id_projeto1));
				projeto_blok.setStatus("bloqueado");
				
				lance1.setEscolhido(true);
				
				lanceDao.update(lance1);
				this.projetoDao.update(projeto_blok);
				
				NotifyController.enviarNotificacao("Lance aceito", 
						"Seu lance foi aceito no projeto", 
						lance1.getDesenvolvedor().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "reabrirProjetoAction":
				String id_projeto2 = request.getParameter("id_projeto");				
				Projeto reabrir_proj = this.projetoDao.getById(Integer.valueOf(id_projeto2));
				reabrir_proj.setStatus("pendente");
				
				
				LanceDAO lanceDao1 = new LanceDAO();
				
				List<Lance> lances = this.projetoDao.getLancesByProjeto(reabrir_proj);				
				for(Lance reabrir_lance : lances){
					reabrir_lance.setEscolhido(false);
					lanceDao1.update(reabrir_lance);
				}
				
				
				
				this.projetoDao.update(reabrir_proj);
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "cancelarProjetoAction":
				String id_projeto3 = request.getParameter("id_projeto");
				Projeto cancelar_proj = this.projetoDao.getById(Integer.valueOf(id_projeto3));
				cancelar_proj.setStatus("cancelado");
				this.projetoDao.update(cancelar_proj);
				
				//NotificaÃ§Ã£o
				try {
					NotifyController.enviarNotificacao("Projeto cancelado", 
						"O projeto: "+cancelar_proj.getTitulo()+" foi cancelado! Voce recebera 40% do valor já pago.", 
						this.projetoDao.getUsuarioByProjeto(cancelar_proj));	
				} catch (Exception e) {
					//Quer dizer que nao tem dev 
				}
				
								
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "confirmarInicioProjetoAction":
				String iniciar_id_projeto = request.getParameter("id_projeto");
				Projeto iniciar_proj = this.projetoDao.getById(Integer.valueOf(iniciar_id_projeto));
				Date dataInicio = new Date();
				iniciar_proj.setDataInicio(dataInicio);
								
				iniciar_proj.setStatus("iniciado");
				this.projetoDao.update(iniciar_proj);
				
				//NotificaÃ§Ã£o
				NotifyController.enviarNotificacao("Inicio do projeto confirmado",
						"Inicio do projeto confirmado pelo desenvolvedor!", 
						iniciar_proj.getEmpresario().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projetosatuados.jsp").forward(request,response);
			break;
			case "encerrarProjetoAction":
				String id_projeto4 = request.getParameter("id_projeto");
				Projeto encerrar_proje = this.projetoDao.getById(Integer.valueOf(id_projeto4));
				encerrar_proje.setPagamento2(true);
				encerrar_proje.setStatus("aguardando encerramento");
				this.projetoDao.update(encerrar_proje);
				
				NotifyController.enviarNotificacao("Projeto Encerrado",
						"O projeto "+encerrar_proje.getTitulo()+ " foi encerrado pelo Empresário "+encerrar_proje.getEmpresario().getUsuario().getNome()+ 
						", favor confirmar o encerramento do projeto! Não se esqueça de avaliar o Empresário!",  
						encerrar_proje.getDesenvolvedor().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;
			case "avaliarEmpresarioAction":
				String ava_comentario = request.getParameter("comentario");
				double ava_avaliacao = Double.parseDouble(request.getParameter("avaliacao"));
				Integer id_projeto_ava = Integer.parseInt(request.getParameter("id_projeto"));
							
				HttpSession sessionAvaliacao = request.getSession();
				Usuario userAvaliacao = (Usuario)sessionAvaliacao.getAttribute("usuario");
				
				Projeto projeto = this.projetoDao.getById(Integer.valueOf(id_projeto_ava));				
				Avaliacao avalia_emp = new Avaliacao();
				avalia_emp.setComentario(ava_comentario);
				avalia_emp.setGrau(ava_avaliacao);
				avalia_emp.setEmpresarioDestino(projeto.getEmpresario());
				avalia_emp.setRemetente(userAvaliacao);
				avalia_emp.setProjeto(projeto);
				GenericDAO save_ava = new GenericDAO();
				save_ava.save(avalia_emp);
				//
				UsuarioDAO userDao3 = new UsuarioDAO();
				Usuario user_x = userDao3.recalculaMedia(projeto.getEmpresario().getUsuario());
				userDao3.save(user_x);
				//NotificaÃ§Ã£o
				NotifyController.enviarNotificacao("Avalição recebida",
						"Você foi avaliado, para mais informações, favor acessar seu perfil.", 
						avalia_emp.getEmpresarioDestino().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "avaliarDesenvolvedorAction":
				String ava_comentario2 = request.getParameter("comentario");
				double ava_avaliacao2 = Double.parseDouble(request.getParameter("avaliacao"));
				Integer id_projeto_ava2 = Integer.parseInt(request.getParameter("id_projeto"));
											
				HttpSession sessionAvaliacao2 = request.getSession();
				Usuario userAvaliacao2 = (Usuario)sessionAvaliacao2.getAttribute("usuario");
				

				Projeto projeto2 = this.projetoDao.getById(Integer.valueOf(id_projeto_ava2));				
				Avaliacao avalia_emp2 = new Avaliacao();
				avalia_emp2.setComentario(ava_comentario2);
				avalia_emp2.setGrau(ava_avaliacao2);
				avalia_emp2.setDesenvolvedorDestino(projeto2.getDesenvolvedor());
				avalia_emp2.setRemetente(userAvaliacao2);
				avalia_emp2.setProjeto(projeto2);
				GenericDAO save_ava2 = new GenericDAO();
				save_ava2.save(avalia_emp2);
				//
				
				UsuarioDAO userDao2 = new UsuarioDAO();
				Usuario user_y = userDao2.recalculaMedia(projeto2.getDesenvolvedor().getUsuario());
				userDao2.save(user_y);
				
				
				//NotificaÃ§Ã£o
				NotifyController.enviarNotificacao("Avalição recebida",
						"Você foi avaliado, para mais informações, favor acessar seu perfil.", 
						avalia_emp2.getDesenvolvedorDestino().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projeto.jsp").forward(request,response);
			break;
			case "iniciarProjetoAction":
				String id_proj_in = request.getParameter("id_projeto");
				
				Projeto inicia_proje = this.projetoDao.getById(Integer.valueOf(id_proj_in));
				inicia_proje.setStatus("aguardando inicio");
				inicia_proje.setPagamento1(true);
				//vincula o Dev que teve seu lance aceito!
				Lance l = this.projetoDao.getLanceAtivoByProjeto(inicia_proje);
				inicia_proje.setDesenvolvedor(l.getDesenvolvedor());
				this.projetoDao.update(inicia_proje);
				inicia_proje = this.projetoDao.getById(inicia_proje.getId()); //atualiza!!!
				//
				
				//NotificaÃ§Ã£o
				NotifyController.enviarNotificacao("Projeto Iniciado",
				"O projeto "+inicia_proje.getTitulo()+ " foi iniciado pelo Empresário "+inicia_proje.getEmpresario().getUsuario().getNome()+ 
					", favor confirmar o inicio do projeto!", 
				inicia_proje.getDesenvolvedor().getUsuario());
				
				
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;	
			case "atualizarProjetoAction":
				String id_proj_at = request.getParameter("id_projeto");
				String at_titulo = request.getParameter("titulo");
				String at_desc = request.getParameter("descricao");
				String at_valor = request.getParameter("valor");
				String at_prazo = request.getParameter("prazo");
				Projeto atualiza_proje = this.projetoDao.getById(Integer.valueOf(id_proj_at));
				atualiza_proje.setTitulo(at_titulo);
				atualiza_proje.setDescricao(at_desc);
				atualiza_proje.setPrazo(Integer.valueOf(at_prazo));
				atualiza_proje.setValor(Float.valueOf(  at_valor.replace(",",".")));
				this.projetoDao.update(atualiza_proje);
				inicia_proje = this.projetoDao.getById(atualiza_proje.getId()); //atualiza!!!
				request.getRequestDispatcher("/maisfreela/projetospublicados.jsp").forward(request,response);
			break;	
			case "confirmarEncerramentoProjetoAction":
				String id_projeto_conf_enc = request.getParameter("id_projeto");
				Projeto conf_encer_proje = this.projetoDao.getById(Integer.valueOf(id_projeto_conf_enc));
				conf_encer_proje.setStatus("finalizado");
				this.projetoDao.update(conf_encer_proje);
				
				NotifyController.enviarNotificacao("Projeto Encerrado com Sucesso",
						"O encerramento do projeto "+conf_encer_proje.getTitulo()+ " foi confirmado pelo Desenvolvedor "+conf_encer_proje.getEmpresario().getUsuario().getNome()+ 
						", favor avaliar o Desenvolvedor!",  
						conf_encer_proje.getEmpresario().getUsuario());
				
				request.getRequestDispatcher("/maisfreela/projetosatuados.jsp").forward(request,response);	
			break;
		}
	}
}


