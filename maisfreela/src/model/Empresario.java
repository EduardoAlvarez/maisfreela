package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	
	@OneToMany
	private List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
	
	@OneToMany
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosPublicados;
	
	private float avaliacao;
	
	@OneToOne 
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;
}
