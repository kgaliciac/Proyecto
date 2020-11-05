<%@ page import="src.main.java.Cliente_Empresa" %>
<%@ page import="src.main.java.ManejoDAO" %>
<%@ page import="src.main.java.ManejoDAO" %>

<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<% /*Titulo de la pagina */%>
<title>ModificarClienteEmpresa</title>

<% /*Hoja de estilo */%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<div class="container well">

<h1>Modificar Cliente de Empresa</h1>
</div>
</head>

</body>
<div class="Container">
<%
	/* type: que tipo de dato podra almacenar
id: atributo// <>br:un espacio hacia abajo */
%>

	<%
		Cliente_Empresa empresa=null;
		ManejoDAO dao=new ManejoDAO();
		String prueba= request.getParameter("codigo");
		if(prueba!=null){
			try {
				empresa=dao.getDBbuscarclienteempre(Integer.parseInt(prueba));
			}catch (Exception e){
				e.printStackTrace();
			}

		}
		if(empresa==null){
	%>


<form action="ModificarClienteEmpresa.jsp" method="get" class="form-control" style="width: 500px; height: 500px">
	    <div class="form-group">
		    <label for="codigo">Ingrese el codigo del cliente</label>
            <input type="text"class="form-control" id="codigo" name="codigo">
		    <button type="submit" class="btn btn-primary">Buscar</button>
	    </div>

	<div class="form-group">
		<label for="nombre">Nombre</label> <input type="text"
		class="form-control" class="form-control" id="nombre" name="nombre">

		<label for="direccion">Direccion</label> <input type="text"
		class="form-control" class="form-control" id="direccion" name="direccion">

		<label for="contacto">Contacto</label> <input type="text"
		class="form-control" class="form-control" id="contacto" name="contacto">

		<label for="descuento">Descuento Favorable</label> <input type="text"
		class="form-control" class="form-control" id="descuento" name="descuento">

    </div>

					<button type="submit" class="btn btn-primary">Modificar</button>



</form>



<%
}else{
%>

<form action="ModificarClienteEmpresa.jsp" method="get" class="form-control" style="width: 500px; height: 500px">
    <div class="form-group">
        <label for="codigo">Ingrese el codigo del cliente</label>
        <input type="text"class="form-control" id="codigo" name="codigo" value="<%=empresa.getIdCliente()%>">
        <button type="submit" class="btn btn-primary">Buscar</button>


    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=empresa.getNombreCliente()%>">

        <label for="direccion">Direccion</label>
        <input type="text" class="form-control" id="direccion" name="direccion" value="<%=empresa.getDireccion()%>">

        <label for="contacto">Contacto</label>
        <input type="text" class="form-control" id="contacto" name="contacto" value="<%=empresa.getContacto()%>">

        <label for="descuento">Descuento Favorable</label>
        <input type="text" class="form-control" id="descuento" name="descuento" value="<%=empresa.getDescuentoEmpresa()%>">

    </div>


        <button type="submit" class="btn btn-primary">Modificar</button>

    </div>
</form>




<%
        String codigo=request.getParameter("codigo");
        String nombre=request.getParameter("nombre");
        String apellido="SA";
        String direccion=request.getParameter("direccion");
        String contacto=request.getParameter("contacto");
        String descuento=request.getParameter("descuento");


        Cliente_Empresa client=new Cliente_Empresa(Integer.parseInt(codigo),nombre,apellido,direccion,
                contacto,15);
        dao.getDBmodificarclienteempre(client);

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

