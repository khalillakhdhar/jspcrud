<%@page import="com.mysql.jdbc.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   > 
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<%@ page import="coworking.Work" %>
<%@ page import="coworking.*" %>
<%
Work w=new Work();
String t="";
String d="";
if(request.getParameter("id")!=null)
	
{
	
	t=request.getParameter("titre");
	d=request.getParameter("description");

	
}
else if(request.getParameter("titre")!=null)
{
	w.setTitre(request.getParameter("titre"));
	w.setDescription(request.getParameter("description"));
	w.add();
}


%>
<meta charset="ISO-8859-1">
<title>Gestion des traveaux</title>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col-sm">
    </div>
    <div class="col-sm">
<form action="index.jsp" method="post">
<table>
<tr><td>titre</td><td><input class="form-control" type="text"  value="<%= t %>" required name="titre"></td></tr>
<tr><td>Description</td><td><textarea class="form-control"  required name="description"><%=d %></textarea></td>
<tr><td colspan="2" align="center"><%if(request.getParameter("id")==null){ %><input  type="submit" class="btn btn-primary" value="envoyer">
<% } else
{
	
	%>
	<input  type="submit" name="md" class="btn btn-primary" value="modifier">

<%
}%>

</td></tr> 
</table>
</form>    </div>
    <div class="col-sm">
    </div>
  </div>
</div>
<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Titre</th>
      <th scope="col">description</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  ResultSet rs=w.lister();
 while(rs.next()) {
  %>
    <tr>
      <th scope="row"><%= rs.getInt("id") %></th>
      <td>
    <%= rs.getString("titre") %>
      </td>
      <td>     <%= rs.getString("description") %> 
      </td>
      <td>
        <a href="index.jsp?id=<%= rs.getInt("id") %>&titre=<%= rs.getString("titre") %>&description=<%= rs.getString("description") %> "  class="btn btn-success">Modifier</a>
        <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">supprimer</a>
      
      
      </td>
    </tr>
   
  <% } %>
  </tbody>
</table>


</body>
</html>