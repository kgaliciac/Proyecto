<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Cliente_Individual" %>
<%@ page import="java.util.List" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%/*Titulo de la pagina */%>

<title>BuscarClienteIndividual</title>

<%/*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<%/* Se puede visualizar todos los clientes */%>
<body>
<%
	Cliente_Individual individual=null;
	ManejoDAO dao=new ManejoDAO();
	String prueba= request.getParameter("codigo");
	if(prueba!=null){
		individual=dao.getDBbuscarclienteIndi(Integer.parseInt(prueba));
	}
	if(individual==null){
%>

<form action="BuscarClienteIndividual.jsp"method="get" class="form-control" style="width: 1000px; height: 500px">

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
			<th scope="row">NO HAY DATOS</th>
			<td>NO HAY DATOS</td>
			<td>NO HAY DATOS</td>
			<td>NO HAY DATOS</td>
			<td>NO HAY DATOS</td>
		</tr>
		</table>
		</div>

		<button type="submit" class="btn btn-primary">Modificar</button>

	</div>

</form>

</div>

<%
}else{
%>
<form action="BuscarClienteIndividual.jsp"method="get" class="form-control" style="width: 1000px; height: 500px">
	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text"class="form-control" id="codigo" name="codigo" value="<%=individual.getIdCliente()%>">
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="container well/">
			<table class="table">
		<thead>
		<tr>
			<th scope="col">Id Cliente</th>
			<th scope="col">Nombre</th>
			<th scope="col">Apellido</th>
			<th scope="col">Dirección</th>
			<th scope="col">DPI</th>
		</tr>
		</thead>

		<tr>
		<th scope="row"><%=individual.getIdCliente()%></th>
		<td><%=individual.getNombreCliente()%></td>
		<td> <%=individual.getApellidoCliente()%></td>
		<td><%=individual.getDireccion()%></td>
		<td><%=individual.getDpi()%></td>
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