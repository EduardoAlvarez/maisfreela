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
		 	<div class="large-4 columns">
		 	<% String link = request.getContextPath()+"/usuario/visualizaUsuario?id_usuario="+dev.getUsuario().getId();%>
				<a href="<%=link%>">
					<img src="http://placehold.it/400x300&text=[Freela]"/>
					</a>
			    	<h5><a href='<%=link%>'><%out.println(dev.getUsuario().getNome());%></a></h5>
			    
			    <p><%out.println(dev.getUsuario().getSobre());%></p>
			</div> 
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
			 <% String link = request.getContextPath()+"/projeto/visualizarProjeto?id_projeto="+proj.getId();%>
		     <a href="<%=link%>">
			      <img src="http://placehold.it/400x300&text=[Projeto]"/>
			      <h5><a href='<%=link%>'><%out.println(proj.getTitulo());%></a></h5>
		      </a>
		      <p><%out.println(proj.getDescricao());%></p>
		    </div>
			 <% 	 
		 }		
	} catch (Exception e) {
		out.print("Sem Projetos!");
	} 
	 %>

 </div>
<%@include file="footer.jsp"%>
 