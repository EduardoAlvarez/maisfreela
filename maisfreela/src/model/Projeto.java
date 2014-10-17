package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
public class Projeto {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_projeto")
	private int id;
	private String titulo;
	
	//@OneToMany(mappedBy="projeto", fetch=FetchType.LAZY)
	//@Cascade(CascadeType.ALL)
	//private List<Tag> tags;
	
	private double valor;
	private Date prazo;
	private String descricao;
	private String status; //arrumar depois!!!
	
	//@OneToMany(mappedBy="projeto", fetch=FetchType.LAZY)
	//@Cascade(CascadeType.ALL)
	//private List<Lance> lances;
	
	/*@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_desenvolvedor")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Desenvolvedor freelancer;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_empresario")
	@Cascade(CascadeType.SAVE_UPDATE)
	private Empresario empresario;*/
	
	
	 
	private boolean pagamento1;
	private boolean pagamento2;
	private Date dataInicio;
	private Date dataTermino;
	
	 
	

	
	
	
}
