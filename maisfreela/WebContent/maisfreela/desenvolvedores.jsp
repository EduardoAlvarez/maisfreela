<%@ page language="java"  
	import="java.util.List"
	import="java.util.ArrayList"
	import="model.Desenvolvedor"
	import="model.Tag"%>
<%@include file="header.jsp"%>
	<div class='row main-list'>
		<div class='large-3 columns menu-left'>
			<div class='content'>Alguma coisa</div>
		</div>
		<div class='large-9 columns panel-list'>
			<div class='content'>
				<%
				 ArrayList<Desenvolvedor> desenvolvedores = (ArrayList<Desenvolvedor>)request.getAttribute("desenvolvedores");
				try{
					 for(Desenvolvedor dev : desenvolvedores){
			 	%>
				<div class='row'>
					<div class='large-12 columns'>
						<img class='imagem' src="http://placehold.it/150x150&text=[Freela1]" />
						<div class='nome-desenvolvedor'><%=dev.getUsuario().getNome()%></div>
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

						<div class='desc-desenvolvedor'><%=dev.getUsuario().getSobre()%></div>
						<%
						List<Tag> tags = dev.getTags();
						if(tags.size() > 0){
							%>
							<div class='tags'>
								<span class='tag-label'>Tags:</span> 
								<%for(Tag tag : tags){ %>
									<span class='tag'><%=tag.getNome()%></span>
								<%} %>
							</div>
						<% }%>
					</div>
				</div>
				<%}
			}catch(Exception e){
				out.print("Sem desenvolvedores no momento");
			} %>
				
			</div>



		</div>
	</div>
</div>
	<%@include file="footer.jsp"%>