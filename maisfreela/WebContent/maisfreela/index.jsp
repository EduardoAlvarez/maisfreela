
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Mais Freela | Seja bem vindo</title>
	<link rel="stylesheet" href="css/foundation.css" />
	<link rel="stylesheet" href="css/menu.css" />
	<link rel="stylesheet" href="css/maisfreela/menu.css" />
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
	
	

	<script src="js/vendor/jquery.js" type="text/javascript"></script>
	<script src="js/vendor/modernizr.js" type="text/javascript"></script>
	<script src="js/foundation.min.js" type="text/javascript"></script>
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
		      <img src='img/logo_maisfreela.png'>
		    </div>
		    <div class="large-2 columns right">
		    	<div class='login ' id='btn-logar'>
			    	<div class='login-icon'>
			    		<img src='img/user.png'>
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
			        <img src="img/como_funciona.png"/>
			        <div class="orbit-caption">Como funciona?</div>
			    </li>
			    <li>
			        <img src="img/working_home.png"/>
			        <div class="orbit-caption">
			        	Está com tempo livre? Comece a trabalhar de casa agora!
			        </div>
			    </li>
			    <li>
			        <img src="img/realidade.png"/>
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
 			<h2>Desenvolvedores em destaque</h2>
 		</div>
 	</div>
 
  <div class="row">
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Freela1]"/>
      <h4>Eduardo Alvarez</h4>
      <p>Desenvolvedor PHP a 3 anos</p>
    </div>
    
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Freela2]"/>
      <h4>Henrique Barjas</h4>
      <p>Desenvolvedor Java que já participou de 2 projetos através do mais freela</p>
    </div>
    
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Freela3]"/>
      <h4>Anderson Cardoso</h4>
      <p>Programador .NET com especialidade em SharePoint</p>
    </div>
    <hr/>
 </div>
    
    <div class='row'>
 		<div class='large-12 columns center'>
 			<h2>Projetos em destaque</h2>
 		</div>
 	</div>
   <div class="row">
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Projeto1]"/>
      <h4>This is a content section.</h4>
      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
    </div>
    
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Projeto2]"/>
      <h4>This is a content section.</h4>
      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
    </div>
    
    <div class="large-4 columns">
      <img src="http://placehold.it/400x300&text=[Projeto3]"/>
      <h4>This is a content section.</h4>
      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
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