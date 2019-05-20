<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<c:set var="context" value="${pageContext.request.contextPath}"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="ISO-8859-1">
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${context}/css/estilo-principal.css" type="text/css">
		<title>CIA 1.0</title>
	</head>
<body>
${negado}
	<div id="conteiner-login">
	<div id="box-login">
		<div id="box-login-imagem">
			<img alt="Imagem Login" src="${context}/img/login2.png">

		</div>
		<div id="titulo-login">
			<p>
				<span class="bpm22">22º BPM</span><br> Coleta de Informações para Análise<br> CIA 1.0
			</p>
		</div>
		<br>
		<form class="frm-login" action="Login" method="post">
			<div class="form-group">
				<label for="usuario">Usuario</label> <input type="text"
					class="form-control" id="usuario" aria-describedby="usuarioHelp" placeholder="Informe seu Usuario" name="usuario" autofocus="autofocus"> 
					<small id="usuarioHelp"	class="form-text text-muted">Caso você possua as credenciais. Por favor entrar em contato com o administrador.</small>
			</div>
			<div class="form-group">
				<label for="senha">Senha</label> <input type="password"
					class="form-control" id="usuario" placeholder="Senha" name="senha">
			</div>

			<button type="submit" class="btn btn-primary">Entrar</button>
			<small><a href="#">Esqueceu sua senha?</a></small>
		</form>
	</div>
	</div>
</body>
</html>