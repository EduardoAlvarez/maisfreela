<%@page import="model.Desenvolvedor"%>
<%@page import="controller.UserController"%>
<%@ page language="java"  
	import="model.Avaliacao"
	import="java.util.ArrayList"
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
				ArrayList<Avaliacao> avaliacoes = (ArrayList<Avaliacao>)dev.getAvaliacoes();
				out.printl("Média como desenvolvedor: "+dev.getAvaliacao());
				if(avaliacacoes.size() > 0)
					try {
						for (Avaliacao aval : avaliacacoes) {
							out.print("<div class='row'>");
								out.print("<div class='large-12 columns'>");
									
								out.print("</div>");
							out.print("</div>");
						}
					}catch(Exception e){
						
					} %> 
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>
<%
}else{%>
	<script>
		window.location="/maisfreela/acessonegado"; 
	</script> 
<%}%>