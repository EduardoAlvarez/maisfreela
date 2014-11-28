<%@page import="java.util.ArrayList"%>
<%@page import="model.Tag"%>
<%@ page language="java"%>
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
})
</script>
<style>
	textarea {
		height: 100px;
	}			
</style>
<div class='row main-list'>
	<div class='large-12 columns panel-list'>
		<form class='form-center' action='<%=request.getContextPath()%>/projeto/cadastraProjetoAction' method='post'>
			<label for="titulo">Título do Projeto</label>
			<input required type='text' name='titulo' id='titulo'>
			
			<label for="desc">Descrição</label>
			<textarea required id="desc" name="desc"></textarea>		
			
			<label for="valor">Valor</label>
			<input required type='text' pattern='^\d*(\,\d{2}$)' title='Insira o valor no formato conforme exemplo: 100,00' name='valor' id='valor'>
			
			<label for="prazo">Prazo <small>(Em dias)</small></label>
			<input required type='number' name='prazo' id='prazo'>
			
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
			
			<button id="submit" type="submit">Publicar</button>
			<button class="alert" type="button">Cancelar</button>
						
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>