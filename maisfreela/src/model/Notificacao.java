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
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "notificacao")  
public class Notificacao {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_notificacao")
	private int id;
	
	private String titulo;
	
	private String descricao;
	
	private Date data;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario usuario;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_usuario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Usuario usuario_origem;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario_origem() {
		return usuario_origem;
	}

	public void setUsuario_origem(Usuario usuario_origem) {
		this.usuario_origem = usuario_origem;
	}
	
	
	
	
	
}
