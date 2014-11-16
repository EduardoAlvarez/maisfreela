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
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/projeto.css" />
<div class='sidemenu sidemenu_projeto'>
	<div class='header_projeto'>Projeto</div>
	<a 	href="<%=request.getContextPath()%>/projeto/visualizarProjeto" 		type='button'>O projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/lancesDados" 			type='button'>Lances dados</a>
	<a 	href="<%=request.getContextPath()%>/projeto/iniciarProjeto" 		type='button'>Iniciar projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/reabrirProjeto" 		type='button'>Re-abrir projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/encerrarProjeto" 		type='button'>Encerrar projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/cancelarProjeto" 		type='button'>Cancelar projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/darLance" 				type='button'>Dar um lance</a>
	<a 	href="<%=request.getContextPath()%>/projeto/confirmarProjeto" 		type='button'>Confirmar inicio</a>
	<a 	href="<%=request.getContextPath()%>/projeto/confirmarEncerramento" 	type='button'>Confirmar encerramento</a>
	<a 	href="<%=request.getContextPath()%>/projeto/avaliarEmpresario" 		type='button'>Avaliar Empresário</a>
	<a 	href="<%=request.getContextPath()%>/projeto/avaliarDesenvolvedor" 	type='button'>Avaliar Desenvolvedor</a>
</div>

