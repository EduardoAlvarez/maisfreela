<%@ page language="java" 
	import="java.util.ArrayList"
	import="model.Desenvolvedor"
	import="model.Projeto"%>
<%@include file="header.jsp"%>
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
			 <a href="<%=request.getContextPath()%>/usuario/visualizaUsuario?id_usuario=<%out.println(dev.getUsuario().getId());%>">
				 <div class="large-4 columns">
			      <img src="http://placehold.it/400x300&text=[Freela1]"/>
			      <h4><%out.println(dev.getUsuario().getNome());%></h4>
			      <p><h4><%out.println(dev.getUsuario().getSobre());%></h4></p>
			    </div>
			 </a>
			 <% 	 
		 }		
	} catch (Exception e) {
		out.print("Sem desenvolvedores!");
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
		out.print("Sem Projetos!");
	} 
	 %>

 </div>
<%@include file="footer.jsp"%>
 