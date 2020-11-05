<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<% /*Titulo de la pagina */%>
<title>Usuario</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<div class="container well"/>
	
<h1>Ingrese sus Datos para ingresar al Sistema</h1>
</body>

<div class="container well"/>

<%
	/* type: que tipo de dato podra almacenar
id: atributo// <>br:un espacio hacia abajo */
%>

<form action="Usuario.jsp" method="get">
	<div class="form-group">
		<label for="nombre">Usuario</label> <input type="text"
			class="form-control" id="nombre" name="nombre"
			aria-describedby="emailHelp"> <small id="emailHelp"
			class="form-text text-muted"> </small>
		<%String full=request.getParameter("FullName"); %>
	</div>
	<div class="form-group">
		<label for="password">Contraseña</label> <input
			type="password" class="form-control" id="password" name="password">
	</div>

<form>
	<button action="<%

	try{
		String hola="hola";

		String nombre=request.getParameter("nombre");
		String pass=request.getParameter("password");

		System.out.println(hola+nombre+pass);
     if(nombre.equals(hola) && pass.equals(hola)){
      response.sendRedirect("Menu.jsp");
     }

	}catch (Exception e){
		e.printStackTrace();
	}

    %>" type="submit" class="btn btn-secondary">Ingresar</button>
</form>
</form>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

</body>

</html>

