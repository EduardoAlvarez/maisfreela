<%@ page language="java" 
    import="java.util.ArrayList"
	import="model.Projeto"
	import="java.util.List"
	import="model.Tag"%>


<%@include file="header.jsp"%>
<div class='row main-list'>
<div class='large-3 columns menu-left'>
		<div class='content'>
		<%@include file="sidemenu_projeto.jsp"%>
		</div>
</div>
	
	<div class='large-9 columns panel-list'>
		<div class='content'>
			<form method='post'>
			<%		Projeto projeto = (Projeto)session.getAttribute("v_projeto");					
			%>
			<span class='titulo'><%=projeto.getTitulo()%></span>
				
			</form> 
		</div>
		

		</div>
	</div>
</div>
<%@include file="footer.jsp"%>