<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>

<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content filtros'>
		<section><b>WEB</b>
			<ul>
				<li>PHP</li>
				<li>JAVA+Hibernate</li>
				<li>.NET</li>
				<li>JavaScript</li>
				<li>Ruby</li>
			</ul>
		</section>
		<section><b>Desktop</b>
			<ul>
				<li>C#</li>
				<li>JAVA</li>
				<li>C++</li>
				<li>Python</li>
				<li>Pearl</li>
			</ul>
		</section>
		<section><b>Bancos de Dados</b>
			<ul>
				<li>MySQL</li>
				<li>Oracle</li>
				<li>SQL Server</li>
				<li>Mongo DB</li>
			</ul>
		</section>
		<section><b>Mobile</b>
			<ul>
				<li>IOS</li>
				<li>Android</li>
				<li>Windows Phone</li>
				<li>Outros</li>
			</ul>
		</section>
		</div>
	</div>
	<div class='large-9 columns panel-list'>
		<div class='content'>

			<%
				request.setCharacterEncoding("UTF-8");
				
			ArrayList<Projeto> projetos = (ArrayList<Projeto>)user.getEmpresario().getProjetosPublicados();

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