package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Desenvolvedor;
import model.Usuario;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletUsuario
 */
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO userDao = new UsuarioDAO();
    /**
     * Default constructor. 
     */
    public ServletUsuario() {
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Usuario usuario = new Desenvolvedor();
			usuario.setNome("Henrique Barjas");
			usuario.setCpf("123456543300");
			usuario.setLogin("henrique.barjar");
			usuario.setSenha("54321");
			usuario.setSobre("Descriçao do usuário");
			usuario.setTipoUsuario(1);
			userDao.save(usuario);
	}

}
