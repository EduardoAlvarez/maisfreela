<%@page import="model.Desenvolvedor"%>
<%@page import="controller.UserController"%>
<%@ page language="java"  
	import="model.Avaliacao"
	import="java.util.List"
	import="model.Desenvolvedor"
	import="model.Empresario"
%>

<%@include file="header.jsp"%>
<%if(UserController.isLogged(user)){%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/perfil.css"/>
<div class= 'row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
		</div>
	</div>
	<div class='large-9 columns menu-left'>
		<div class='content'>
			<%
			Desenvolvedor dev = user.getDesenvolvedor();
			if(dev != null){
				List<Avaliacao> avaliacoes =  dev.getAvaliacoes();
				out.print("Média como desenvolvedor: "+dev.getAvaliacao());
				if(avaliacoes.size() > 0){
					try {
						for (Avaliacao aval : avaliacoes) {
							out.print("<div class='row'>");
								out.print("<div class='large-12 columns'>");
									out.print("O usuário "+aval.getRemetente().getNome()+" te avaliou com: "+aval.getGrau());
									out.print("<br> "+aval.getComentario());
								out.print("</div>");
							out.print("</div>");
						}
					}catch(Exception e){
						
					} 
				} 
			}
			Empresario emp = user.getEmpresario();
			if(dev != null && emp != null){
				out.print("<hr/>");
			};
			if(emp != null){
				List<Avaliacao> avaliacoes =  emp.getAvaliacoes();
				out.print("Média como desenvolvedor: "+emp.getAvaliacao());
				if(avaliacoes.size() > 0){
					try {
						for (Avaliacao aval : avaliacoes) {
							out.print("<div class='row'>");
								out.print("<div class='large-12 columns'>");
									out.print("O usuário "+aval.getRemetente().getNome()+" te avaliou com: "+aval.getGrau());
									out.print("<br> "+aval.getComentario());
								out.print("</div>");
							out.print("</div>");
						}
					}catch(Exception e){
						
					} 
				} 
			}%>
		</div>
	</div>
</div>
</div>

<%@include file="footer.jsp"%>
<%
}else{%>
	<script>
		window.location="/maisfreela/usuario/login"; 
	</script> 
<%}%>