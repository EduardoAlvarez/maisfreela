<%@page import="dao.ProjetoDAO"%>
<%@ page language="java"  
import="model.Usuario"
import="model.Empresario"
import="model.Desenvolvedor"
import="model.Projeto"
import="model.Avaliacao"
import="dao.UsuarioDAO"
import="java.util.List"
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
					<%
					Usuario usuario = (Usuario)request.getAttribute("v_aval_usuario");					
					out.print(usuario.getNome());
					%></div>
					<div>
					<a href="/maisfreela/usuario/visualizaUsuario?id_usuario=<%=usuario.getId()%>">Perfil do Desenvolvedor</a>
					</div>
				 
			</div>
		</div>
	<div class='large-9 columns panel-list panel-user'>
			<div class='content'>
				<div class='row'>
					<div class='large-12 columns'>
						<div class='desc-usuario'>
							<img class='aspas' src="<%=request.getContextPath()%>/maisfreela/img/abreaspas.png">
							<%=usuario.getSobre()%>
							<img class='aspas' src="<%=request.getContextPath()%>/maisfreela/img/fechaaspas.png">
						</div>		
						
						<%
						Desenvolvedor dev = usuario.getDesenvolvedor();
						Empresario emp = usuario.getEmpresario();
						UsuarioDAO userDAO = new UsuarioDAO();
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
							
							<%
							
							List<Avaliacao> avaliacoes_dev = userDAO.getAvaliacoesbyDesenvolvedor(dev);
							if(avaliacoes_dev.size() > 0){
								out.print("<ul>");
									for(Avaliacao a : avaliacoes_dev){
										out.print("<li>");
										out.print("<div class='title-projeto'>"+a.getRemetente().getNome()+"</div>");
										out.print("<div class='desc-projeto'>"+a.getComentario()+"<span Style='Float:right'>"+a.getGrau()+"</span></div>");
										out.print("</li>");
									}
								out.print("</ul>");
							}else{
								out.print("Ainda não possui avaliações como Desenvolvedor.");
							}
						}
						if(emp != null &&  dev != null){
							out.print("<hr/>");
						}
						if(emp != null){
							%>
							<div class='aval-title'>Empresario</div> 
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
							<!-- Projetos do emp -->
							
							<%
							List<Avaliacao> avaliacoes_emp = userDAO.getAvaliacoesbyEmpresario(emp);
							if(avaliacoes_emp.size() > 0){
								out.print("<ul>");
									for(Avaliacao a : avaliacoes_emp){
										out.print("<li>");
										out.print("<div class='title-projeto'>"+a.getRemetente().getNome()+"</div>");
										out.print("<div class='desc-projeto'>"+a.getComentario()+"<span Style='Float:right'>"+a.getGrau()+"</span></div>");
										out.print("</li>");
									}
								out.print("</ul>");
							}else{
								out.print("Ainda não possui avaliações como Empresário.");
							}
						}
						%>
					</div>		
				</div>			
			</div>
		</div>
		
	</div>
<%@include file="footer.jsp"%>