package model;

import java.util.Date;
import java.util.List;

public class Projeto {
	private String titulo;
	private List<Tag> tags;
	private double valor;
	private Date prazo;
	private String descricao;
	private String status; //arrumar depois!!!
	private List<Lance> lances;
	private boolean pagamento1;
	private boolean pagamento2;
	private Date dataInicio;
	private Date dataTermino;
	
}
