package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "avaliacao")  
public class Avaliacao {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_avaliacao")
	private long id;
	
	private double grau;
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public double getGrau() {
		return grau;
	}


	public void setGrau(double grau) {
		this.grau = grau;
	}


	public String getComentario() {
		return comentario;
	}


	public void setComentario(String comentario) {
		this.comentario = comentario;
	}


	public Desenvolvedor getDesenvolvedorDestino() {
		return desenvolvedorDestino;
	}


	public void setDesenvolvedorDestino(Desenvolvedor desenvolvedorDestino) {
		this.desenvolvedorDestino = desenvolvedorDestino;
	}


	public Empresario getEmpresarioDestino() {
		return empresarioDestino;
	}


	public void setEmpresarioDestino(Empresario empresarioDestino) {
		this.empresarioDestino = empresarioDestino;
	}


	private String comentario;	
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_desenvolvedor", nullable=true)
	@Cascade(CascadeType.SAVE_UPDATE)
	private Desenvolvedor desenvolvedorDestino;
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_empresario", nullable=true)
	@Cascade(CascadeType.SAVE_UPDATE)
	private Empresario empresarioDestino;

}
