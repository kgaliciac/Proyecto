<%@ page import="src.main.java.Cliente_Individual" %>
<%@ page import="src.main.java.ManejoDAO" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <%
        /*Titulo de la pagina */
    %>

    <title>AgregarClienteIndividual</title>
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
    <h1>Agregar Cliente Individual</h1>
</div>

<div class="container well/">

    <%
        Cliente_Individual individual=null;
        ManejoDAO dao=new ManejoDAO();
        String nombre= request.getParameter("nombre");

        if(nombre!=null){

            String apellido= request.getParameter("apellido");
            String direccion= request.getParameter("direccion");
            String dpi= request.getParameter("dpi");
            individual=dao.grabarClienteIndi(nombre,apellido,direccion,dpi);
        }
        if(individual==null){
    %>



    <form action="AgregarClienteIndividual.jsp" method="get" class="form-control" style="width: 350px; height: 400px">

        <div class="form-group">
            <label for="nombre">Nombre</label>
			<input type="text"class="form-control" id="nombre" name="nombre">

            <label for="apellido">Apellido</label>
			<input type="text" class="form-control" id="apellido" name="apellido">

            <label for="direccion">Dirección</label>
			<input type="text" class="form-control" id="direccion" name="direccion">

            <label for="dpi">Dpi</label>
			<input type="text" class="form-control" id="dpi" name="dpi">


            <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
    </form>
</div>


<div class="container well/">
    <table class="table">
        <%
            /* Cargara los datos de los clientes */
        %>
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
        <tr>

            <th scope="row">NO HAY DATOS</th>
            <td>NO HAY DATOS</td>
            <td>VNO HAY DATOS</td>
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
            <th scope="col">Id Cliente</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Dirección</th>
            <th scope="col">Dpi</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <th scope="row"><%=individual.getIdCliente()%></th>
            <td><%=individual.getNombreCliente()%></td>
            <td> <%=individual.getApellidoCliente()%></td>
            <td><%=individual.getDireccion()%></td>
            <td><%=individual.getDpi()%></td>
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
            Menu
        </button>
    </form>
</div>

</body>
</html>