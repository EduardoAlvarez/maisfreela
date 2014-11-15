<%@page import="controller.UserController"%>
<%@ page language="java"%>
<%@include file="header.jsp"%>
<%
	if(UserController.isLogged(user)){
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/perfil.css" />
<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
		</div>
	</div>
	<div class='large-9 columns menu-left'>
		<div class='content'>
			<!-- action='/maisfreela/usuario/editUsuario' -->
			<form method='post'>
				<label for='nome'>Banco</label> <input required
					value='
					<%try{%>	
						<%=user.getDesenvolvedor().getConta().getBanco()%>
					<%}catch(Exception e){} %>'
					type='text' name='nome' id='nome'> <label for='sobre'>Agência</label>
				<textarea required name='sobre' required id='sobre'>
				<%try{%>
					<%=user.getDesenvolvedor().getConta().getAgencia()%>
					<%}catch(Exception e){}%></textarea>
				<label for='telefone'>Conta Corrente</label> <input required
					type='text' name='telefone' id='telefone'
					value='
					<%try{%>
						<%=user.getDesenvolvedor().getConta().getContaCorrente()%>
					<%}catch(Exception e){}%>'>
				<button type='submit'>Confirmar</button>
				<button class='alert' type='submit'>Cancelar</button>
				<div class='clear'></div>
			</form>
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>
<%
	}else{
%>
<script>
	window.location = "/maisfreela/acessonegado";
</script>
<%
	}
%>