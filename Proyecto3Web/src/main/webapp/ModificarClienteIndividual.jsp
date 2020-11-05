<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Cliente_Individual" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<% /*Titulo de la pagina */%>
<title>ModificarClienteIndividual</title>

<% /*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<div class="container well">
	
<h1>Modificar Cliente Individual</h1>
</div>
</head>



</body>
<div class="Container">
<%
	/* type: que tipo de dato podra almacenar
id: atributo// <>br:un espacio hacia abajo */
%>

	<%
		Cliente_Individual individual=null;
		ManejoDAO dao=new ManejoDAO();
		String prueba= request.getParameter("codigo");
		if(prueba!=null){
		individual=dao.getDBbuscarclienteIndi(Integer.parseInt(prueba));
		}
		if(individual==null){
	%>

<form action="ModificarClienteIndividual.jsp"method="get" class="form-control" style="width: 500px; height: 500px">

		<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text" class="form-control" id="codigo" name="codigo" >
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>
		</div>

		<div class="form-group">
			<label for="nombre">Nombre</label>
			<input type="text" class="form-control" id="nombre" name="nombre">

			<label for="apellido">Apellido</label>
			<input type="text"class="form-control" id="apellido" name="apellido">

			<label for="direccion">Direccion</label>
			<input type="text"class="form-control" id="direccion" name="direccion">

			<label for="dpi">Dpi</label>
			<input type="text"class="form-control" id="dpi" name="dpi">
		</div>



	<button type="submit" class="btn btn-primary">Modificar</button>

    
</form>



<%
	}else{
		%>
<form action="ModificarClienteIndividual.jsp"method="get" class="form-control" style="width: 500px; height: 500px">
	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text"class="form-control" id="codigo" name="codigo" value="<%=individual.getIdCliente()%>">
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="form-group">
			<label for="nombre">Nombre</label>
			<input type="text" class="form-control" id="nombre" name="nombre" value="<%=individual.getNombreCliente()%>">

			<label for="apellido">Apellido</label>
			<input type="text"class="form-control" id="apellido" name="apellido" value="<%=individual.getApellidoCliente()%>">

			<label for="direccion">direccion</label>
			<input type="text"class="form-control" id="direccion" name="direccion" value="<%=individual.getDireccion()%>">

			<label for="dpi">dpi</label>
			<input type="text"class="form-control" id="dpi" name="dpi" value="<%=individual.getDpi()%>" >

		</div>

		<button type="submit" class="btn btn-primary">Modificar</button>

	</div>

</form>
	<%
				String codigo=request.getParameter("codigo");
				String nombre=request.getParameter("nombre");
				String apellido=request.getParameter("apellido");
				String direccion=request.getParameter("direccion");
				String dpi=request.getParameter("dpi");

			Cliente_Individual client=new Cliente_Individual(Integer.parseInt(codigo),nombre,apellido,direccion,dpi);
			dao.getDBmodificarcliente(client);

	}

%>
	<form action="Menu.jsp">
		<button type="submit" class="btn btn-secondary">Regresar al Menu </button>
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

