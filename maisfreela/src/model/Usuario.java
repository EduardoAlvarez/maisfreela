package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "ic_usuario", discriminatorType = DiscriminatorType.INTEGER)
@DiscriminatorValue(value = "0")
@Table(name = "Usuario")
public class Usuario  {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_usuario")
	private long id;
	
	@Column(name = "tipo_usuario", length = 1, nullable = false, insertable = true, updatable = true)
	private Character tipoUsuario;
	
	
	@OneToMany
	private List<Notificacao> notificacoes;
	
	@OneToMany
	private List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>(); 	
	
	@Column
	private String nome;
	private int perfil;
	private int cpf;
	private String endereco;
	
	@OneToMany
	private List<Telefone> telefones;
	
	@OneToMany
	private List<Email> emails;
	private String login;
	private String senha;
	private String sobre;
	
	private double avaliacao;

	
}
