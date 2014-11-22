<%@page import="model.Desenvolvedor"%>
<%@page import="controller.UserController"%>
<%@ page language="java"  
	import="model.Avaliacao"
	import="java.util.List"
	import="java.util.ArrayList"
	import="model.Desenvolvedor"
	import="model.Empresario"
	import="dao.UsuarioDAO"
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
			<%UsuarioDAO userDAO = new  UsuarioDAO();
			Desenvolvedor dev = user.getDesenvolvedor();
			if(dev != null){
				
				List<Avaliacao> avaliacoes =  userDAO.getAvaliacoesbyDesenvolvedor(dev);
				//List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
			 	out.print("Média como Desenvolvedor: "+dev.getAvaliacao());
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
						out.println(e);
					} 
				} 
			}
			Empresario emp = user.getEmpresario();
			if(dev != null && emp != null){
				out.print("<hr/>");
			};
			if(emp != null){
				
				List<Avaliacao> avaliacoes =  userDAO.getAvaliacoesbyEmpresario(emp);
				out.print("Média como Empresário: "+emp.getAvaliacao());
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
						out.println(e);
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