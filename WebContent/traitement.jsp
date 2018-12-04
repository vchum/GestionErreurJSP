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
<script type="text/javascript">
function goToList(){
	var i = document.getElementById("listForm");
	i.submit();
	
}

function goToTraitment(){
	var i = document.getElementById("traitmentForm");
	i.submit();
	
}

</script>


<%
	String idError = (String) session.getAttribute("IDERROR");
	ErrorService ers = new ErrorService();
	ErrorItem eri = new ErrorItem();
	eri = ers.getById(Long.valueOf(idError));
%>

</head>

	<body>
	
	<form action="load.jsp">
	<table class="mainTable">
	<tr>
	<th>Ajouter un commentaire:</th>
	<th></th>
	
	</tr>
	
		<tr>
			<td><input type="text" name="comment" value="<%=eri.getCommentaire()%>" class="text"></td>
			<td><input type="submit" value="Ajout" class="button"> <input
				type="hidden" value="com" name="aTraiter"> <input
				type="hidden" value="<%=idError%>" name="idError">
			</td>
			
		</tr>
		
		<tr>
			
			<td>			
			<input type="button" value="Retour" onclick="javascript:goToList()" class="button">		
			</td>
			<td>
			<input type="button" value="Traiter" onclick="javascript:goToTraitment()" class="button">
			</td>
		</tr>
		
	</table>
	
	</form>
		<form action="index.jsp" id="listForm">			
		</form>
			<form action="load.jsp" id="traitmentForm">
			<input type="hidden" value="tra" name="aTraiter"> 
			<input type="hidden" value="<%=idError%>" name="idError">
		</form>
	</body>
</html>