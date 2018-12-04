<%@page import="service.HistoriqueService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.entity.Historique"%>
<%@page import="java.util.List"%>
<%@page import="service.ErrorService"%>
<%@page import="entity.ErrorItem"%>
<%@page import="dao.ErrorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
ErrorService ers = new ErrorService();
HistoriqueService hs = new HistoriqueService();

List<Historique> listH = (List<Historique>)session.getAttribute("LISTH");

if(listH == null){
	listH = new ArrayList<>();
}

hs.list().addAll(listH);

ErrorItem eri = null;
String mode = request.getParameter("aTraiter");
String idError = request.getParameter("idError");

String commentaire = request.getParameter("comment");

switch (mode){

case "lect":
	
	ers.readError(Long.valueOf(idError));
	eri = ers.getById(Long.valueOf(idError));
	
	hs.addHistory(eri);
	session.setAttribute("LISTH", hs.list());
	session.setAttribute("IDERROR", idError);
	
	response.sendRedirect("traitement.jsp");
	
	break;
	

case "com":
	eri = ers.getById(Long.valueOf(idError));
	ers.updateCommentaire(Long.valueOf(idError), commentaire);
	
	hs.addHistory(eri);
	session.setAttribute("LISTH", hs.list());
	
	response.sendRedirect("index.jsp");
	
	break;
	
case "tra":
	eri = ers.getById(Long.valueOf(idError));
	ers.traitmentErrorClear(Long.valueOf(idError));
	
	hs.addHistory(eri);
	session.setAttribute("LISTH", hs.list());
	
	response.sendRedirect("index.jsp");
	break;
	
case "remPro":	
	ers.removeAllProcesses(eri, hs.list());	
	
	session.setAttribute("LISTH", hs.list());	
	response.sendRedirect("index.jsp");

}
%>

</body>
</html>