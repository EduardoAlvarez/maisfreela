<%@include file="header.jsp"%>
  <div class="row">
    <div class="large-12 columns">
    
	    <% 
	    String classe = "";
	    String message = "";
	    String message_class = "";
	    String status = (String)request.getAttribute("status");
	    try{
		    if(status.equals("0")){
		    	message = "Usuário ou senha incorretos";
		    	classe = "erro";
		    	message_class = "message-error";
		    }else if(status.equals("1")){
		    	message = "Login correto! Seja bem vindo!";
		    	message_class = "message-success";
		    }
	    }catch(Exception e){
	    	//nada ... 
	    }
	    %>
	<div class="message <%=message_class%>">
		<%=message%>
    </div>
	    <form class='form-center' name='form-login' id='form-login' method='post' action="<%=request.getContextPath()%>/usuario/logar">
	    	<label for='login'>Login</label>
	    	<input class='<%=classe%>' type='text' id='login' name='login'>
	    	<label for='senha'>Senha</label>
	    	<input class='<%=classe%>' type='password' id='senha' name='senha'>
	    	<button type='submit'>Entrar</button>
	    </form>
    </div>
  </div>    
<%@include file="footer.jsp"%>