<%@ page import="java.util.List" %>
<%@ page import="src.main.java.*" %>
<html>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%/*Titulo de la pagina */%>

<title>BuscarClienteIndividual</title>

<%/*Hoja de estilo */%>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous">

<%/* Se puede visualizar todos los clientes */%>
<body>
<%
    Factura factura =null;
    Cliente_Individual cliente=null;
    ManejoDAO dao=new ManejoDAO();
    String prueba= request.getParameter("codigo");
    if(prueba!=null){
        factura=dao.getDBbuscarfactura(Integer.parseInt(prueba));
        cliente=dao.getDBbuscarclienteIndi(factura.getIdcliente());
    }
    if(factura==null){
%>

<form action="BuscarFactura.jsp" method="get" class="form-control" style="width: 1000px; height: 650px">

    <div class="form-group">
        <label for="codigo">Ingrese el codigo del cliente</label>
        <input type="text" class="form-control" id="codigo" name="codigo" >
        <button type="submit" class="btn btn-primary">Buscar Cliente</button>

        <div class="form-group">

        </div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Numero de factura</th>
                <th scope="col">Codigo Cliente</th>
                <th scope="col">Nombre de cliente</th>
                <th scope="col">Total de factura</th>
            </tr>
            </thead>
            <tr>
                <th scope="row">NO HAY DATOS</th>
                <td>NO HAY DATOS</td>
                <td>NO HAY DATOS</td>
                <td>NO HAY DATOS</td>
            </tr>
        </table>
    </div>

    <button type="submit" class="btn btn-primary">Modificar</button>

    </div>

</form>

</div>

<%
}else{
%>
<form action="BuscarFactura.jsp"method="get" class="form-control" style="width: 1000px; height: 650px">
    <div class="form-group">
        <label for="codigo">Ingrese el codigo del cliente</label>
        <input type="text"class="form-control" id="codigo" name="codigo" value="<%=factura.getNumerodefactura()%>">
        <button type="submit" class="btn btn-primary">Buscar con Numero de Factura</button>

        <div class="container well/">
            <table class="table" class="form-control" >
                <thead>
                <tr>
                    <th scope="col">Numero de factura</th>
                    <th scope="col">Codigo Cliente</th>
                    <th scope="col">Nombre de cliente</th>
                    <th scope="col">Total de factura</th>
                </tr>
                </thead>

                <tr>
                    <th scope="row"><%=factura.getNumerodefactura()%></th>
                    <td><%=factura.getIdcliente()%></td>
                    <td> <%=cliente.getNombreCliente()%></td>
                    <td><%=factura.getTotalprecio()%></td>
                </tr>
            </table>
        </div>


        <div class="container well/">
            <table class="table" class="form-control" >
                <thead>
                <tr>
                    <th scope="col">id de producto</th>
                    <th scope="col">Nombre de producto</th>
                    <th scope="col">Descripcion de producto</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Subtotal</th>
                </tr>
                </thead>
                <%
                    List<Producto> productos=null;
                    productos=dao.getDBdetallefactura(factura.getNumerodefactura());
                    for (Producto producto: productos){

                %>
                <tr>
                    <th scope="row"><%=producto.getIdProducto()%></th>
                    <td><%=producto.getNombreProducto()%></td>
                    <td> <%=producto.getDescripcion()%></td>
                    <td><%=producto.getCantidadInventario()%></td>
                    <td><%=producto.getPrecio()%></td>
                </tr>

                <%

                }%>
            </table>
        </div>
    </div>
</form>
<%
    }
%>

<form action="Menu.jsp">
    <button type="submit" class="btn btn-secondary">Regresar al Menu </button>
</form>

</body>
</html>