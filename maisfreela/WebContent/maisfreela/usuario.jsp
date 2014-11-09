<%@ page language="java"  
import="model.Usuario"
import="model.Empresario"
import="model.Desenvolvedor"
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/usuario.css"/>
<%@include file="header.jsp"%>
	<div class='row main-list'>
		<div class='large-3 columns menu-left'>
			<div class='content perfil-usuario'>
				<div class='image-content'>
					<img class='imagem' src="http://placehold.it/200x200&text=[Freela1]" />
				</div>
				<div class='nome-usuario'>
					<%Usuario user = (Usuario)request.getAttribute("usuario");
					out.print(user.getNome());
					%></div>
				 
			</div>
		</div>
		<div class='large-9 columns panel-list panel-user'>
			<div class='content'>
				<div class='row'>
					<div class='large-12 columns'>
						<div class='desc-usuario'>
							<img class='aspas' src="<%=request.getContextPath()%>/maisfreela/img/abreaspas.png">
							<%=user.getSobre()%>
							<img class='aspas' src="<%=request.getContextPath()%>/maisfreela/img/fechaaspas.png">
						</div>		
						
						<%
						Desenvolvedor dev = user.getDesenvolvedor();
						Empresario emp = user.getEmpresario();
						if(dev != null){
							%>
							<div class='aval-title'>Desenvolvedor</div> 
							<div class='estrelas'>
								<%
								Float nota = dev.getAvaliacao();
								Integer i = (int)((double)nota); //isso é muito feio!
								Float fnota = (nota - i); //0.5 por exemplo
								Integer meia = 0;
								for(Integer b = 0 ; b < i ; b++){
									out.print("<div class='estrela-full'></div>");
								}
								if(nota%2 >= 0.5){
									meia = 1;
									out.print("<div class='estrela-half'></div>");
								}
								for(Integer b = 5-meia; b > i ; b--){
									out.print("<div class='estrela-empty'></div>");
								}
							 	%>
							</div>
							<!-- Projetos do dev -->
							<div> Projetos atuados </div>
							<ul>
								<li>Projeto 1</li>
								<li>Projeto 2</li>
								<li>Projeto 3</li>
							</ul>
							
							<hr/>
							<% 
						}
						if(emp != null){
							%>
							<div class='aval-title'>Empresário</div>
							<div class='estrelas'>
								<%
								Float nota = emp.getAvaliacao();
								Integer i = (int)((double)nota); //isso é muito feio!
								Float fnota = (nota - i); //0.5 por exemplo
								Integer meia = 0;
								for(Integer b = 0 ; b < i ; b++){
									out.print("<div class='estrela-full'></div>");
								}
								if(nota%2 >= 0.5){
									meia = 1;
									out.print("<div class='estrela-half'></div>");
								}
								for(Integer b = 5-meia; b > i ; b--){
									out.print("<div class='estrela-empty'></div>");
								}
							 	%>
							</div>
							<!-- Projetos do dev -->
							<div> Projetos criados </div>
							<ul>
								<li>Projeto 1</li>
								<li>Projeto 2</li>
								<li>Projeto 3</li>
							</ul>
							<hr/>
							<%
						}
						%>
						
						
					</div>		
				</div>			
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>