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
	$('#wizard').smartWizard({
		labelNext:'Próximo', // label for Next button
	    labelPrevious:'Anterior', // label for Previous button
	    labelFinish:'Finalizar',  // label for Finish button
	    onFinish:function(){
	    	alert("Finalizado!!");
	    }
	});
    function onFinishCallback(){
      $('#wizard').smartWizard('showMessage','Finish Clicked');
      //alert('Finish Clicked');
    }     
});
</script>
<style>
#wizard{
	width: 100%;
}
.swMain .stepContainer{
	overflow:hidden;
	border: 1px solid #ccc;
	border-radius: 5px;
}
.swMain .stepContainer div.content{
	border:none;
}
.swMain .stepContainer .StepTitle{
	width:96.6%;
}
.swMain ul.anchor li a .stepDesc{
	width: 80%;
	text-align: center;
	margin-top: 9px;
}


</style>
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
	<div id="wizard" class="swMain">
  			<ul>
  				<li><a href="#step-1">
                <label class="stepNumber">1</label>
                <span class="stepDesc">O Projeto</span>
            </a></li>
  				<li><a href="#step-2">
                <label class="stepNumber">2</label>
                <span class="stepDesc">Pagamento</span>
            </a></li>
  				<li><a href="#step-3">
                <label class="stepNumber">3</label>
                <span class="stepDesc">Resumo</span>                   
             </a></li>
  			</ul>
  			<div id="step-1">	
            	<h2 class="StepTitle">O projeto</h2>
            	<p>Tem certeza que deseja iniciar o projeto?</p>
            	<p>Ele terá inicio dia: e término dia: .</p>
			</div>
			<div id="step-2">	
            	<h2 class="StepTitle">Forma de pagamento</h2>
            		<p>
	            		Deve ser feito um pagamento no valor de <%=projeto.getValor()/2%> para que o projeto seja iniciado 
		            	Qual será sua forma de pagamento?
	            	</p>
	            	<div>
	            		<button>PagSeguro</button>
	            		<button>Boleto</button>
	            	</div>
            	
			</div>
			<div id="step-3">	
            	<h2 class="StepTitle">Resumo</h2>
            	<p>O desenvolvedor receberá uma notificação avisando do inicio do projeto.</p> 
            	<p>Aguarde até que ele confirme.</p> 
			</div>
	</div>
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