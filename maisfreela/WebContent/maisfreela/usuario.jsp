<%@ page language="java"  
import="model.Usuario"
import="model.Empresario"
import="model.Desenvolvedor"
%>
<%@include file="header.jsp"%>
	<div class='row main-list'>
		<div class='large-3 columns menu-left'>
			<div class='content'>Alguma coisa</div>
		</div>
		<div class='large-9 columns panel-list'>
			<div class='content'>
				<div class='row'>
					<div class='large-12 columns'>
						<img class='imagem' src="http://placehold.it/100x100&text=[Freela1]" />	
						<div class='nome-usuario'><%Usuario user = (Usuario)request.getAttribute("usuario");
						out.print(user.getNome());
						%></div>
						
						<%
						Desenvolvedor dev = user.getDesenvolvedor();
						Empresario emp = user.getEmpresario();
						if(dev != null){
							%>
							Avaliação como desenvolvedor: <br>
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
							<% 
						}
						if(emp != null){
							%>
							Avaliação como empresário: <br>
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
							<%
						}
						%>
						<div class='desc-usuario'><%=user.getSobre()%></div> 
						
					</div>		
				</div>			
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>