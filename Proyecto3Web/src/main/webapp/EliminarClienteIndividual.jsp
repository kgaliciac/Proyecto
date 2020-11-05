<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.Cliente_Individual" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%/*Titulo de la pagina */%>

<title>EliminarClienteIndividual</title>

<%/*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<body>
	<%/* Se puede visualizar todos los clientes */%>
	<div class="container well/">
	<h1> Eliminar Cliente Individual</h1>
	</div>
<div class="container well/">

<form action="EliminarClienteIndividual.jsp"method="get" class="form-control" style="width: 300px; height: 200px">
	<div class="form-group">
		<label for="codigo">Ingrese el codigo del cliente</label> <input type="text"
			class="form-control" id="codigo" name="codigo">

	</div>

    <button action=" <%
                            try{
                                ManejoDAO dao=new ManejoDAO();

                            dao.getEliminarRegistroindividual(Integer.parseInt(request.getParameter("codigo")));

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
      <th scope="col">Apellido</th>
      <th scope="col">Dirección</th>
      <th scope="col">Dpi</th>
    </tr>
  </thead>
  <tbody>
  <%
      ManejoDAO manejoDAO = new ManejoDAO();

      List<Cliente_Individual> individuals = manejoDAO.getDBclienteindividual();

      int i=0;
      for(Cliente_Individual clienteIndividual: individuals){

  %>
  <tr>
      <th scope="row"><%=clienteIndividual.getIdCliente()%><</th>
      <td><%=clienteIndividual.getNombreCliente()%></td>
      <td> <%=clienteIndividual.getApellidoCliente()%></td>
      <td><%=clienteIndividual.getDireccion()%></td>
      <td><%=clienteIndividual.getDpi()%></td>
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

