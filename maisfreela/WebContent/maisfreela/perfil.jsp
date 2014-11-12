<%@page import="controller.UserController"%>
<%@ page language="java"  %>
<%@include file="header.jsp"%>
<%if(UserController.isLogged(user)){%>
<div class= 'row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<div class='header_perfil'>Meu Perfil</div>
			<a 	href="<%=request.getContextPath()%>/usuario/dadosPessoais" type='button'>Dados Pessoais</a>
			<a 	href="<%=request.getContextPath()%>/usuario/dadosPublicos" type='button'>Dados Públicos</a>
			<a 	href="<%=request.getContextPath()%>/usuario/minhasAvaliacoes" type='button'>Minhas Avaliações</a>
			<a 	href="<%=request.getContextPath()%>/usuario/dadosFinanceiros" type='button'>Dados Financeiros</a>
			
			
			<%if(UserController.isLogged("empresario", user)){ %>
				<a 	href="<%=request.getContextPath()%>/projeto/projetosPublicados" type='button'>Projetos publicados</a>
			<%}%>
			<%if(UserController.isLogged("desenvolvedor", user)){ %>
				<a 	href="<%=request.getContextPath()%>/projeto/projetoAtuais" type='button'>Projetos atuais</a>
			<%}%>
			
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