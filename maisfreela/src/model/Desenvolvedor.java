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
@Table(name = "desenvolvedor")  
public class Desenvolvedor{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_desenvolvedor")
	private long id;
	
	public Desenvolvedor(Usuario user) {
		this.usuario =  user;
	}
	@OneToMany(mappedBy="desenvolvedorDestino", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
	
	@OneToMany(mappedBy="desenvolvedor" , fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Tag> tags;
	
	
	@OneToMany(mappedBy="desenvolvedor", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosAtuados;
	
	
	private float avaliacao;
	
	@OneToOne 
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;
 
}
