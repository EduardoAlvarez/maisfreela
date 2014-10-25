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
@Table(name = "lance")  
public class Lance {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_lance")
	private int id;
	
	private float valor;
	private String comentario;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_projeto")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Projeto projeto;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_desenvolvedor")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Desenvolvedor desenvolvedor;	
}
