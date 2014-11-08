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
						<a href="/usuario/login">Entrar</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row menu">
			<div class="large-3 columns">
				<a href="#" class="button">Como funciona?</a>
			</div>
			<div class="large-3 columns">
				<a href="#" class="button">Projetos</a>
			</div>
			<div class="large-3 columns">
				<a href="#" class="button">Desenvolvedores</a>
			</div>
			<div class="large-3 columns">
				<a href="#" class="button">Quero me cadastrar</a>
			</div>
		</div>
	</nav>
	<div class='row main-list'>
		<div class='large-3 columns menu-left'>
			<div class='content'>"alguma coisa"</div>
		</div>
		<div class='large-9 columns panel-list'>

			<div class='content'>
				<div class='row'>
					<div class='large-12 columns'>
						<div class='nome-projeto'>Nome</div>
						<div class='info-projeto'>Informações</div>
						<div class='desc-projeto'>Descrição</div>
						<div class='tags'>
							<span class='tag-label'>Tags:</span>
							<span class='tag'>HTML</span>
						</div>
					</div>
				</div>
				<div class='row'>
					<div class='large-12 columns'>
						<div class='nome-projeto'>Nome</div>
						<div class='info-projeto'>Informações</div>
						<div class='desc-projeto'>Descrição</div>
						<div class='tags'>
							<span class='tag-label'>Tags:</span>
							<span class='tag'>HTML</span>
						</div>
					</div>
				</div>
			</div>



		</div>
	</div>


	<footer class="row">
		<div class="large-12 columns">
			<hr />
			<div class="row">
				<div class="large-6 columns">
					<p>© Copyright Mais Freela - Todos os direitos reservados</p>
				</div>
				<div class="large-6 columns">
					<ul class="inline-list right">
						<li><a href="#">Regras de negócio</a></li>
						<li><a href="#">Fale conosco</a></li>
						<li><a href="#">Termos de uso</a></li>
						<li><a href="#">Manual</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>