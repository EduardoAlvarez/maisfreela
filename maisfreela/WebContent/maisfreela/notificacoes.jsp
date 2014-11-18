<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="model.Notificacao"
	import="model.Lance"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>
<%	request.setCharacterEncoding("UTF-8");	
					
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
				List<Notificacao> notificacoes = user.getNotificacoes();

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
						<div class='descricao'><%=notif.getDescricao() %>
						</div>
						
						</div>
						<div class='large-3 columns'> 
							<a 	href="#" data-reveal-id="iniciarProjeto" type='button'>Responder</a>
						</div>
				</div>
			</div>
			</div>
			<%}
					}
				catch (Exception e) {
					out.print("Não há Notificações!");
				}
			%>
			</form> 
		</div>
		

		</div>
	</div>

<%@include file="footer.jsp"%>