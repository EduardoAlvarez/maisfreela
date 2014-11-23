package controller;

import java.util.Date;

import dao.GenericDAO;
import model.Notificacao;
import model.Usuario;

public class NotifyController {
	public static void enviarNotificacao(String titulo  , String desc , Usuario userDestino){
		Notificacao not = new Notificacao();
		not.setData(new Date());
		not.setDescricao(desc);
		not.setTitulo(titulo);
		not.setUsuario(userDestino);
		GenericDAO dao = new GenericDAO();
		dao.save(not);
		return;
	}
}
