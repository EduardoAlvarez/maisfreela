<%@page import="model.Empresario"%>
<%@page import="model.Usuario"%>
<%@page import="controller.UserController"%>
<%@page import="model.Desenvolvedor"%>
<%@page import="model.Projeto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<script>
$(function(){
	var url = location.pathname.split("/");
	var acao = url[url.length - 1];
	$.each($(".sidemenu a"), function(){
		if($(this).attr('href').indexOf(acao) !==-1){
			$(this).addClass('active'); 
		}
	})
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/css/maisfreela/projeto.css" />
<div class='sidemenu sidemenu_projeto'>
	<div class='header_projeto'>Projeto</div>
	
	<a 	href="<%=request.getContextPath()%>/projeto/visualizarProjeto" 		type='button'>O projeto</a>
	<a 	href="<%=request.getContextPath()%>/projeto/lancesDados" 			type='button'>Lances dados</a>
	<%
	if(UserController.isLogged("empresario",user)){
		Empresario emp = user.getEmpresario();
		if(emp.isOwner(projeto) && projeto.getStatus().equals("bloqueado")){%>
			<a 	href="#" data-reveal-id="iniciarProjeto" type='button'>Iniciar projeto</a>
			<a 	href="#" data-reveal-id="reabrirProjeto" type='button'>Re-abrir o projeto</a>
		<%}
		if(emp.isOwner(projeto) && projeto.getStatus().equals("iniciado")){%>
			<a 	href="#" data-reveal-id="encerrarProjeto" type='button'>Encerrar o projeto</a>
			<a 	href="#" data-reveal-id="cancelarProjeto" type='button'>Cancelar o projeto</a>		
		<%}
		if(emp.isOwner(projeto) && projeto.getStatus().equals("finalizado")){%>
		<a 	href="<%=request.getContextPath()%>/projeto/avaliarDesenvolvedor" 	type='button'>Avaliar Desenvolvedor</a>
		<%} %>
	<%} %>
	
	<%
	if(UserController.isLogged("desenvolvedor",user)){		
		if(projeto.getStatus().equals("pendente") ||  projeto.getStatus().equals("novo")){%>
			<a 	href="<%=request.getContextPath()%>/projeto/darLance" type='button'>Dar um lance</a>
		<%}
		Desenvolvedor dev = user.getDesenvolvedor();
		if(dev.isWorker(projeto)){
			if(projeto.getStatus().equals("aguardando inicio")){%>
			<a 	href="<%=request.getContextPath()%>/projeto/confirmarProjeto" 		type='button'>Confirmar inicio</a>
			<%} 
			if(projeto.getStatus().equals("aguardando encerramento")){%>
			<a 	href="<%=request.getContextPath()%>/projeto/confirmarEncerramento" 	type='button'>Confirmar encerramento</a>
			<%} 
			if(projeto.getStatus().equals("finalizado")){%>
			<a 	href="<%=request.getContextPath()%>/projeto/avaliarEmpresario" 		type='button'>Avaliar Empresário</a>
		<%} }%>	
	<%} %>
</div>

<%
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String hoje = dateFormat.format(date);

Calendar c = Calendar.getInstance();
c.setTime(dateFormat.parse(hoje));
c.add(Calendar.DATE, projeto.getPrazo());  // number of days to add
String prox = dateFormat.format(c.getTime());  // dt is now the new date
%>

<div id="iniciarProjeto" class="reveal-modal" data-reveal>
  <form>
	  <h3>Tem certeza que deseja iniciar o projeto?</h3>
	  <p class="lead">O projeto terá inicio hoje <%=hoje%> e término dia: <%=prox%></p>
	  <button type='submit'>Confirmar</button>
	  <a  onclick="fechar()" class='button alert'>Cancelar</a>
	  <a class="close-reveal-modal">&#215;</a>
  </form>
</div>

<div id="reabrirProjeto" class="reveal-modal" data-reveal>
  <form>
	  <h3>Tem certeza que deseja reabrir o projeto?</h3>
	  <!--  p class="lead">O projeto terá inicio hoje <%=hoje%> e término dia: <%=prox%></p -->
	  <button type='submit'>Confirmar</button>
	  <a  onclick="fechar()" class='button alert'>Cancelar</a>
	  <a class="close-reveal-modal">&#215;</a>
  </form>
</div>
<div id="encerrarProjeto" class="reveal-modal" data-reveal>
  <form>
	  <h3>Tem certeza que deseja encerrar o projeto?</h3>
	  <p class="lead">Essa ação enviará uma notificação ao desenvolvedor para que ele possa confirma-lá</p>
	  <button type='submit'>Confirmar</button>
	  <a  onclick="fechar()" class='button alert'>Cancelar</a>
	  <a class="close-reveal-modal">&#215;</a>
  </form>
</div>
<div id="encerrarProjeto" class="reveal-modal" data-reveal>
  <form>
	  <h3>Tem certeza que deseja cancelar o projeto?</h3>
	  <p class="lead">Você não receberá o valor já pago pelo projeto</p>
	  <button type='submit'>Confirmar</button>
	  <a  onclick="fechar()" class='button alert'>Cancelar</a>
	  <a class="close-reveal-modal">&#215;</a>
  </form>
</div>

<script>
function fechar(){
	$('[data-reveal]').foundation('reveal','close')
}
</script>