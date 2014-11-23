<%@ page language="java"  %>

<%@include file="header.jsp"%>

<style>
	textarea {
		height: 100px;
	}			
	#required_pass{
		color:red;
		font-size:10px;
		margin-top: -20px;
	}
</style>


	<div class= 'row main-list'>
		<div class='large-12 columns panel-list'>
			<form class='form-center'>
				<label for="nome">Nome Completo</label>
				<input required type='text' name='nome' id='nome'>
				
				
				<label for="Email">Email</label>
				<input required type='text' name='Email' id='Email'>
				
				
				<label for="mensagem">Mensagem</label>
				<textarea id='mensagem' name='mensagem'></textarea>
				
				<button id='submit' type='submit'>Enviar</button>
				<button class="alert" type='button'>Cancelar</button>
			</form>							
		</div>		
	</div>
	

<%@include file="footer.jsp"%>