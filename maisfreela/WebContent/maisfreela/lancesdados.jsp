<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="model.Lance"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>
<%	request.setCharacterEncoding("UTF-8");	
	Projeto projeto = (Projeto)session.getAttribute("v_projeto");					
%>
<div class='row main-list'>
<div class='large-3 columns menu-left'>
		<div class='content'>
		<%@include file="sidemenu_projeto.jsp"%>
		</div>
</div>
	
	<div class='large-9 columns panel-list'>
		<div class='content'>
			<form method='post'>
			<div class='header_projeto'><%=projeto.getTitulo()%></div>
			<%
				List<Lance> lances = projeto.getLances();

				try {
					for (Lance lanc : lances) {
						String escolhido ="";
						if(lanc.isEscolhido()){
							escolhido = "escolhido";
						}
			%>

			<div class='row <%=escolhido%>'>
				<div class='large-12 columns'>
						<div class='lances-projeto'>
						<div class='large-7 columns'>
						<div class='autor'>
							<span class='desenvolvedor'>Desenvolvedor:</span>
							<%= lanc.getDesenvolvedor().getUsuario().getNome()%>
						</div>
						<div class='lance'>
							<%=lanc.getComentario() %>
						</div>
						</div>
						<div class='large-3 columns'> 
							<span class='valor'>
								<span class='valor'>Valor Proposto:</span>
								<%=lanc.getValor() %>
							</span>
						</div>
						<div class='large-2 columns'> 
							<button class='success' type='submit'>Aceitar</button>
						</div>
				</div>
			</div>
			</div>
			<%}
					}
				catch (Exception e) {
					out.print("Sem projetos...");
				}
			%>
			</form> 
		</div>
		

		</div>
	</div>

<%@include file="footer.jsp"%>