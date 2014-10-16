package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Usuario {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_usuario")
	private long id;
	
	
	@OneToMany(mappedBy="usuario_notificacao")
	private List<Notificacao> notificacoes = new ArrayList<Notificacao>();  ;
	
	@OneToMany(mappedBy="usuario_avaliacao")
	private List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();  ;; 	
	
	@Column
	private String nome;
	private int perfil;
	private int cpf;
	private String endereco;
	private List<Integer> contato;
	private List<String> email;
	private String login;
	private String senha;
	private String sobre;
	
	
	private double avaliacao;
	
	public void setId(long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public void setCpf(int cpf) {
		this.cpf = cpf;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public void setContato(List<Integer> contato) {
		this.contato = contato;
	}

	public void setEmail(List<String> email) {
		this.email = email;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setSobre(String sobre) {
		this.sobre = sobre;
	}

	public void setNotificacoes(Notificacao notificacoes) {
		this.notificacoes.add(notificacoes);
	}

	public void setAvaliacoes(Avaliacao avaliacoes) {
		this.avaliacoes.add(avaliacoes);
	}

	public void setAvaliacao(double avaliacao) {
		this.avaliacao = avaliacao;
	}

	public long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public int getPerfil() {
		return perfil;
	}

	public int getCpf() {
		return cpf;
	}

	public String getEndereco() {
		return endereco;
	}

	public List<Integer> getContato() {
		return contato;
	}

	public List<String> getEmail() {
		return email;
	}

	public String getLogin() {
		return login;
	}

	public String getSenha() {
		return senha;
	}

	public String getSobre() {
		return sobre;
	}

	public List<Notificacao> getNotificacoes() {
		return notificacoes;
	}

	public List<Avaliacao> getAvaliacoes() {
		return avaliacoes;
	}

	public double getAvaliacao() {
		return avaliacao;
	}

	
}
