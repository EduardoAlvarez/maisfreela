<%@ page language="java" import="java.util.ArrayList"
	import="model.Projeto" import="model.Notificacao" import="model.Lance"
	import="java.util.List" import="model.Tag"  import="dao.UsuarioDAO"%>


<%@include file="header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
		</div>
	</div>

	<div class='large-9 columns panel-list'>
		<div class='content'>
			<form method='post'>
				<div class='header_projeto'>Notificações</div>
				<%
				
					UsuarioDAO notif1 = new UsuarioDAO();
					List<Notificacao> notificacoes = notif1.getNotificacoesbyUsuario(user);
					
								try {
									for (Notificacao notif : notificacoes) {
				%>

				<div class='row'>
					<div class='large-12 columns'>
						<div class='notificacoes'>
							<div class='large-9 columns'>
								<div class='autor'>
									<span class='titulo'><%=notif.getTitulo()%></span>
								</div>
								<div class='descricao'><%=notif.getDescricao()%>
								</div>

							</div>
							<div class='large-3 columns'>
								<button class='success' href="#" data-reveal-id="responder" type='submit'>Responder</button>
							</div>

							<div id="responder" class="reveal-modal" data-reveal>
								<form>
									<h3>Insira a sua resposta no campo abaixo:</h3>
									<textarea name='comentario' id='comentario'></textarea>

									<a onclick="fechar()" class='button alert'>Cancelar</a> <a
										class="close-reveal-modal">&#215;</a>
									<button type='submit'>Encaminhar</button>
							</div>
						</div>
					</div>
				</div>
				<%
					}
									}
								catch (Exception e) {
									out.print(e);
								}
				%>
			</form>
		</div>


	</div>
</div>

<script>
	function fechar() {
		$('[data-reveal]').foundation('reveal', 'close')
	}
</script>

<%@include file="footer.jsp"%>