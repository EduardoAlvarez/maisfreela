package model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Notificacao {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_notificacao")
	private int id;
	public int getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public String getDescricao() {
		return descricao;
	}

	public Date getData() {
		return data;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	private String titulo;
	private String descricao;
	private Date data;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario usuario;
	
	@OneToMany(mappedBy="notificacao", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private Projeto projeto;
	
}
