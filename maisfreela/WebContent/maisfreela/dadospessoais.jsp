<%@page import="controller.UserController"%>
<%@ page language="java"  %>
<%@include file="header.jsp"%>
<%if(UserController.isLogged(user)){%>
<div class= 'row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
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