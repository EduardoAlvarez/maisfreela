<%@ page language="java" import="java.util.ArrayList"
	import="model.Projeto" import="java.util.List" import="model.Tag"%>
<%@include file="header.jsp"%>
<%
	Projeto projeto = (Projeto) session.getAttribute("v_projeto");
%>
<div class='row main-list'>
	<div class='large-3 columns menu-left'>
		<div class='content'>
			<%@include file="sidemenu_projeto.jsp"%>
		</div>
	</div>

	<div class='large-9 columns panel-list'>
		<div class='content'>
			<form method='post'>
				<span class='titulo'><%=projeto.getTitulo()%></span> <label for='usuario'>Empresário:</label> 
				<input name='id_projeto' required id='id_projeto' type="hidden" value= <%=projeto.getId()%>></imput>
				<span class='titulo' name='empresario'><%=projeto.getEmpresario().getUsuario().getNome()%></span>
				<label for='avaliacao'>Avaliação:</label>
				<div class="small-10 medium-11 columns">
					<div class="range-slider" data-slider data-options="display_selector: #sliderOutput1; start: 0; end: 5;">
						<span class="range-slider-handle" role="slider" tabindex="0"></span>
						<span class="range-slider-active-segment"></span> <input
							name='avaliacao' required id='avaliacao' type="hidden">
					</div>
				</div>
				<div class="small-2 medium-1 columns">
					<span id="sliderOutput1"></span>
				</div>
				<label for='comentario'>Comentário:</label>
				<textarea required name='comentario' required id='comentario'></textarea>
				<button type='submit'>Confirmar</button>
				<button class='alert' type='submit'>Cancelar</button>
				<div class='clear'></div>
			</form>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>