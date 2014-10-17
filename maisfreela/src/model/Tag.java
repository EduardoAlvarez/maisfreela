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

@Entity
public class Tag {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_tag")
	private int id;
	private String nome;
	
	@ManyToMany
    @JoinTable(name="usuario_has_tags", joinColumns=
    {@JoinColumn(name="id_usuario")}, inverseJoinColumns=
    {@JoinColumn(name="id_tags")})
	private List<Usuario> usuario;
	public void setId(int id) {
		this.id = id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setUsuario(List<Usuario> usuario) {
		this.usuario = usuario;
	}
	public void setProjeto(List<Projeto> projeto) {
		this.projeto = projeto;
	}
	public int getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
	public List<Usuario> getUsuario() {
		return usuario;
	}
	public List<Projeto> getProjeto() {
		return projeto;
	}
	@ManyToMany
    @JoinTable(name="projeto_has_tags", joinColumns=
    {@JoinColumn(name="id_projeto")}, inverseJoinColumns=
    {@JoinColumn(name="id_tags")})
	private List<Projeto> projeto;
}
