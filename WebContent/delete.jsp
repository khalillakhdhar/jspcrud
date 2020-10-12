<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="coworking.Work" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
Work w=new Work();
w.setId(id);
w.delete();
response.sendRedirect("index.jsp");
%>



<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>