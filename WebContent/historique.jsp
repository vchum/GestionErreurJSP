<%@page import="service.HistoriqueService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.entity.HistoriqueEnum"%>
<%@page import="business.entity.Historique"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="style/main.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HistoriqueService hs = new HistoriqueService();

List<Historique> listH = (List<Historique>)session.getAttribute("LISTH");

if(listH == null){
	listH = new ArrayList<>();
}

hs.list().addAll(listH);

%>

<table class="mainTable">
<tr>
<th>Type de l'erreur</th>
<th>Libellé de l'erreur</th>
<th>Libellé de l'opération</th>
</tr>
<%
for(Historique h : hs.list()){

%>
<tr>
<td><%=h.getType_error() %></td>
<td><%=h.getLabel_error() %></td>
<%if(h.getLabel_operation() == HistoriqueEnum.LECTURE.getValue()){ %><td><%=HistoriqueEnum.LECTURE %></td><%} %>
<%if(h.getLabel_operation() == HistoriqueEnum.COMMENTAIRE.getValue()){ %><td><%=HistoriqueEnum.COMMENTAIRE %></td><%} %>
<%if(h.getLabel_operation() == HistoriqueEnum.TRAITEMENT.getValue()){ %><td><%=HistoriqueEnum.TRAITEMENT %></td><%} %>
<%if(h.getLabel_operation() == HistoriqueEnum.SUPRESSION.getValue()){ %><td><%=HistoriqueEnum.SUPRESSION %></td><%} %>

</tr>
<%} %>

</table>

<form action="index.jsp">
<input type="submit" value="Retour" class="button">
</form>

</body>
</html>