package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Lance {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_lance")
	private int id;
	public void setId(int id) {
		this.id = id;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public int getId() {
		return id;
	}

	public double getValor() {
		return valor;
	}

	public String getComentario() {
		return comentario;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	private double valor;
	private String comentario;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_projeto")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Projeto projeto;
}
