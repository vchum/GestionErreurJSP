<%@page import="java.util.List"%>
<%@page import="entity.ErrorItem"%>
<%@page import="service.ErrorService"%>
<%@page import="dao.ErrorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="style/main.css" type="text/css">
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function goToTraitment(id){
	
	document.getElementById("idError").value = id;
	var i = document.getElementById("traitForm");
	i.submit();
	
}

</script>

</head>

<%
ErrorService ers = new ErrorService();
%>
<body>

<table class="mainTable">
<tr>
<th>Type</th>
<th>Libellé</th>
<th>Niveau</th>
<th>Commentaire</th>
<th>Status</th>
<th></th>
</tr>

<%
for(ErrorItem e : ers.list()){

if(e.getStatus() != 3){
%>

<tr>
<td><%=e.getType() %></td>
<td><%=e.getLabel() %></td>
<td><%=e.getLevel() %></td>
<td><%=e.getCommentaire() %></td>
<%if(e.getStatus() == 0){ %><td>NON LU</td><%} %>
<%if(e.getStatus() == 1){ %><td>LECTURE</td><%} %>
<%if(e.getStatus() == 2){ %><td>COMMENTAIRE</td><%} %>
<td><input class="button" type="button" value="Traitement" onclick="javascript:goToTraitment(<%=e.getId()%>)"></td>

</tr>

<%}} %>
</table>
<form action="traiter.jsp">
<input class="button" type="submit" value="Voir Traitées">

</form>
<form action="historique.jsp">
<input class="button" type="submit" value="Historique">

</form>
</body>
<form action="load.jsp" id="traitForm">
<input type="hidden" id="idError" name="idError">
<input type="hidden" value="lect" name="aTraiter">
</form>
</html>