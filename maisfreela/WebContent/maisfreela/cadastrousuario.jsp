<%@ page language="java"  %>

<%@include file="header.jsp"%>

<div class= 'row main-list'>
	<div class='large-12 columns panel-list'>
		<div class='content'>
			<label for="nome">Nome Completo</label>
			<input type='text' name='nome' id='nome'>
			<label for="sobre">Sobre</label>
			<textarea id='sobre' name='sobre'></textarea>
			<label for="senha">Login</label>
			<input type='text' name='login' id='login'>
			<label for="senha">Senha</label>
			<input type='text' name='senha' id='senha'>
			<label for="senha">Confirmar Senha</label>
			<input type='text' name='cSenha' id='cSenha'>
			<fieldset>
				<legend>Perfil</legend>
				<input type='checkbox' id='dev' name='dev'>
				<label for="senha">Desenvolvedor</label> <br>
				
				<input type='checkbox' id='emp' name='emp'>
				<label for="senha">Empresário</label>
				
			</fieldset>
			
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>