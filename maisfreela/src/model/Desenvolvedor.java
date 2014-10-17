package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity(name="Desenvolvedor")
@Table(name = "Desenvolvedor", schema = "maisfreela")  
public class Desenvolvedor extends Usuario{
	
	@OneToMany
	@Cascade(CascadeType.ALL)
	private List<Tag> tags;
	
	@OneToMany
	@Cascade(CascadeType.ALL)
	private List<Projeto> projetosAtuados;
 
}
