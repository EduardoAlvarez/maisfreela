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
	
	@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="desenvolvedor_has_tags", 
    joinColumns={@JoinColumn(name="id_tag")}, 
    inverseJoinColumns={@JoinColumn(name="id_desenvolvedor")})
	private List<Desenvolvedor> desenvolvedor;
	
	@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="projeto_has_tags", 
    joinColumns={@JoinColumn(name="id_tag")}, 
    inverseJoinColumns={@JoinColumn(name="id_projeto")})
	private List<Projeto> projeto;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Desenvolvedor> getDesenvolvedor() {
		return desenvolvedor;
	}

	public void setDesenvolvedor(List<Desenvolvedor> desenvolvedor) {
		this.desenvolvedor = desenvolvedor;
	}

	public List<Projeto> getProjeto() {
		return projeto;
	}

	public void setProjeto(List<Projeto> projeto) {
		this.projeto = projeto;
	}
}
