<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>
<div class='row main-list'>
<div class='large-3 columns menu-left'>
		<div class='content'>
		<%@include file="sidemenu_projeto.jsp"%>
		</div>
</div>
	
	<div class='large-9 columns panel-list'>
		<div class='content'>
			<form method='post'>
			<%		Projeto projeto = (Projeto)session.getAttribute("v_projeto");					
			%>
			<label for='titulo'>Titulo:</label>
				<input required value='<%=projeto.getTitulo()%>' type='text' name='titulo' id='titulo'>
				<label for='valor'>Valor;</label>
				<textarea required name='valor' required id='valor'><%=projeto.getValor()%></textarea>
				<label  for='prazo'>Prazo:</label>
				<input required type='text' name='prazo' id='prazo' value='<%=projeto.getPrazo()%>'>
				<%
						List<Tag> tags = projeto.getTags();
						if(tags.size() > 0){
							%>
					<div class='tags'>
						<label for='tags'>Tags:</label>
						<%for(Tag tag : tags){ %>
						<span class='tag'><%=tag.getNome()%></span>
						<%} }%>
				
					</div>
				<label  for='descricao'>Descri��o:</label>
				<input required type='text' name='descricao' id='descricao' value='<%=projeto.getDescricao()%>'>
				<button type='submit'>Confirmar</button>
				<button class='alert' type='submit'>Cancelar</button>
				<div class='clear'></div>
			</form> 
		</div>
		

		</div>
	</div>
</div>
<%@include file="footer.jsp"%>