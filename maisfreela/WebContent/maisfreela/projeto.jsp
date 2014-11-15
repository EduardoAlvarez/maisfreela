<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>

<div class='row main-list'>
	<%@include file="sidemenu.jsp"%>
	<div class='large-9 columns panel-list'>
		<div class='content'>

			<%
				request.setCharacterEncoding("UTF-8");
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
					
					<%
						List<Tag> tags = proj.getTags();
						if(tags.size() > 0){
							%>
					<div class='tags'>
						<span class='tag-label'>Tags:</span>
						<%for(Tag tag : tags){ %>
						<span class='tag'><%=tag.getNome()%></span>
						<%} %>
					</div>
					<% }%>
				</div>
			</div>
			<%}
					}
				catch (Exception e) {
					out.print("Sem projetos...");
				}
			%>

		</div>
	</div>
</div>
<%@include file="footer.jsp"%>