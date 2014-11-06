<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
	import="java.util.ArrayList"
	import="model.Desenvolvedor"
	import="model.Projeto"
	
	%>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Mais Freela | Seja bem vindo</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/foundation.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/menu.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/menu.css" />
	<style>
		.login{
			background:gray;
			margin-top: 15px;
			cursor:pointer;
		}
		.login div{
			display:inline-block;
			padding:5px;
		}
		.login .login-icon{
			border-right:1px solid white;
			width:35%;
		}
		.login .login-label{
			text-align:center;
			width:62%;
			color:white;
		}
	</style>
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
			    	<div class='login-label'>Entrar</div>
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
	    <div id="slider">
	      	<ul data-orbit>
			    <li>
			        <img src="<%=request.getContextPath()%>/maisfreela/img/como_funciona.png"/>
			        <div class="orbit-caption">Como funciona?</div>
			    </li>
			    <li>
			        <img src="<%=request.getContextPath()%>/maisfreela/img/working_home.png"/>
			        <div class="orbit-caption">
			        	Está com tempo livre? Comece a trabalhar de casa agora!
			        </div>
			    </li>
			    <li>
			        <img src="<%=request.getContextPath()%>/maisfreela/img/realidade.png"/>
			        <div class="orbit-caption">
			        	Tem alguma idéia? Faça ela virar realidade aqui!   
					</div>
	    		</li>
			</ul>
	      
	    </div>
    	<hr/>
    </div>
  </div>
  
 
 	<div class='row'>
 		<div class='large-12 columns center'>
 			<h2>Desenvolvedores em Destaque</h2>
 		</div>
 	</div>
  <div class="row">
	 <%
	 ArrayList<Desenvolvedor> desenvolvedores = (ArrayList<Desenvolvedor>)request.getAttribute("desenvolvedores");
	try{
		 for(Desenvolvedor dev : desenvolvedores){
			 %>
			 <a href="<%=request.getContextPath()%>/usuario/visualizaUsuario?id_usuario=<%out.println(dev.getId());%>">
				 <div class="large-4 columns">
			      <img src="http://placehold.it/400x300&text=[Freela1]"/>
			      <h4><%out.println(dev.getUsuario().getNome());%></h4>
			      <p><h4><%out.println(dev.getUsuario().getSobre());%></h4></p>
			    </div>
			 </a>
			 <% 	 
		 }		
	} catch (Exception e) {
		out.print("Sem desenvolvedores...");
	} 
	 %>
    <hr/>
 </div>
    
    <div class='row'>
 		<div class='large-12 columns center'>
 			<h2>Projetos em Destaque</h2>
 		</div>
 	</div>
     <div class="row">
	 <%
	 ArrayList<Projeto> projetos = (ArrayList<Projeto>)request.getAttribute("projetos");
	try{
		 for(Projeto proj : projetos){
			 %>
			 <div class="large-4 columns">
		      <img src="http://placehold.it/400x300&text=[Freela1]"/>
		      <h4><%out.println(proj.getTitulo());%></h4>
		      <p><h4><%out.println(proj.getDescricao());%></h4></p>
		    </div>
			 <% 	 
		 }		
	} catch (Exception e) {
		out.print("Sem desenvolvedores...");
	} 
	 %>
    <hr/>
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