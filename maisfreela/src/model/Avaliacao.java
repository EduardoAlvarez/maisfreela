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
public class Avaliacao {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_avaliacao")
	private long id;
	
	private double grau;
	private String comentario;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_usuario")
	private Usuario usuarioDestino;

	public void setId(long id) {
		this.id = id;
	}

	public void setGrau(double grau) {
		this.grau = grau;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public long getId() {
		return id;
	}

	public double getGrau() {
		return grau;
	}

	public String getComentario() {
		return comentario;
	}

	/*public Usuario getUsuarioOrigem() {
		return usuarioOrigem;
	}
	*/
	public Usuario getUsuarioDestino() {
		return usuarioDestino;
	}

	/*public void setUsuarioOrigem(Usuario usuarioOrigem) {
		this.usuarioOrigem = usuarioOrigem;
	}*/

	public void setUsuarioDestino(Usuario usuarioDestino) {
		this.usuarioDestino = usuarioDestino;
	}
}
