<%@ page import="src.main.java.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%
	/*Titulo de la pagina */
%>


<title>RealizarFactura</title>
</head>

<%
	/*Hoja de estilo */
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">


<%
	/* Mostrara la creacion de la factura */
%>
<body>
	<div class="container well/">
		<h1>Realizar Factura</h1>
	</div>

	<div class="container well/">

		<%
			Factura fac=null;
			Cliente_Individual indi=null;
			ManejoDAO manejo=new ManejoDAO();
			String nombre= request.getParameter("codigo");

			if(nombre!=null){

				try {

					indi=manejo.getDBbuscarclienteIndi(fac.getIdcliente());

				}catch (Exception e){
					e.printStackTrace();
				}

			}
			if(Acceso.isAccess()==false){
		%>


		<form action="RealizarFactura.jsp" method="get"
			class="form-control" style="width: 350px; height: 400px">

			<div class="espacio/">
				<div class="form-group">
					<label for="codigo">Ingrese el codigo del cliente</label> <input
						type="text" class="form-control" id="codigo" name="codigo">
					<button action="
					<%

						try{
							ManejoDAO dao=new ManejoDAO();
							fac=manejo.grabarFactura(Integer.parseInt(nombre));
							String codigo= request.getParameter("codigo");


							if(fac!=null){

								if (Acceso.isAccess()==false){

									Clienteuniversal.setCliente(dao.getDBbuscarclienteIndi(fac.getIdcliente()));
									Facturauniversal.setFactura(dao.getDBbuscarfactura(fac.getNumerodefactura()));
									Acceso.setAccess(true);
								}

								if(1==1){
   								   response.sendRedirect("RealizarFactura.jsp");
    								 }
							}
						}catch (Exception e){
							e.printStackTrace();
						}
					%>

					" type="submit" class="btn btn-primary">Agregar Cliente</button>
				</div>

			</div>
		</form>
	</div>


	<div class="container well/">
		<h2>Productos Agregados</h2>
	</div>
	</body>
	<body>
	<%
	}else{

		Producto producto=null;
		ManejoDAO dao=new ManejoDAO();
		String codigo= request.getParameter("idproducto");
		List<Producto> produlist=new ArrayList<Producto>();
		Acceso.setAccess(true);

		try {
			if(codigo!=null){
				System.out.println(codigo);
				String cantidad= request.getParameter("cantidad");

				producto=dao.getDBbuscarproducto(Integer.parseInt(codigo));

				if(dao.verificarStock(Integer.parseInt(codigo),Integer.parseInt(cantidad))){
					producto=dao.grabarDetalle(Integer.parseInt(codigo), Facturauniversal.getFactura().getNumerodefactura(),Integer.parseInt(cantidad));

					Cadenproducto.producto.add(producto);
				}

		}

		}catch (Exception e){
			e.printStackTrace();
		}
	%>

	<div class="container well/">
		<table class="table">
			<%
				/* Cargara los datos de los clientes */
			%>
			<thead>
			<tr>
				<th scope="col">No. de factura</th>
				<th scope="col">Codigo Cliente</th>
				<th scope="col">Nombre de Cliente</th>

			</tr>
			</thead>
			<tbody>
			<tr>

				<%
				try {


				%>

				<th scope="row"><%=Facturauniversal.getFactura().getNumerodefactura()%></th>
				<td><%=Facturauniversal.getFactura().getIdcliente()%></td>
				<td><%=Clienteuniversal.getCliente().getNombreCliente()%></td>
				<%}catch (Exception e){
					e.printStackTrace();
				}

				%>


			</tr>

			</tbody>
		</table>
	</div>

	<form>

		<label for="idproducto">Ingrese codigo de producto a facturar</label>
		<input type="text" class="form-control" id="idproducto" name="idproducto" >

		<label for="cantidad">Cantidad</label>
		<input type="text" class="form-control" id="cantidad" name="cantidad">

		<button type="submit" class="btn btn-primary">Agregar Items</button>


	</form>


		<table class="table">
			<%
				/* Cargara los datos de los clientes */
			%>
			<thead>
			<tr>
				<th scope="col">Id Producto</th>
				<th scope="col">Nombre producto</th>
				<th scope="col">Cantidad </th>
				<th scope="col">subtotal </th>

			</tr>
			</thead>
			<tbody>

				<%
						try {
						for (int i=0;i<Cadenproducto.producto.size();i++) {

				%>
				<tr>
				<th scope="row"><%=Cadenproducto.producto.get(i).getIdProducto()%></th>
				<td><%=Cadenproducto.producto.get(i).getNombreProducto()%></td>
				<td><%=Cadenproducto.producto.get(i).getCantidadInventario()%></td>
				<td><%=Cadenproducto.producto.get(i).getPrecio()%></td>
				</tr>
				<%}
							}catch (Exception e){
							e.printStackTrace();}
				%>


			</tbody>
		</table>
	</div>

	<div class="container well">
		<form action="Finalizarfacturacion.jsp">
			<button type="submit" class="btn btn-secondary" >Finalizar</button>
		</form>
	</div>

	</body>
	<%
		}
	%>

	<div class="container well">
		<form action="Menu.jsp">
			<button type="submit" class="btn btn-secondary" >Regresar al Menu</button>
		</form>
	</div>




</body>
</html>