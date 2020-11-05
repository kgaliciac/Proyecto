<%@ page import="src.main.java.Producto" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>


<title>AgregarProducto</title>
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
		<h1>Agregar Producto</h1>
	</div>

	<div class="container well/">


		<%
			Producto producto=null;
			ManejoDAO dao=new ManejoDAO();
			String nombre= request.getParameter("nombre");

			if(nombre!=null){
				String descripcion= request.getParameter("descripcion");
				String cantidad= request.getParameter("cantidad");
				String precio= request.getParameter("precio");
				producto=dao.grabarProducto(nombre,descripcion,Integer.parseInt(cantidad),Double.parseDouble(precio));
			}
			if(producto==null){
		%>


		<form action="AgregarProducto.jsp" method="get"	class="form-control" style="width: 350px; height: 400px">

			<div class="form-group">
				<label for="nombre">Nombre</label> <input type="text"
					class="form-control" id="nombre" name="nombre">
				<label for="descripcion">Descripcion</label><input
					type="text" class="form-control" id="descripcion" name="descripcion">
				<label for="cantidad">Stock</label> <input type="text"
					class="form-control" id="cantidad" name="cantidad">
					<label for="precio">Precio</label> <input type="text"
					class="form-control" id="precio" name="precio">


				<button type="submit" class="btn btn-primary">Agregar</button>
			</div>
		</form>
	</div>



	<div class="container well/">
		<table class="table">
			<%
				/* Cargara los datos de los clientes de Empresa */
			%>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">Nombre</th>
					<th scope="col">Descripcion</th>
					<th scope="col">Stock</th>
					<th scope="col">Precio</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">NO HAY DATOS</th>
					<td>NO HAY DATOS</td>
					<td>NO HAY DATOS</td>
					<td>NO HAY DATOS</td>
					<td>NO HAY DATOS</td>
				</tr>

			</tbody>
		</table>


	</div>


	<%
	}else{
	%>


	<div class="container well/">
		<table class="table">
			<%
				/* Cargara los datos de los clientes */
			%>
			<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">Nombre</th>
				<th scope="col">Descripcion</th>
				<th scope="col">Stock</th>
				<th scope="col">Precio</th>

			</tr>
			</thead>
			<tbody>
			<tr>

				<th scope="row">1</th>
				<td><%=producto.getNombreProducto()%></td>
				<td> <%=producto.getDescripcion()%></td>
				<td><%=producto.getCantidadInventario()%></td>
				<td><%=producto.getPrecio()%></td>
			</tr>

			</tbody>
		</table>
	</div>

	<%

		}

	%>






		<div class="container well">
		<form action="Menu.jsp">
			<button type="submit" class="btn btn-secondary">Regresar al
				Menu</button>
		</form>
	</div>
	</div>
	

</body>
</html>