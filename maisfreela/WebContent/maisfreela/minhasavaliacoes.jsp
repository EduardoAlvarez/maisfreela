<%@page import="controller.UserController"%>
<%@ page language="java"  %>
<%@include file="header.jsp"%>
<%if(UserController.isLogged(user)){%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/perfil.css"/>
<div class= 'row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
		</div>
	</div>
	<div class='large-9 columns menu-left'>
		<div class='content'>
			<!-- action='/maisfreela/usuario/editUsuario' -->
			<form method='post'>
				<label for='nome'>Nome</label>
				<input required value='<%=user.getNome()%>' type='text' name='nome' id='nome'>
				<label for='sobre'>Sobre</label>
				<textarea required name='sobre' required id='sobre'><%=user.getSobre()%></textarea>
				<label  for='telefone'>Telefone</label>
				<input required type='text' name='telefone' id='telefone' value='<%=user.getTelefone()%>'>
				<label  for='email'>Email</label>
				<input required type='text' name='email' id='email' value='<%=user.getEmail()%>'>
				<label  for='cpf'>CPF</label>
				<input required type='text' name='cpf' id='cpf' value='<%=user.getCpf()%>'>
				<button type='submit'>Confirmar</button>
				<button class='alert' type='submit'>Cancelar</button>
				<div class='clear'></div>
			</form> 
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>
<%
}else{%>
	<script>
		window.location="/maisfreela/acessonegado"; 
	</script> 
<%}%>