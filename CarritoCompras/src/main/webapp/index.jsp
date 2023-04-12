<%@page session="true" %>
<%@page import="MisRutinas.Categorias" %>
<%@page import="MisRutinas.BD" %>
<%@page import="java.util.ArrayList" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link href="/estilos/miestilo.css">
<%
    BD ObjBD = new BD();
    ArrayList<Categorias> Lista = new ArrayList<Categorias>();
    Lista = ObjBD.ListarCategorias();
    HttpSession MiSesion = request.getSession();
    // Recuperando valores de sesion
    int numero = MiSesion.getAttribute("numarticulos")==null ? 0 : 
                (Integer)(MiSesion.getAttribute("numarticulos")); 
    double total = MiSesion.getAttribute("total")==null ? 0 : 
                (Double)MiSesion.getAttribute("total");    
%>
<div class="container-fluid" style="background-color: #f1f4f6">
<div class="row">
<div class="col-12">
<div class="d-flex justify-content-center">
<div class="align-middle">
<h1>Tienda Virtual de Compras</h1>
<table border="1">
    <tr bgcolor="Yellow">
        <td colspan="2" align="center">
            <b>Usted ha comprado hasta el momento <%=numero%> articulos
            <br>Su total a pagar es S/. <%=total%> SOLES</b>
        </td>
    </tr>
<tr>
<%  /*int columnas = 0;
    for(Categorias ObjC:Lista){ 
    String imagen = "<img src=imagenes/"+
                    ObjC.getImagen()+" width=150 height=150>";
    String enlace = "<a href=verproductos.jsp?id="+
                    ObjC.getIdCategoria()+">Ver Productos</a>";
    if(columnas % 2 == 0){ out.print("</tr><tr>"); }*/
%>
     <%-- <td align="center">
        <%=ObjC.getDescripcion()%>
        <br><%=imagen%>
        <br><%=enlace%>
    </td> --%>
<% //columnas++; } %>
</table>
</div>
</div>
</div>
</div>
<div class="row">
<%  int columnas = 0;
    for(Categorias ObjC:Lista){ 
    String imagen = "<img src=imagenes/"+
                    ObjC.getImagen()+" class=\"card-img-top \" width=200 height=200>";
    String enlace = "<a href=verproductos.jsp?id="+
                    ObjC.getIdCategoria()+">Ver Productos</a>";
    //if(columnas % 2 == 0){ out.print("</tr><tr>"); }
%>

<div class="col-sm-4 mb-3 mb-sm-1">

<div class="card shadow" style="width: 18rem;">
  <%=imagen%>
  <div class="card-body">
   <h5 class="card-title"><%=ObjC.getDescripcion()%></h5>
   <%=enlace %>
  </div>
</div>
</div>

<% columnas++; } %>
</div>
</div>