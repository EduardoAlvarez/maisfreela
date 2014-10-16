package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Usuario {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_usuario")
	private int id;
	private String nome;
	private int perfil;
	private int cpf;
	private String endereco;
	private List<Integer> contato;
	private List<String> email;
	private String login;
	private String senha;
	private String sobre;
	
	public void setId(int id) {
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

	public void setNotificacoes(List<Notificacao> notificacoes) {
		this.notificacoes = notificacoes;
	}

	public void setAvaliacoes(List<Avaliacao> avaliacoes) {
		this.avaliacoes = avaliacoes;
	}

	public void setAvaliacao(double avaliacao) {
		this.avaliacao = avaliacao;
	}

	public int getId() {
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

	@OneToMany(mappedBy="usuario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Notificacao> notificacoes;
	
	@OneToMany(mappedBy="usuario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Avaliacao> avaliacoes;
	
	private double avaliacao;
}
