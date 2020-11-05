<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Cliente_Individual" %>
<%@ page import="java.util.List" %>
<%@ page import="src.main.java.Producto" %>
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
	Producto producto=null;
	ManejoDAO dao=new ManejoDAO();
	String prueba= request.getParameter("codigo");
	if(prueba!=null){
		producto=dao.getDBbuscarproducto(Integer.parseInt(prueba));
	}
	if(producto==null){
%>

<form action="BuscarProducto.jsp"method="get" class="form-control" style="width: 500px; height: 500px">

	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text" class="form-control" id="codigo" name="codigo" >
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="form-group">

		</div>
		<table class="table">
			<thead>
			<tr>
				<th scope="col">Codigo Producto</th>
				<th scope="col">Nombre</th>
				<th scope="col">Descripcion</th>
				<th scope="col">Cantidad</th>
				<th scope="col">precio</th>
			</tr>
			</thead>

			<tr>
				<th scope="row">NO HAY DATOS<</th>
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
<form action="BuscarProducto.jsp"method="get" class="form-control" style="width: 500px; height: 500px">
	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label>
		<input type="text"class="form-control" id="codigo" name="codigo" value="<%=producto.getIdProducto()%>">
		<button type="submit" class="btn btn-primary">Buscar Cliente</button>

		<div class="container well/">
			<table class="table">
				<thead>
				<tr>
					<th scope="col">Codigo Producto</th>
					<th scope="col">Nombre</th>
					<th scope="col">Descripcion</th>
					<th scope="col">Cantidad</th>
					<th scope="col">precio</th>
				</tr>
				</thead>

				<tr>
					<th scope="row"><%=producto.getIdProducto()%></th>
					<td><%=producto.getNombreProducto()%></td>
					<td> <%=producto.getDescripcion()%></td>
					<td><%=producto.getCantidadInventario()%></td>
					<td><%=producto.getPrecio()%></td>
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