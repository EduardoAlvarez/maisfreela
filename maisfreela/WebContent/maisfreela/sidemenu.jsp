<script>
$(function(){
	var url = location.pathname.split("/");
	var acao = url[url.length - 1];
	$.each($(".sidemenu a"), function(){
		if($(this).attr('href').indexOf(acao) !==-1){
			$(this).addClass('active'); 
		}
	})
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/perfil.css" />
<div class='sidemenu'>
	<div class='header_perfil'>Meu Perfil</div>
	<a 	href="<%=request.getContextPath()%>/usuario/dadosPessoais" type='button'>Dados Pessoais</a>
	<a 	href="<%=request.getContextPath()%>/usuario/minhasAvaliacoes" type='button'>Minhas Avaliações</a>
	<a 	href="<%=request.getContextPath()%>/usuario/dadosFinanceiros" type='button'>Dados Financeiros</a>
	<%if(UserController.isLogged("empresario", user)){ %>
		<a 	href="<%=request.getContextPath()%>/projeto/projetosPublicados" type='button'>Projetos publicados</a>
	<%}%>
	<%if(UserController.isLogged("desenvolvedor", user)){ %>
		<a 	href="<%=request.getContextPath()%>/projeto/projetosAtuados" type='button'>Projetos Atuados</a>
	<%}%>
</div>