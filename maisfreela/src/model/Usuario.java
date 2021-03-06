package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import dao.DesenvolvedorDAO;
import dao.EmpresarioDAO;
import dao.UsuarioDAO;



@Entity
@Table(name = "usuario")  
public class Usuario  {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_usuario")
	private long id;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_desenvolvedor", nullable=true)
	private Desenvolvedor desenvolvedor;
	
	@OneToMany(mappedBy="remetente", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Avaliacao> avaliacoesCriadas = new ArrayList<Avaliacao>();	
	
	@OneToOne( fetch=FetchType.EAGER)
	@JoinColumn(name="id_empresario", nullable=true)
	private Empresario empresario;
	
	@OneToMany(mappedBy="usuario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Notificacao> notificacoes;
	@Column
	private String nome;
	private String cpf;
	public long getId() {
		return id;
	}
	
	private String endereco;
	private Integer telefone;
	private String email;
	private String login;
	private String senha;
	private String sobre;
	
	
	public Desenvolvedor getDesenvolvedor() {
		return desenvolvedor;
	}

	public void setDesenvolvedor(Desenvolvedor desenvolvedor) {
		this.desenvolvedor = desenvolvedor;
	}

	public Empresario getEmpresario() {
		return empresario;
	}

	public void setEmpresario(Empresario empresario) {
		this.empresario = empresario;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	public List<Notificacao> getNotificacoes() {
		
		return notificacoes;
	}
	public void setNotificacoes(List<Notificacao> notificacoes) {
		this.notificacoes = notificacoes;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Integer getTelefone() {
		return telefone;
	}
	public void setTelefone(Integer telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getSobre() {
		return sobre;
	}
	public void setSobre(String sobre) {
		this.sobre = sobre;
	}

	public static Usuario logar(String login, String senha) {
		UsuarioDAO userDao = new UsuarioDAO();
		Usuario usuario = userDao.getUsuarioByLoginAndSenha(login,senha);
		if(usuario != null){
			return usuario;
		}
		return null;
	}

	public void recalculaMedia() {
		Desenvolvedor dev = this.getDesenvolvedor();
		Empresario emp = this.getEmpresario();
		if(dev != null){
			//se ele for um dev
			UsuarioDAO userDAO = new UsuarioDAO();
			List<Avaliacao> avaliacoes = userDAO.getAvaliacoesbyDesenvolvedor(dev);
			if(avaliacoes.size() > 0){
				int qtde = avaliacoes.size();
				float soma = 0;
				for(Avaliacao aval : avaliacoes){
					soma += aval.getGrau();
				}
				dev.setAvaliacao(soma/qtde);
				DesenvolvedorDAO devDao = new DesenvolvedorDAO();
				devDao.update(dev);
			}
		}
		if(emp != null){
			///se ele for um emp
			UsuarioDAO userDAO = new UsuarioDAO();
			List<Avaliacao> avaliacoes = userDAO.getAvaliacoesbyEmpresario(emp);
			if(avaliacoes.size() > 0){
				int qtde = avaliacoes.size();
				float soma = 0;
				for(Avaliacao aval : avaliacoes){
					soma += aval.getGrau();
				}
				emp.setAvaliacao(soma/qtde);
				EmpresarioDAO empDao = new EmpresarioDAO();
				empDao.update(emp);
			}
		}
		
		
	}

	
}
