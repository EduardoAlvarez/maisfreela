<%@page import="dao.ProjetoDAO"%>
<%@ page language="java" 
    import="java.util.List"
	import="model.Projeto"
	import="model.Desenvolvedor"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>

<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
		<%@include file="sidemenu.jsp"%>
		</div>
	</div>
	<div class='large-9 columns panel-list'>
		<div class='content'>

			<%
			request.setCharacterEncoding("UTF-8");
			Desenvolvedor dev = user.getDesenvolvedor();
			ProjetoDAO projDAO = new ProjetoDAO();
			List<Projeto> projetos = projDAO.getProjetosByDesenvolvedor(dev);

				try {
					for (Projeto proj : projetos) {
			%>

			<div class='row'>
				<div class='large-12 columns'>
					<div class='nome-projeto'>
						<a href="<%=request.getContextPath()%>/projeto/visualizarProjeto?id_projeto=<%=proj.getId()%>"><%=proj.getTitulo()%></a>
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
						<span class= 'statusProj'>
						<span class= 'status-label'>Status:</span>
						<span class= 'status'><%=proj.getStatus()%></span>
						</span>
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