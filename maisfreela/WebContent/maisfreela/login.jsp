<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	</head>
<body>
	<script src="<%=request.getContextPath()%>/maisfreela/js/vendor/jquery.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/maisfreela/js/vendor/modernizr.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/maisfreela/js/foundation.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$(document).foundation();
			$(document).foundation('orbit', {
			  timer_speed: 10000,
			  animation_speed: 500,
			  bullets: true,
			  stack_on_small: true
			});
		})
	</script>
    <nav>
	    <div class="row">
		    <div class="large-3 columns">
		      <img src='<%=request.getContextPath()%>/maisfreela/img/logo_maisfreela.png'>
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
	    	<div class="large-3 columns"><a href="#" class="button">Como funciona?</a></div>
	     	<div class="large-3 columns"><a href="#" class="button">Projetos</a></div>
	     	<div class="large-3 columns"><a href="#" class="button">Desenvolvedores</a></div>
	      	<div class="large-3 columns"><a href="#" class="button">Quero me cadastrar</a></div>
	   	</div>
   	</nav>
  <div class="row">
    <div class="large-12 columns">
    <% String status = (String)request.getAttribute("status");
    try{
	    if(status.equals("0")){
	    	out.print("Usuário ou senha incorretos");
	    }else if(status.equals("1")){
	    	out.print("Login correto! Seja bem vindo!!");
	    }
	    out.print((String)request.getAttribute("senha"));
	    out.print((String)request.getAttribute("login"));
    }catch(Exception e){
    	//nada ... 
    }
    %>
	    <form class='form-center' name='form-login' id='form-login' method='post' action="<%=request.getContextPath()%>/usuario/logar/">
	    	<label for='login'>Login</label>
	    	<input type='text' placeholder="Login" id='login' name='login'>
	    	<label for='senha'>Senha</label>
	    	<input type='password' placeholder="Senha" id='senha' name='senha'>
	    	<button type='submit'>Entrar</button>
	    </form>
    </div>
  </div>    
  <footer class="row">
    <div class="large-12 columns">
      <hr/>
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