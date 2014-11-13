
<div class='sidemenu'>
	<div class='header_perfil'>Meu Perfil</div>
	<a 	href="<%=request.getContextPath()%>/usuario/dadosPessoais" type='button'>Dados Pessoais</a>
	<a 	href="<%=request.getContextPath()%>/usuario/minhasAvaliacoes" type='button'>Minhas Avaliações</a>
	<a 	href="<%=request.getContextPath()%>/usuario/dadosFinanceiros" type='button'>Dados Financeiros</a>
	<%if(UserController.isLogged("empresario", user)){ %>
		<a 	href="<%=request.getContextPath()%>/projeto/projetosPublicados" type='button'>Projetos publicados</a>
	<%}%>
	<%if(UserController.isLogged("desenvolvedor", user)){ %>
		<a 	href="<%=request.getContextPath()%>/projeto/projetoAtuais" type='button'>Projetos atuais</a>
	<%}%>
</div>