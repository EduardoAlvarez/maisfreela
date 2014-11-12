<%@ page language="java"  %>
<%@include file="header.jsp"%>
<style>
	textarea {
		height: 100px;
	}			
</style>
<div class='row main-list'>
	<div class='large-12 columns panel-list'>
		<form class='form-center'>
			<label for="titulo">T�tulo do Projeto</label>
			<input required type='text' name='titulo' id='titulo'>
			
			<label for="valor">Valor</label>
			<input required type='text' name='valor' id='valor'>
			
			<label for="prazo">Prazo</label>
			<input required type='text' name='prazo' id='prazo'>
			
			<label for="competencias">Compet�ncias</label>
			<textarea required id="competencias" name="competencias"></textarea>			
			
			<label for="descricao">Descri��o</label>
			<textarea required id="descricao" name="descricao"></textarea>
			
			<button id="submit" type="submit">Publicar</button>
			<button class="alert" type="button">Cancelar</button>
						
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>