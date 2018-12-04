<%@page import="entity.ErrorItem"%>
<%@page import="service.ErrorService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style/main.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
ErrorService ers = new ErrorService();
%>

</head>
<body>

<table class="mainTable">
<tr>
<th>Type</th>
<th>Libellé</th>
</tr>

<%
for(ErrorItem e : ers.list()){
if(e.getStatus() == 3){
%>

<tr>
<td><%=e.getType() %></td>
<td><%=e.getLabel() %></td>

</tr>

<%}} %>

</table>
<form action="index.jsp">
<input type="submit" value="Retour" class="button">

</form>

<form action="load.jsp">
<input type="submit" value="Détruire tout" class="button">
<input type="hidden" name="aTraiter" value="remPro">
</form>

</body>
</html>