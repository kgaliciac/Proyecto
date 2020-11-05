<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Producto" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>


<title>Eliminar Producto</title>


<%
	/*Hoja de estilo */
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">




	<div class="container well/">
		<h1> Eliminar producto</h1>
	</div>



	<div class="container well/">
		<form action="EliminarProducto.jsp"method="get" class="form-control" style="width: 300px; height: 200px">
			<div class="form-group">
				<label for="codigo">Ingrese el codigo del producto</label>
				<input type="text" class="form-control" id="codigo" name="codigo">

			</div>

			<button action=" <%
                            try{
                                ManejoDAO dao=new ManejoDAO();

                            dao.getEliminarproducto(Integer.parseInt(request.getParameter("codigo")));

                            }catch(Exception e){
                                e.printStackTrace();
                             }


                        %>   " type="submit" class="btn btn-primary">Eliminar</button>

		</form>
	</div>

	<div class="container well/">
		<table class="table">
			<%/* Cargara los datos de los clientes */%>
			<thead>
			<tr>
				<th scope="col">Codigo de Producto</th>
				<th scope="col">Nombre</th>
				<th scope="col">Descripcion</th>
				<th scope="col">Cantidad</th>
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
				<th scope="row"><%=producto.getIdProducto()%><</th>
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
			<button type="submit" class="btn btn-secondary">Regresar al Menu </button>
		</form>
	</div>

</body>
</html>
