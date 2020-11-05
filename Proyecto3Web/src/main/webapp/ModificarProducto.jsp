<%@ page import="src.main.java.Producto" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>

<title>ModificarProducto</title>


<%
	/*Hoja de estilo */
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<div class="container well/">
		<h1>Modificar Producto</h1>
</div>
</head>

</body>


<div class="Container">
		<%
			Producto producto=null;
			ManejoDAO dao=new ManejoDAO();
			String prueba= request.getParameter("codigo");
			if(prueba!=null){
				producto=dao.getDBproducto(Integer.parseInt(prueba));
			}
			if(producto==null){
		%>

	<form action="ModificarProducto.jsp" method="get" class="form-control" style="width: 300px; height: 100px">

			<div class="form-group">
				<div class="form-group">
				<label for="codigo">Ingrese Codigo de Producto</label>
				<input type="text"class="form-control" id="codigo" name="codigo">
				<button type="submit" class="btn btn-primary">Buscar Producto</button>
				</div>

				<div class="form-group">
					<label for="nombre">Nombre</label>
					<input type="text" class="form-control" id="nombre" name="nombre">

					<label for="descripcion">Descripcion</label>
					<input type="text"class="form-control" id="descripcion" name="descripcion">

					<label for="cantidad">Cantidad</label>
					<input type="number"class="form-control" id="cantidad" name="cantidad">

					<label for="precio">Precio</label>
					<input type="text"class="form-control" id="precio" name="precio">
				</div>

				<button type="submit" class="btn btn-primary">Modificar</button>

			</form>


		<%
	}else{
		%>
	<form action="ModificarProducto.jsp"method="get" class="form-control" style="width: 500px; height: 500px">
		<div class="form-group">
			<label for="codigo">Ingrese el codigo del cliente</label>
			<input type="text"class="form-control" id="codigo" name="codigo" value="<%=producto.getIdProducto()%>">
			<button type="submit" class="btn btn-primary">Buscar Cliente</button>

			<div class="form-group">
				<label for="nombre">Nombre</label>
				<input type="text" class="form-control" id="nombre" name="nombre" value="<%=producto.getNombreProducto()%>">

				<label for="descripcion">Descripcion</label>
				<input type="text"class="form-control" id="descripcion" name="descripcion" value="<%=producto.getDescripcion()%>">

				<label for="cantidad">Cantidad</label>
				<input type="number"class="form-control" id="cantidad" name="cantidad" value="<%=producto.getCantidadInventario()%>">

				<label for="precio">Precio</label>
				<input type="text"class="form-control" id="precio" name="precio" value="<%=producto.getPrecio()%>" >

			</div>


			<button type="submit" class="btn btn-primary">Modificar</button>

		</div>
	</form>



		<%
				String codigo=request.getParameter("codigo");
				String nombre=request.getParameter("nombre");
				String descripcion=request.getParameter("descripcion");
				String cantidad=request.getParameter("cantidad");
				String precio=request.getParameter("precio");


			try {
				Producto product=new Producto(Integer.parseInt(codigo),nombre,descripcion,
						Integer.valueOf(cantidad),Double.valueOf(precio));
				dao.getDBmodificarproducto(product);

			}catch (Exception e){

				e.printStackTrace();
			}

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