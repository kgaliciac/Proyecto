<%@ page import="src.main.java.Cliente_Empresa" %>
<%@ page import="java.util.List" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%/*Titulo de la pagina */%>

<title>VerClientesEmpresa</title>

<%/*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

	<%/* Se puede visualizar todos los clientes */%>
	
	<div class="container well/">
	<h1> Todos Los Clientes de Empresa</h1>
	</div>

	<div class="container well/">
	<table class="table">
	<%/* Cargara los datos de los clientes */%>
  <thead>
    <tr>
      <th scope="col">Id Cliente</th>
      <th scope="col">Nombre</th>
      <th scope="col">Sociedad</th>
      <th scope="col">Dirección</th>
      <th scope="col">Contacto</th>
      <th scope="col">Descuento</th>
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
    				<button type="submit" class="btn btn-secondary">Regresar al Menu </button>
    				</form>
					</div>
</body>
</html>

