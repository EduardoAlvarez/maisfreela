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
	private UsuarioDAO userDao;
    /**
     * Default constructor. 
     */
    public ServletUsuario() {
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Usuario usuario = new Desenvolvedor();
			usuario.setNome("Eduardo Alvarez");
			usuario.setCpf("40536468800");
			usuario.setLogin("eduardo.alvarez");
			usuario.setSenha("123456");
			usuario.setSobre("Desenvolvedor PHP a 3 anos");
			userDao.save(usuario);
	}

}
