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

@Entity
@Table(name = "empresario")
public class Empresario{
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_empresario")
	private long id;
	
	@OneToMany(mappedBy="empresarioDestino", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
	
	@OneToMany(mappedBy="empresario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosPublicados;
	
	private float avaliacao;
	
	@OneToOne 
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "id_contaBancaria")
	private ContaBancaria conta;
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public List<Avaliacao> getAvaliacoes() {
		return avaliacoes;
	}

	public void setAvaliacoes(List<Avaliacao> avaliacoes) {
		this.avaliacoes = avaliacoes;
	}

	public List<Projeto> getProjetosPublicados() {
		return projetosPublicados;
	}

	public void setProjetosPublicados(List<Projeto> projetosPublicados) {
		this.projetosPublicados = projetosPublicados;
	}

	public float getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(float avaliacao) {
		this.avaliacao = avaliacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public ContaBancaria getConta() {
		return conta;
	}

	public void setConta(ContaBancaria conta) {
		this.conta = conta;
	}

	
}
