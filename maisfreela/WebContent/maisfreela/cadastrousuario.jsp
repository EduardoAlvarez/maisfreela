<%@page import="model.Tag"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" 
contentType="text/html" 
pageEncoding="ISO-8859-1" 
%> 

<%@include file="header.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/maisfreela/js/multipleSelect/multiple-select.css" />
<script src="<%=request.getContextPath()%>/maisfreela/js/multipleSelect/jquery.multiple.select.js" type="text/javascript"></script>
<script>
$(function(){
	
    $("select").multipleSelect({
        filter: true,
        position: 'top',
        selectAllText:'Selecionar Todos',
        allSelected:'Todos selecionados',
        countSelected:'# de % selecionados',
       	noMatchesFound: 'Sua pesquina não encontrou nada'
    });
    $(".tags").hide();
    $("#perfilDev").change(function(){
    	$(".tags").slideToggle();
    });
})
</script>

<style>
	.tags{
		display:none;
	}
	textarea {
		height: 100px;
	}			
	#required_pass{
		color:red;
		font-size:10px;
		margin-top: -20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(e){
			if($("#senha_c").val() != $("#cSenha").val()){
				if($("#required_pass").length == 0 ){
					$("#senha").after("<div id='required_pass'>As senhas devem ser iguais</div>");
				}
				$("#senha_c").css('border-color','red');
				$("#cSenha").css('border-color','red');
				e.preventDefault();
			}else{
				$("#required_pass").remove();
				$("#senha_c").css('border-color','#ccc');
				$("#cSenha").css('border-color','#ccc');
			}
		})
	});
</script>

	<div class= 'row main-list'>
		<div class='large-12 columns panel-list'>
			<form class='form-center' method="post" action='<%=request.getContextPath()%>/usuario/cadastrarUsuarioAction'>
				<label for="nome">Nome Completo</label>
				<input required type='text' name='nome' id='nome'>
				
				<label for="sobre">Sobre</label>
				<textarea id='sobre' name='sobre'></textarea>
				
				<label for="login">Login</label>
				<input required type='text' name='login' id='login'>
				
				<label for="senha">Senha</label>
				<input required type='password' name='senha_c' id='senha_c'>
				
				<label for="cSenha">Confirmar Senha</label>
				<input required type='password' name='cSenha' id='cSenha' data-equalto="senha">
				
				<fieldset>
					<legend>Perfil</legend>
					<input type='checkbox' id='perfilDev' name='dev'>
					<label for="perfilDev">Desenvolvedor</label> <br>
					<div class='tags'>
						<label for="descricao">Tags</label>
						<select	multiple name='tags[]' id='tags' style="height:100px;">
							<%
							ArrayList<Tag> tags = (ArrayList<Tag>)request.getAttribute("tags");
							try{
								 for(Tag tag : tags){
									 out.print("<option value="+tag.getId()+">"+tag.getNome()+"</option>");	 
								 }
							}catch(Exception e){
								out.print("<option>Nenhuma Tag cadastrada!</option>");
							}
								 %>
						</select>
					</div>
			
					<input type='checkbox' id='perfilEmpresario' name='emp'>
					<label for="perfilEmpresario">Empresário</label>					
				</fieldset>
					
					
									
				<button id='submit' type='submit'>Cadastrar</button>
				<button class="alert" type='button'>Cancelar</button>
			</form>							
		</div>		
	</div>
	

<%@include file="footer.jsp"%>