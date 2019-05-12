<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		
		<c:set var="context" value="${pageContext.request.contextPath}" />
		<meta charset="ISO-8859-1">
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${context}/css/estilo-principal.css" type="text/css">	
		<title>CIA 1.0</title>
	</head>
<body>
	<header id="cabecalho">
		<figure id="imagem-topo">
			<a href="/cia-1.0/pages/principal.jsp"><img alt="Imagem Topo" src="${context}/img/topo.png"></a>
		</figure>
		<div id="box-titulo">
			<div class="titulo-topo">CIA 1.0</div>
			<div class="subtitulo-topo">Coleta de Informações para Análise</div>
		</div>
		<nav id="menu-drop">
			<ul class="menu">
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroUsuarios.jsp">Usuários</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroCidadao.jsp">Cidadão</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroViaturas.jsp">Viatura</a></li>
							<li><a class="link-item" href="#">Facções</a></li>
						</ul>
				</li>
				<li><a href="#">Consultas</a></li>
				<li><a href="#">Consultas</a></li>
				<li><a href="#">Controle</a></li>
				<li><a href="#">Relatorios</a></li>
				<li><a href="login.jsp">Sair</a></li>
			
			</ul>
		</nav>
		
	</header>
	<aside id="box-left">
		<nav id="menu-nav-left">
			<ul>
	
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do Cidadão</a></li>
				<li><a href="/cia-1.0/pages/cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorência</a></li>
				<li><a href="#">Escalas de Serviços</a></li>
				<li><a href="#">Controle de Viaturas</a></li>
				<li><a href="#">Facções</a></li>
				<li><a href="#">Relatórios</a></li>
				<li><img alt="Link´s Úteis" src="${context}/img/linksuteis.png"></li>
				<li><a href="http://apps4.sspds.ce.gov.br/consulta/index.do" target="_blank">SIP</a></li>
				<li><a href="https://erdsice2.prf.gov.br/spia/public/index.php" target="_blank">SPIA</a></li>
				<li><a href="http://sisbol.pm.ce.gov.br/login_bcg/" target="_blank">SISBOL - Boletim</a></li>
				<li><a href="http://sisdia.pm.ce.gov.br/sisdi_login/" target="_blank">Gerenciamento de Diárias</a></li>
			</ul>
		</nav>
	</aside>
	<div id="conteiner">
		<div id="tela-principal">
			<figure id="imagem-tela-princial">
				<img alt="Policia Militar do Ceara" src="${context}/img/logoPM.png">
				<figcaption id="legenda-imagem-principal">22ºBPM</figcaption>	
			</figure>
			
		
		</div>
	</div>
	
	<footer id="rodape">
		<span></span>
		<nav>
			<ul>
				<li>Copyright © | 2018 | #Cobax Tecnologia - Todos os Direitos Reservados</li>
				<li><a href="https://www.instagram.com/willamygarcia/" target="_blank">Sobre o autor</a></li>
				<li><a href="mailto:willamy.t.i@gmail.com?Subject=Suporte%20CIA1.0" target="_top">Suporte: willamy.t.i@gmail.com</a></li>
			</ul>
		</nav>
	</footer>


</body>
</html>