package model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import dao.DesenvolvedorDAO;
import dao.ProjetoDAO;

@Entity
@Table(name = "desenvolvedor")  
public class Desenvolvedor{
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_desenvolvedor")
	private long id;
	public Desenvolvedor(){
		
	}
	public Desenvolvedor(Usuario user) {
		this.usuario =  user;
	}
	@OneToMany(mappedBy="desenvolvedorDestino", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Avaliacao> avaliacoes;
	
	
	
	@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="desenvolvedor_has_tags", 
    joinColumns={@JoinColumn(name="id_desenvolvedor")}, 
    inverseJoinColumns={@JoinColumn(name="id_tag")})
	private List<Tag> tags;
	
	@OneToMany(mappedBy="desenvolvedor", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosAtuados;
	
	
	private float avaliacao;
	
	@OneToOne(fetch=FetchType.EAGER)
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

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Projeto> getProjetosAtuados() {
		return projetosAtuados;
	}

	public void setProjetosAtuados(List<Projeto> projetosAtuados) {
		this.projetosAtuados = projetosAtuados;
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
 
	public boolean isWorker(Projeto projeto, Usuario user){
		boolean isWorker = false;
		Desenvolvedor dev = user.getDesenvolvedor();
		ProjetoDAO projDao = new ProjetoDAO();
		for(Projeto proj :  projDao.getProjetosByDesenvolvedor(dev)){
			if(proj.getId() == projeto.getId()){
				isWorker = true;
			}
		}
		return isWorker;
	}
	
	
}
