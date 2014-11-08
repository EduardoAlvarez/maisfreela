<%@ page language="java" contentType="text/html;charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mais Freela | Seja bem vindo</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/foundation.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/menu.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/menu.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/login.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/form.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list-projetos.css" />
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/list-desenvolvedores.css" />
</head>
<body>
	<script
		src="<%=request.getContextPath()%>/maisfreela/js/vendor/jquery.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/maisfreela/js/vendor/modernizr.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/maisfreela/js/foundation.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$(document).foundation();
			$(document).foundation('orbit', {
				timer_speed : 10000,
				animation_speed : 500,
				bullets : true,
				stack_on_small : true
			});
		})
	</script>
	<nav>
		<div class="row">
			<div class="large-3 columns">
				<img
					src='<%=request.getContextPath()%>/maisfreela/img/logo_maisfreela.png'>
			</div>
			<div class="large-2 columns right">
				<div class='login ' id='btn-logar'>
					<div class='login-icon'>
						<img src='<%=request.getContextPath()%>/maisfreela/img/user.png'>
					</div>
					<div class='login-label'>
						<a href="<%=request.getContextPath()%>/usuario/login">Entrar</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row menu">
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/home/comoFunciona" class="button">Como funciona?</a>
			</div>
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/projeto/visualizaProjetos" class="button">Projetos</a>
			</div>
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/usuario/visualizaDesenvolvedores" class="button">Desenvolvedores</a>
			</div>
			<div class="large-3 columns">
				<a href="<%=request.getContextPath()%>/usuario/cadastraUsuario" class="button">Quero me cadastrar</a>
			</div>
		</div>
	</nav>