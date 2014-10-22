package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tag")  
public class Tag {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_tag")
	private int id;
	private String nome;
	
	@ManyToMany
    @JoinTable(name="desenvolvedor_has_tags", joinColumns=
    {@JoinColumn(name="id_desenvolvedor")}, inverseJoinColumns=
    {@JoinColumn(name="id_tags")})
	private List<Desenvolvedor> desenvolvedor;
	
	@ManyToMany
    @JoinTable(name="projeto_has_tags", joinColumns=
    {@JoinColumn(name="id_projeto")}, inverseJoinColumns=
    {@JoinColumn(name="id_tags")})
	private List<Projeto> projeto;
}
