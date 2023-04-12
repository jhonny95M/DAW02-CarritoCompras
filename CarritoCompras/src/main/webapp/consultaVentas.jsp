<%@page import="MisRutinas.BD"%>
<%@page import="MisRutinas.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Consulta de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
ArrayList<Clientes>lstClientes=new ArrayList<Clientes>();
BD ObjBD = new BD();
lstClientes=ObjBD.ListarClientes();
%>
<div class="container">
<form action="consulta-venta-cliente" id="idForm">
<div class="row mt-5">
<div class="col-8">
<label>Seleccione un Cliente</label>
<select class="form-select" name="cboIdCliente" aria-label="Default select example">
  <%
  for(Clientes cli : lstClientes){
	  %>
	  <option value="<%=cli.getIdCliente()%>"><%=(cli.getApellidos() + ", " + cli.getNombres())%></option>
	  <%
  }
  %>
</select>
</div>
<div class="col-4 mt-4">
  <div class="d-grid gap-2">
<button type="submit" class="btn btn-primary">Consultar</button>
</div>
</div>
</div>
</form>
<div class="row mt-2">
<div class="col-12">
<div id="content-table">
</div>
</div></div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script>
$("#idForm").submit(function(e) {

    e.preventDefault(); // avoid to execute the actual submit of the form.
    $("#content-table").empty();
    var form = $(this);
    var actionUrl = form.attr('action');
    
    $.ajax({
        type: "POST",
        url: actionUrl,
        data: form.serialize(), // serializes the form's elements.
        success: function(data)
        {
          $("#content-table").append(data);
        }
    });
    
});
</script>
</body>
</html>