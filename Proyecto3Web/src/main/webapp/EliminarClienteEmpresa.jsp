<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Cliente_Empresa" %>
<%@ page import="java.util.List" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%/*Titulo de la pagina */%>

<title>EliminarClienteEmpresa</title>

<%/*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<%/* Se puede visualizar todos los clientes */%>

<body>
	<div class="container well/">
		<h1>Eliminar Cliente Empresa</h1>
	</div>
	<div class="container well/">

		<form action="EliminarClienteEmpresa.jsp" method="get"
			class="form-control" style="width: 300px; height: 200px">
			<div class="form-group">
				<label for="codigo">Ingrese el codigo del cliente</label> <input
					type="text" class="form-control" id="codigo" name="codigo">

			</div>

			<button action="<%
                            try{
                                ManejoDAO dao=new ManejoDAO();

                            dao.getEliminarRegistroempresa(Integer.parseInt(request.getParameter("codigo")));

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
					<th scope="col">Id Cliente</th>
					<th scope="col">Nombre</th>
					<th scope="col">Direccion</th>
					<th scope="col">Contacto</th>
					<th scope="col">Descuento Favorable</th>
				</tr>
			</thead>
			<tbody>
			<%
				ManejoDAO manejoDAO = new ManejoDAO();

				List<Cliente_Empresa> clienteempre = manejoDAO.getDBclienteempresa();

				int i=0;
				for(Cliente_Empresa cliente_empresa: clienteempre){

			%>
			<tr>
				<th scope="row"><%=cliente_empresa.getIdCliente()%></th>
				<td><%=cliente_empresa.getNombreCliente()%></td>
				<td> <%=cliente_empresa.getApellidoCliente()%></td>
				<td><%=cliente_empresa.getDireccion()%></td>
				<td><%=cliente_empresa.getContacto()%></td>
				<td><%=cliente_empresa.getDescuentoEmpresa()%></td>
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