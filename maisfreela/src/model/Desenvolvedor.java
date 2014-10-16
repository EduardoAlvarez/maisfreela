package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Desenvolvedor extends Usuario{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_desenvolvedor")
	private long id;

	
	@OneToMany(mappedBy="desenvolvedor", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Tag> tags = new ArrayList<Tag>();
	
	@OneToMany(mappedBy="desenvolvedor", fetch=FetchType.LAZY)
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosAtuados = new ArrayList<Projeto>();

	public List<Tag> getTags() {
		return tags;
	}

	public long getId() {
		return id;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Projeto> getProjetosAtuados() {
		return projetosAtuados;
	}

	public void setProjetosAtuados(List<Projeto> projetosAtuados) {
		this.projetosAtuados = projetosAtuados;
	}

	public void setId(long id) {
		this.id = id;
	} 
}
