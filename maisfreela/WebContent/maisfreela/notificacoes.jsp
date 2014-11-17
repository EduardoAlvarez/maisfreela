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
							<span class='desenvolvedor'>Desenvolvedor:</span>							
						</div>
						<div class=''>
						<%= %>
						</div>
						
						</div>
						<div class='large-3 columns'> 
							<button class='success' type='submit'>Responder</button>
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