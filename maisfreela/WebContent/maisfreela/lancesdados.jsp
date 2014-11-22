<%@page import="dao.ProjetoDAO"%>
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
			<div class='header_projeto'><%=projeto.getTitulo()%></div>
			<%
				ProjetoDAO projDao = new ProjetoDAO();
				List<Lance> lances = projDao.getLancesByProjeto(projeto);

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
								<% 
								Float l = lanc.getValor();
								out.print(l.toString().replace(".", ",")); %>
							</span>
						</div>
						<div class='large-2 columns'>
						<%if(user.getEmpresario().isOwner(projeto, user) && (projeto.getStatus().equals("novo") || projeto.getStatus().equals("pendente"))){ %>
							<form method='post' action='<%=request.getContextPath()%>/projeto/aceitarLanceAction'>
								<input type='hidden' value='<%=projeto.getId()%>' name='id_projeto'>
								<input type='hidden' value='<%=lanc.getId()%>' name='id_lance'>
								<button class='success' type='submit'>Aceitar</button>								
							</form>
						<%} %>
						</div>
				</div>
			</div>
			</div>
			<%}
					}
				catch (Exception e) {
					out.print("Não existem Lances para este projeto!");
				}
			%> 
		</div>
		

		</div>
	</div>

<%@include file="footer.jsp"%>