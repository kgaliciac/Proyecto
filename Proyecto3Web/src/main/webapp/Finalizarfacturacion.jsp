<%@ page import="src.main.java.*" %><%--
  Created by IntelliJ IDEA.
  User: edy chay
  Date: 29/10/2020
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
</head>

    <title>Finalizacion de Factura</title>

    <%/*Hoja de estilo */%>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">

</head>
<body>
<div class="container well/">
    <h1>La facturacion fue correcta</h1>
</div>
<%
    ManejoDAO dao=new ManejoDAO();
    Double totalfinal=0.00;
    for (int i=0;i< Cadenproducto.producto.size();i++){
        totalfinal=totalfinal+Cadenproducto.producto.get(i).getPrecio();
    }

    dao.getmodificartotaldefactura(Facturauniversal.getFactura().getNumerodefactura(),totalfinal);
    Acceso.setAccess(false);

    for (int j=0;j<Cadenproducto.producto.size();j=0){
        System.out.println(j+"  "+Cadenproducto.producto.size());
     Cadenproducto.producto.remove(j);

    }
%>

<div class="container well">
    <form action="Menu.jsp">
        <button type="submit" class="btn btn-secondary" >Regresar al
            Menu</button>
    </form>
</div>
</body>
</html>
