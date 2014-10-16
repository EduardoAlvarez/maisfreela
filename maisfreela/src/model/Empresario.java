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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Empresario extends Usuario{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_empresario")
	private long id;
	
	@OneToMany(mappedBy="empresario", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosPublicados = new ArrayList<Projeto>();

	public void setId(long id) {
		this.id = id;
	}

	public void setProjetosPublicados(List<Projeto> projetosPublicados) {
		this.projetosPublicados = projetosPublicados;
	}

	public long getId() {
		return id;
	}

	public List<Projeto> getProjetosPublicados() {
		return projetosPublicados;
	}
}
