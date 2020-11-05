<%@ page import="src.main.java.Cliente_Empresa" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>

<title>BuscarClienteEmpresa</title>

<%
	/*Hoja de estilo */
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<%
	/* Se puede visualizar todos los clientes */
%>
<body>

<%
	Cliente_Empresa empresa=null;
	ManejoDAO dao=new ManejoDAO();
	String prueba= request.getParameter("codigo");
	if(prueba!=null){
		empresa=dao.getDBbuscarclienteempre(Integer.parseInt(prueba));
	}
	if(empresa==null){
%>

<form action="BuscarClienteEmpresa.jsp"method="get" class="form-control" style="width: 1000px; height: 500px">

	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text" class="form-control" id="codigo" name="codigo" >
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="form-group">

		</div>
		<table class="table">
		<thead>
		<tr>
			<th scope="col">Id Cliente</th>
			<th scope="col">Nombre</th>
			<th scope="col">Apellido</th>
			<th scope="col">Dirección</th>
			<th scope="col">Dpi</th>
		</tr>
		</thead>

		<tr>
			<th scope="row">nada</th>
			<td>nada</td>
			<td>nada</td>
			<td>nada</td>
			<td>nada</td>
		</tr>
		</table>
	</div>



	</div>

</form>

</div>

<%
}else{
%>
<form action="BuscarClienteEmpresa.jsp"method="get" class="form-control" style="width: 1000px; height: 500px">
	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text"class="form-control" id="codigo" name="codigo" value="<%=empresa.getIdCliente()%>">
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="container well/">
			<table class="table">
				<thead>
				<tr>
					<th scope="col">Id Cliente</th>
					<th scope="col">Nombre</th>
					<th scope="col">Dirección</th>
					<th scope="col">Contacto</th>
					<th scope="col">Descuento</th>
				</tr>
				</thead>

				<tr>
					<th scope="row"><%=empresa.getIdCliente()%><</th>
					<td><%=empresa.getNombreCliente()%></td>
					<td> <%=empresa.getApellidoCliente()%></td>
					<td><%=empresa.getDireccion()%></td>
					<td><%=empresa.getDescuentoEmpresa()%></td>
				</tr>
			</table>
		</div>


	</div>

</form>
<%

	}

%>
<form action="Menu.jsp">
	<button type="submit" class="btn btn-secondary">Regresar al Menu </button>
</form>


</body>
</html>