<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Producto" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>


<title>VerTodosLosProductos</title>
</head>

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
	<div class="container well/">
		<h1>Ver Productos</h1>
	</div>

	<div class="container well/">
		<table class="table">
			<%
				/* Cargara los datos del Producto */
			%>
			<thead>
				<tr>
					<th scope="col">Id. Producto</th>
					<th scope="col">Nombre</th>
					<th scope="col">Descripcion</th>
					<th scope="col">Stock en Inventario</th>
					<th scope="col">Precio</th>
				</tr>
			</thead>
			<tbody>

				<%
					ManejoDAO manejoDAO = new ManejoDAO();

					List<Producto> productos = manejoDAO.getDBproducto();

					int i=0;
					for(Producto producto: productos){

				%>
				<tr>
					<th scope="row"><%=producto.getIdProducto()%>.</th>
					<td><%=producto.getNombreProducto()%></td>
					<td> <%=producto.getDescripcion()%></td>
					<td><%=producto.getCantidadInventario()%></td>
					<td><%=producto.getPrecio()%></td>
				</tr>
				<%
					}
				%>




			</tbody>
		</table>

	</div>

	<div class="container well">
		<form action="Menu.jsp">
			<button type="submit" class="btn btn-secondary">Regresar al
				Menu</button>
		</form>
	</div>


</body>
</html>