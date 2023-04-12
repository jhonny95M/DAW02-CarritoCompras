<%@page import="MisRutinas.Productos" %>
<%@page import="MisRutinas.BD" %>
<%@page import="java.util.ArrayList" %>
<%
    // Recuperar el codigo del producto
    String IdPro = request.getParameter("id");
    // Proceso de Consulta
    BD ObjBD = new BD();
    Productos ObjP = new Productos();
    ObjP = ObjBD.InfoProducto(IdPro);
%>
<center>
    <h1>Detalle de Producto</h1>
    <form action="cesto">
    <table border="1">
        <tr>
            <td>IdProducto</td>
            <td><input name="txtid" value=<%=ObjP.getIdProducto()%> readonly></td>
        </tr>
        <tr>
            <td>Descripcion</td>
            <td><%=ObjP.getDescripcion()%></td>
        </tr>
        <tr>
            <td>Precio Unidad</td>
            <td><%=ObjP.getPrecioUnidad()%></td>            
        </tr>
        <tr>
            <td>Imagen</td>
            <td><img src=imagenes/<%=ObjP.getImagen()%> width="200" height="200"></td>
        </tr>
        <tr>
            <td>Cantidad a Comprar</td>
            <td><input name="txtcant" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Agregar al Cesto"/></td>
            <td><input type="reset" /></td>
        </tr>
    </table>
    </form>
    <a href="javascript:history.back()">Seleccionar Otro Producto</a>
</center>