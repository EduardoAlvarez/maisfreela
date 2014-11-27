<%@ page language="java" import="java.util.ArrayList"
	import="model.Projeto" import="java.util.List" import="model.Tag"%>
<%@include file="header.jsp"%>
<%Projeto projeto = (Projeto)session.getAttribute("v_projeto");%>
<style>
.status {
	float: right;
	font-size: 13px;
}
</style>
<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu_projeto.jsp"%>
		</div>
	</div>
</div>
<div class='large-9 columns panel-list'>
	<div class='content'>
		<form method='post'
			action='<%=request.getContextPath()%>/projeto/atualizarProjetoAction'>
			<div class='header_projeto'><%=projeto.getTitulo()%></div>
			<input type='hidden' value='<%=projeto.getId()%>' name='id_projeto'>
			<label for='titulo'>Titulo:</label> <input required
				value='<%=projeto.getTitulo()%>' type='text' name='titulo'
				id='titulo'> <label for='valor'>Valor;</label>
			<textarea required name='valor' required id='valor'><%=projeto.getValor()%></textarea>
			<label for='prazo'>Prazo:</label> <input required type='text'
				name='prazo' id='prazo' value='<%=projeto.getPrazo()%>'> <label
				for='descricao'>Descrição:</label> <input required type='text'
				name='descricao' id='descricao' value='<%=projeto.getDescricao()%>'>
			<%
						List<Tag> tags = projeto.getTags();
						if(tags.size() > 0){
							%>
			<div class='tags'>
				<label for='tags'>Tags:</label>
				<%for(Tag tag : tags){ %>
				<span class='tag'><%=tag.getNome()%></span>
				<%} }%>
				<span class='status'>Status: <%= projeto.getStatus()%></span>
			</div>
			<br>

			<%
				UserController usuario_logado = new UserController();
				if(usuario_logado.isLogged("empresario", user) == true){
					if(user.getEmpresario().isOwner(projeto, user)) { %>
			<button type='submit'>Confirmar</button>
			<button class='alert' type='submit'>Cancelar</button>
			<%	} 
				}%>

			<div class='clear'></div>
		</form>
	</div>


</div>
</div>
<%@include file="footer.jsp"%>