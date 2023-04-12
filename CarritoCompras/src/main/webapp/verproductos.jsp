<%@page import="MisRutinas.Productos" %>
<%@page import="MisRutinas.BD" %>
<%@page import="java.util.ArrayList" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<%
    // Recuperar el IdCategoria
    String IdCat = request.getParameter("id");
    BD ObjBD = new BD();
    ArrayList<Productos> Lista = new ArrayList<Productos>();
    Lista = ObjBD.ListarProductos(IdCat);
%>
<center>
    <h1>Tienda Virtual de Compras</h1>
    <table border="1">
       <%--  <tr>
        <% int columnas = 0;
            for(Productos ObjP:Lista){ 
            String imagen="<img src=imagenes/"+ObjP.getImagen()+">";
            String enlace="<a href=verdetalle.jsp?id="+
                    ObjP.getIdProducto()+">Ver Detalle</a>";
            if(columnas % 2 == 0){ out.print("</tr><tr>"); }
        %>
            <td align="center"><%=ObjP.getDescripcion()%>
                <br><%=imagen%>
                <br><%=enlace%>
            </td>
        <% columnas++; } %> --%>
    </table>
    <div class="row">
     <% int columnas = 0;
            for(Productos ObjP:Lista){ 
            String imagen="<img src=imagenes/"+ObjP.getImagen()+" class=\"card-img-top \" width=200 height=200>";
            String enlace="<a href=verdetalle.jsp?id="+
                    ObjP.getIdProducto()+">Ver Detalle</a>";
            //if(columnas % 2 == 0){ out.print("</tr><tr>"); }
        %>
            
       
    <div class="col-sm-4 mb-3 mb-sm-1">

<div class="card" style="width: 18rem;">
  <%=imagen%>
  <div class="card-body">
   <h5 class="card-title"><%=ObjP.getDescripcion()%></h5>
   <%=enlace %>
  </div>
</div>
</div>
     <% columnas++; } %>
    </div>
    
    
    <a href="index.jsp">Seleccionar otra categoria</a>
</center>
