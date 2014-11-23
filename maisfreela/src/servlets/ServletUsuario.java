package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Desenvolvedor;
import model.Empresario;
import model.Usuario;
import dao.DesenvolvedorDAO;
import dao.EmpresarioDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet({ "/usuario/cadastraUsuario", "/usuario/visualizaDesenvolvedores",
		"/usuario/login", "/usuario/logar"  , "/usuario/visualizaUsuario" , "/usuario/sair","/usuario/perfil",
		"/usuario/dadosPessoais","/usuario/dadosFinanceiros","/usuario/minhasAvaliacoes", "/usuario/visualizarNotificacoes",
		"/usuario/cadastrarUsuarioAction"})
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO userDao = new UsuarioDAO();
	private DesenvolvedorDAO devDao = new DesenvolvedorDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length-1];
		switch (acao) {
			case "dadosPessoais":
				request.getRequestDispatcher("/maisfreela/dadospessoais.jsp").forward(request,response);
			break;
			case "dadosFinanceiros":
				request.getRequestDispatcher("/maisfreela/dadosfinanceiros.jsp").forward(request,response);
			break;
			case "minhasAvaliacoes":
				
				request.getRequestDispatcher("/maisfreela/minhasavaliacoes.jsp").forward(request,response);
			break;
			case "cadastraUsuario":
				request.getRequestDispatcher("/maisfreela/cadastrousuario.jsp").forward(request,response);
			break;
			case "visualizaUsuario":
				String id = request.getParameter("id_usuario");
				UsuarioDAO userDAO = new UsuarioDAO();
				Usuario usuario = userDao.getById(Integer.valueOf(id)); 
				request.setAttribute("v_usuario",usuario);
				request.getRequestDispatcher("/maisfreela/usuario.jsp").forward(request,response);
			break;
			case "visualizaDesenvolvedores":
				ArrayList<Desenvolvedor> lista = devDao.getAll();
				request.setAttribute("desenvolvedores", lista);
				request.getRequestDispatcher("/maisfreela/desenvolvedores.jsp").forward(request,response);
			break;
			case "login":
				request.getRequestDispatcher("/maisfreela/login.jsp").forward(request,response);
			break;
			case "sair":
				 HttpSession session = request.getSession();
				 session.setAttribute("usuario" , null);
				 response.sendRedirect("/maisfreela/home");
			break;
			case "perfil":
				request.getRequestDispatcher("/maisfreela/perfil.jsp").forward(request,response);
			break;
			case "visualizarNotificacoes":
				request.getRequestDispatcher("/maisfreela/notificacoes.jsp").forward(request,response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String[] aux = url.split("/");
		String acao = aux[aux.length - 1];
		switch (acao) {
			case "logar":
				String login = request.getParameter("login");
				String senha = request.getParameter("senha");
				Usuario user = Usuario.logar(login, senha);
				if (user != null) {
					request.setAttribute("status", "1");
					HttpSession session = request.getSession();
					session.setAttribute("usuario", user); 
					System.out.println(session);
					response.sendRedirect("/maisfreela/home");
				} else {
					request.setAttribute("status", "0");
					request.getRequestDispatcher("/maisfreela/login.jsp").forward(request, response);
				}
			break;
			case "cadastrarUsuarioAction":
				String nome 	= request.getParameter("nome");
				String sobre 	= request.getParameter("sobre");
				String login_u	= request.getParameter("login");
				String senha1 	= request.getParameter("senha_c");
				String emp 		= request.getParameter("emp");
				String dev 		= request.getParameter("dev");
				Usuario user_p = new Usuario();
				user_p.setNome(nome);
				user_p.setSobre(sobre);
				user_p.setLogin(login_u);
				user_p.setSenha(senha1);
				UsuarioDAO userDao = new UsuarioDAO();
				user_p.setEmail("");
				user_p.setCpf("");
				userDao.save(user_p);
				user_p = userDao.getLast();
				
				if(emp.equals("on")){
					Empresario emp_e = new Empresario();
					user_p.setEmpresario(emp_e);
					emp_e.setUsuario(user_p);
					emp_e.setAvaliacao(0);
					EmpresarioDAO empDao = new EmpresarioDAO();
					empDao.save(emp_e);
					
					user_p.setEmpresario(emp_e);
				}
				if(dev.equals("on")){
					Desenvolvedor dev_d = new Desenvolvedor();
					user_p.setDesenvolvedor(dev_d);
					dev_d.setAvaliacao(0);
					dev_d.setUsuario(user_p);
					DesenvolvedorDAO devDao = new DesenvolvedorDAO();
					devDao.save(dev_d);
					user_p.setDesenvolvedor(dev_d);
				}
				
				userDao.update(user_p);
				request.getRequestDispatcher("/maisfreela/login.jsp").forward(request, response);
			break;
		}
	}

}
