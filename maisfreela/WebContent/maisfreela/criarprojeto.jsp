<%@ page language="java"  %>
<%@include file="header.jsp"%>

<div class='row main-list'>
	<div class='large-12 columns panel-list'>
		<form class='form-center'>
			<label for="titulo">Título do Projeto</label>
			<input required type='text' name='titulo' id='titulo'>
			
			<label for="valor">Valor</label>
			<input required type='text' name='valor' id='valor'>
			
			<label for="prazo">Prazo</label>
			<input required type='text' name='prazo' id='prazo'>
						
		</form>
	</div>
</div>


<%@include file="footer.jsp"%>