<%@page import="controller.UserController" import="model.Usuario"
	import="model.Empresario" import="model.Desenvolvedor"%>
<%@ page language="java"%>
<%@include file="header.jsp"%>
<%
	if (UserController.isLogged(user)) {
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/perfil.css" />
<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu.jsp"%>
		</div>
	</div>
	<div class='large-9 columns menu-left'>
			<%
			Desenvolvedor dev = user.getDesenvolvedor();
			Empresario emp = user.getEmpresario();
			if (dev != null) {
			%>
			<div class='content'>
				<div class='contaUsuario'>
					<div class='contaTitle'>Dados Bancários de Desenvolvedor:</div>
					<!-- action='/maisfreela/usuario/editUsuario' -->
					<form method='post'>
						<label for='nome'>Banco</label> <input required
					<%try {%>	
						<% out.print("value='"+dev.getConta().getBanco()+"'");%>
					<%} catch (Exception e) {
					}%>
							type='text' name='nome' id='nome'> <label for='sobre'>Agência</label>
						<input required
						
				<%try {%>
					<% out.print("value='"+dev.getConta().getAgencia()+"'");%>
					<%} catch (Exception e) {
					}%>
							type='text' name='nome' id='nome'> <label for='telefone'>Conta Corrente</label> <input required type='text' name='telefone' id='telefone'
			
					<%try {%>
						<% out.print("value='"+dev.getConta().getContaCorrente()+"'");%>
					<%} catch (Exception e) {
					}%>
							type='text' name='nome' id='nome'>
						<button type='submit'>Confirmar</button>
						<button class='alert' type='submit'>Cancelar</button>
						<div class='clear'></div>
					</form>
				</div>
			</div>
			<br>
			
			<%
				}
					if (emp != null) {
			%>
			<div class='content'>
				<div class='contaUsuario'>
					<div class='contaTitle'>Dados Bancários de Empresário:</div>
					<!-- action='/maisfreela/usuario/editUsuario' -->
					<form method='post'>
						<label for='nome'>Banco</label> <input required
						<%try {%>	
							<%="value='"+emp.getConta().getBanco()+"'"%>
						<%} catch (Exception e) {
						}%>
						type='text' name='nome' id='nome'> <label for='sobre'>Agência</label>
						<input required
						<%try {%>
							<%="value='"+emp.getConta().getAgencia()+"'"%>
						<%} catch (Exception e) {}%>
							type='text' name='nome' id='nome'> 
					
					<label for='telefone'>Conta Corrente</label> <input required type='text' name='telefone' id='telefone'
					<%try {%>
						<%="value='"+emp.getConta().getContaCorrente()+"'"%>
					<%} catch (Exception e) {
					}%>
							type='text' name='nome' id='nome'>
						<button type='submit'>Confirmar</button>
						<button class='alert' type='submit'>Cancelar</button>
						<div class='clear'></div>
					</form>
				</div>
			</div>
			<%
				}
			%>
		</div>
	

	<%@include file="footer.jsp"%>
	<%
		} else {
	%>
	<script>
		window.location = "/maisfreela/acessonegado";
	</script>
	<%
		}
	%>