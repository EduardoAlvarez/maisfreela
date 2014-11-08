<%@ page language="java" contentType="text/html;charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"
	import="model.Projeto"%>

<%@include file="header.jsp"%>

<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>"alguma coisa"</div>
	</div>
	<div class='large-9 columns panel-list'>
		<div class='content'>

			<%
				ArrayList<Projeto> projetos = (ArrayList<Projeto>) request
						.getAttribute("projetos");

				try {
					for (Projeto proj : projetos) {
			%>

			<div class='row'>
				<div class='large-12 columns'>
					<div class='nome-projeto'>
						<%=proj.getTitulo()%>
					</div>
					<div class='info-projeto'>
						<span class='valor-projeto'> <span class='valor-label'>Valor:
								</span> R$ <%=proj.getValor()%>
						</span> <span class='prazo-projeto'> <span class='prazo-label'>Prazo:</span>
							<%=proj.getPrazo()%> dias
						</span>
					</div>
					<div class='desc-projeto'>
						<%=proj.getDescricao()%>
					</div>
					<div class='tags'>
						<span class='tag-label'>Tags:</span> <span class='tag'>HTML</span>
					</div>
				</div>
			</div>
			<%
				}
				} catch (Exception e) {
					out.print("Sem projetos...");
				}
			%>

		</div>
	</div>
</div>
<%@include file="footer.jsp"%>