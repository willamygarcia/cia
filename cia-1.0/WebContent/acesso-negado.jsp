<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="context" value="${pageContext.request.contextPath}" />
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3;URL='../login.jsp'">
<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
<link rel="stylesheet" href="${context}/css/estilo-principal.css" type="text/css">
<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css"
	type="text/css">
<title>CIA 1.0</title>
</head>
<body>

	<div class="alert alert-danger" role="alert">
		<h4 class="alert-heading">Acesso Negado!!! Você não está logado.</h4>
		<p>
			Para acessar essa parte do Sistema você deve entrar co login e senha válidos.
			Em 3 Segundos você será redirecionado para pagina de Login.
		</p>
		<hr>
		<p class="mb-0">Caso não queira esperar é só clicar em "Voltar" logo abaixo.</p>
			<a class="btn btn-info" href="../login.jsp">Voltar</a>
	</div>

</body>
</html>