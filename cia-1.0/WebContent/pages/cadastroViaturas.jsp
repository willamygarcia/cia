
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../ico/principal.ico" type="image/x-icon">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/estilo-principal.css" type="text/css">
<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery.maskedinput.min.js"></script>
<title>CIA 1.0 - Viatura</title>
</head>
<body>
	<header id="cabecalho">
		<figure id="imagem-topo">
			<a href="/cia-1.0/pages/principal.jsp"><img alt="Imagem Topo" src="../img/topo.png"></a>
		</figure>
		<div id="box-titulo">
			<div class="titulo-topo">CIA 1.0</div>
			<div class="subtitulo-topo">Coleta de Informações para Análise</div>
		</div>
		<nav id="menu-drop">
			<ul class="menu">
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="cadastroUsuarios.jsp">Usuários</a></li>
							<li><a class="link-item" href="cadastroCidadao.jsp">Cidadão</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroViaturas.jsp">Viatura</a></li>
							<li><a class="link-item" href="#">Facções</a></li>
						</ul>
				</li>
				<li><a href="#">Consultas</a>
					<ul>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroUsuarios.jsp">Usuários</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroCidadao.jsp">Cidadão</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroViaturas.jsp">Viatura</a></li>
						<li><a class="link-item" href="#">Facções</a></li>
					</ul>
				
				</li>
				<li><a href="#">Relatório</a></li>
				<li><a href="#">Controle</a></li>
				<li><a href="#">Configurações</a></li>
				<li><a href="login.jsp">Sair</a></li>
			
			</ul>
		</nav>
		
	</header>
	<aside id="box-left">
		<nav id="menu-nav-left">
			<ul>
	
				<li class="active"><a href="cadastroCidadao.jsp">Cadastro do Cidadão</a></li>
				<li><a href="cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorrência</a></li>
				<li><a href="#">Escalas de Serviços</a></li>
				<li><a href="#">Controle de Viaturas</a></li>
				<li><a href="#">Facções</a></li>
				<li><a href="#">Relatórios</a></li>
				<li><img alt="Link´s Úteis" src="../img/linksuteis.png"></li>
				<li><a href="http://apps4.sspds.ce.gov.br/consulta/index.do" target="_blank">SIP</a></li>
				<li><a href="https://erdsice2.prf.gov.br/spia/public/index.php">SPIA</a></li>
				<li><a href="http://sisbol.pm.ce.gov.br/login_bcg/">SISBOL - Boletim</a></li>
				<li class="active"><a href="http://sisdia.pm.ce.gov.br/sisdi_login/">Gerenciamento de Diárias</a></li>
			</ul>
		</nav>
	</aside>
	<div id="conteiner">

		<nav class="nav_tabs">
			<h3 class="titulo-cadastro">Cadastro de Viaturas</h3>
			<ul>
				<li><input type="radio" id="tab1" class="rd_tab" name="tabs" checked> 
				<label for="tab1" class="tab_label">Cadastro</label>
					<div class="tab-content">
						<br>
						<form action="Viaturas" method="post" class="form-cadViatura" name="formViatura">
							<div class="form-row">

								<div class="form-group col-md-2">
									<label for="codigo">Prefixo*</label> 
									<input type="text" class="form-control" id="codigo" aria-describedby="codigoHelp" ${leitura} placeholder="Ex: 22101" required="required" pattern="^\d{5}$" name="codigo" value="${viaturas.codigoViatura}">
								</div>
								
								<div class="form-group col-md-2">
									<label for="placa">Placa*</label> 
									<input type="text" class="form-control" id="placa" aria-describedby="placaHelp" placeholder="Ex: POG1234" required="required" pattern="[a-zA-Z]{3}[a-zA-Z0-9]{4}" name="placa" value="${viaturas.placaViatura}">
								</div>
								<div class="form-group col-md-8">
									<label for="marca">Marca/Modelo*</label> 
									<input type="text" class="form-control" id="marca" aria-describedby="marcaHelp" placeholder="Descreva a Marca e o Modelo" required="required" name="marca" value="${viaturas.marcaViatura}">
								</div>
							</div>
							<div class="form-row">
								
								<div class="form-group col-md-3">
									<label for="chassi">Chassi*</label>
									<input type="text" class="form-control" id="chassi" aria-describedby="chassioHelp" placeholder="Matricula do Usuário" required="required" name="chassi" value="${viaturas.chassiViatura}">
								</div>
								<div class="form-group col-md-2">
									<label for="cor">Cor*</label>
									<input type="text" class="form-control" id="cor" aria-describedby="corHelp" placeholder="Ex: Branco" required="required" name="cor" value="${viaturas.corViatura}">
								</div>
								<div class="form-group col-md-2">
									<label for="ano">Ano/Ano*</label>
									<input type="text" class="form-control" id="ano" aria-describedby="anoHelp" placeholder="Ex: 2010/2010" required="required" pattern="[0-9]{4}[/][0-9]{4}" name="ano" value="${viaturas.anoViatura}">
								</div>
							</div>
							
							<button type="submit" class="btn btn-primary" name="btnSalvar">Salvar</button>
							<button type="reset" class="btn btn-danger">Cancelar</button>
							<small><strong>Campos ( * ) são obrigatorios!!!</strong></small>
							${mensagem}
						</form>
					</div></li>
				<li><input type="radio" name="tabs" class="rd_tab" id="tab2" ${checagem}>
					<label for="tab2" class="tab_label">Consulta</label>
					<div class="tab-content">
						<br>
						<section class="tela-consulta">
							<article class="lado-esquerdo">
							<fieldset>
									<legend>Resultados da Consulta:</legend>
									<div class="table-overflow">
									<table class="table table-striped">
										<thead>
											<tr class="titulo-tabela">
												<td scope="col"><strong>Prefixo</strong></td>
												<td scope="col"><strong>Placa</strong></td>
												<td scope="col"><strong>Marca/Modelo</strong></td>
												<td scope="col"><strong>Chassi</strong></td>
												<td scope="col"><strong>Cor</strong></td>
												<td scope="col"><strong>Ano</strong></td>
												<td scope="col"><strong>Ação</strong></td>
											
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listaViaturas}" var="lista">
												<tr>
													<td scope="row"><c:out value="${lista.codigoViatura}"></c:out></td>
													<td><c:out value="${lista.placaViatura}"></c:out></td>
													<td><c:out value="${lista.marcaViatura}"></c:out></td>
													<td><c:out value="${lista.chassiViatura}"></c:out></td>
													<td><c:out value="${lista.corViatura}"></c:out></td>
													<td><c:out value="${lista.anoViatura}"></c:out></td>
													<td>
														<a href="Viaturas?btnAcao=editar&codigoVtr=${lista.codigoViatura}" class="btn btn-secondary btn-sm">Editar</a>
														<a href="Viaturas?btnAcao=remover&codigoVtr=${lista.codigoViatura}" onclick="return confirm('Confirmar Exclusão');" class="btn btn-danger btn-sm">Excluir</a>
														<a href="#" class="btn btn-info btn-sm">Visualizar</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</div>
							</fieldset>
								
							</article>
							<article class="lado-direito">
								<form action="Viaturas" method="get" class="form-ConsultaViatura" name="formConsultaViaturas">
									<fieldset>
									<legend>Entradas para Consulta:</legend>
										<div class="form-row">

											<div class="form-group col-md-12">
												<label for="prefixoConsulta">Prefixo</label> 
												<input type="number" class="form-control" id="prefixoConsulta" aria-describedby="prefixoConsultaHelp" placeholder="Ex:22111" name="prefixoConsulta">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="placaConsulta">Placa</label> 
												<input type="text" class="form-control" id="placaConsulta" aria-describedby="placaConsultaHelp" placeholder="Ex:POG1234" name="placaConsulta">
											</div>
											<div class="form-group col-md-12">
												<label for="marcaConsulta">Marca/Modelo</label> 
												<input type="text" class="form-control" id="marcaConsulta" aria-describedby="marcaConsultaHelp" placeholder="Consulte Tambem pela Marca" name="marcaConsulta">
											</div>

										</div>

										<button type="submit" class="btn btn-primary" name="btnAcao" value="consultar">Consultar</button>
										<button type="reset" class="btn btn-secondary">Limpar</button>
									</fieldset>
								</form>
							</article>

						</section>
					</div></li>

			</ul>
		</nav>
	</div>
	<footer id="rodape">
		<span></span>
		<nav>
			<ul>
				<li>Copyright © | 2018 | #Cobax Tecnologia - Todos os Direitos
					Reservados</li>
				<li><a href="https://www.instagram.com/willamygarcia/"
					target="_blank">Sobre o autor</a></li>
				<li><a
					href="mailto:willamy.t.i@gmail.com?Subject=Suporte%20CIA1.0"
					target="_top">Suporte: willamy.t.i@gmail.com</a></li>
			</ul>
		</nav>
	</footer>
<script type="text/javascript">
//TRATAMENTOS INICIAIS
	
	

</script>
</body>
</html>