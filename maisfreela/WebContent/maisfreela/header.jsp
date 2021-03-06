<%@page import="controller.UserController"%>
<%@ page language="java" 
	contentType="text/html" 
	pageEncoding="ISO-8859-1"  
	import="model.Usuario"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mais Freela | Seja bem vindo</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/foundation.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/menu.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/menu.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/login.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/form.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list-projetos.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list-desenvolvedores.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/projeto.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/notificacoes.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/active.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/smart_wizard.css" />
<script src="<%=request.getContextPath()%>/maisfreela/js/vendor/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/maisfreela/js/vendor/modernizr.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/maisfreela/js/foundation.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/maisfreela/js/jquery.smartWizard.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$(document).foundation();
		$(document).foundation('orbit', {
			timer_speed : 10000,
			animation_speed : 500,
			bullets : true,
			stack_on_small : true
		});
	
		var url = location.pathname.split("/");
		var acao = url[url.length - 1];
		$.each($(".row.menu a"), function(){
			var url_link = $(this).attr('href').split("/");
			var acao_link = url_link[url_link.length - 1]; 
			if(acao_link == acao){
				$(this).addClass('active'); 
			}
		})
	
	});
</script>

</head>
<body>
	

	<nav>
		<div class="row">
			<div class="large-3 columns">
				<a href="/maisfreela"> <img
					src='<%=request.getContextPath()%>/maisfreela/img/logo_maisfreela.png'>
				</a>
			</div>
			<div class='large-7 columns user-welcome'>
				<span class='boas-vindas'> <%
 					Usuario user = (Usuario) session.getAttribute("usuario");
 					try {
 						out.print("Seja bem vindo: " + user.getNome());
 					} catch (Exception e) {
 						out.print("Seja bem vindo: visitante");
 					}
 				%>
				</span>
				<%if(UserController.isLogged("empresario", user)){ %>
					<div style='float:right;'>
						<a class="button [tiny small large] publicar_btn" href="<%=request.getContextPath()%>/projeto/publicarProjeto">Publicar Projeto</a>
						
					</div>
				<%} %>
			</div>
			<div class="large-2 columns right">
				<div class='login ' id='btn-logar'>
					<div class='login-icon'>				
					<a href="<%=request.getContextPath()%>/usuario/dadosPessoais" data-tooltip aria-haspopup="true"  title="Meu perfil"> 
						<img src='<%=request.getContextPath()%>/maisfreela/img/user.png'></a>
					</div>
					<div class='login-label'>
						<%if(user == null){%>
							<a href="<%=request.getContextPath()%>/usuario/login">Entrar</a>
						<%}else{ %>
							<a href="<%=request.getContextPath()%>/usuario/sair">Sair</a>
							
						<%} %>
					</div>
				</div>
			</div>
		</div>

		<div class="row menu">
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/home/comoFunciona" class=" button">Como funciona?</a>
			</div>
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/projeto/visualizaProjetos" class="button">Projetos</a>
			</div>
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/usuario/visualizaDesenvolvedores" class="button">Desenvolvedores</a>
			</div>
			<div class="large-3 columns">
			<%if(user == null){%>
					<a href="<%=request.getContextPath()%>/usuario/cadastraUsuario" class="button">Quero me cadastrar</a>
					<%}else{ %>
					<a href="<%=request.getContextPath()%>/usuario/visualizarNotificacoes" class="button">Notificações</a>
					<%} %>
			</div>
		</div>
	</nav>