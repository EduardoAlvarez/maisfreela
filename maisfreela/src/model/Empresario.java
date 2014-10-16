package model;

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
public class Empresario extends Usuario{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_empresario")
	private int id;
	
	@OneToMany(mappedBy="empresario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosPublicados;

	public void setId(int id) {
		this.id = id;
	}

	public void setProjetosPublicados(List<Projeto> projetosPublicados) {
		this.projetosPublicados = projetosPublicados;
	}

	public int getId() {
		return id;
	}

	public List<Projeto> getProjetosPublicados() {
		return projetosPublicados;
	}
}
