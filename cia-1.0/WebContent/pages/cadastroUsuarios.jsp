
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../ico/principal.ico" type="image/x-icon">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="../css/estilo-principal.css" type="text/css">
<script type="text/javascript">
	
	function validarSenha(form){ 
	    senha = document.formUsuario.senha.value
	    senhaRepetida = document.formUsuario.confirmacaoSenha.value
	    if (senha != senhaRepetida){
	    	document.formUsuario.confirmacaoSenha.style.border='solid 1px #FF6347';
	    	alert("Confirmação de Senha incoreta!!!");
	        document.formUsuario.confirmacaoSenha.value=("");  
	        document.formUsuario.confirmacaoSenha.focus();
	  
	        return false;
	    }
	}
		
	function validaCorRetorna(){
		document.formUsuario.confirmacaoSenha.style.border='solid 1px #DCDCDC';	
	}
	
    
</script>
<title>CIA 1.0</title>
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
		<nav id="menu-drop">/cia-1.0/pages/
			<ul class="menu">
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="cadastroUsuarios.jsp">Usuários</a></li>
							<li><a class="link-item" href="cadastroCidadao.jsp">Cidadão</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
							<li><a class="link-item" href="#">Viatura</a></li>
							<li><a class="link-item" href="#">Facções</a></li>
						</ul>
				</li>
				<li><a href="#">Consultas</a>
					<ul>
						<li><a class="link-item" href="cadastroUsuarios.jsp">Usuários</a></li>
						<li><a class="link-item" href="cadastroCidadao.jsp">Cidadão</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
						<li><a class="link-item" href="#">Viatura</a></li>
						<li><a class="link-item" href="#">Facções</a></li>
					</ul>
				
				</li>
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
	
				<li class="active"><a href="cadastroCidadao.jsp">Cadastro do Cidadão</a></li>
				<li><a href="cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorência</a></li>
				<li><a href="#">Escalas de Serviços</a></li>
				<li class="last"><a href="#">Controle de Viaturas</a></li>
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
			<h3 class="titulo-cadastro">Cadastro de Usuários</h3>
			<ul>
				<li><input type="radio" id="tab1" class="rd_tab" name="tabs" checked> 
				<label for="tab1" class="tab_label">Cadastro</label>
					<div class="tab-content">
						<br>
						<form action="CadastrarUsuario" method="post" class="form-cadUsusario" name="formUsuario" onsubmit="return validarSenha(this)">
						<h3>${alerta}</h3>
							<div class="form-row">

								<div class="form-group col-md-1">
									<label for="codigo">Codigo</label> 
									<input type="text" class="form-control" id="codigo" aria-describedby="codigoHelp" placeholder="Automático" readonly="readonly" name="codigo" value="${usuarioPorCodigo.codigoUsuarios}">
								</div>
							</div>
							<div class="form-row">
								
								<div class="form-group col-md-3">
									<label for="matriculaUsuario">Matricula Usuário</label>
									<input type="text" class="form-control" id="matriculaUsuario" aria-describedby="matriculaUsuarioHelp" placeholder="Matricula do Usuário" required="required" autofocus="autofocus"  name="mtUsuario" value="${usuarioPorCodigo.nomeUsuarios}">
								</div>
								<div class="form-group col-md-5">
									<label for="nomeUsuario">Nome Usuário</label>
									<input type="text" class="form-control" id="nomeUsuario" aria-describedby="nomeUsuarioHelp" placeholder="NomeCompleto" required="required" name="nomeUsuario" value="${usuarioPorCodigo.nomeCompletoUsuarios}">
								</div>
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-2">
									<label for="nivel">Nível de 1 - 3</label> 
									<input type="range" min="1" max="3" step="1" class="form-control" id="nivel" aria-describedby="nivelHelp" placeholder="1-3" name="nivel" value="${usuarioPorCodigo.nivelUsuarios}">
								</div>
							
								<div class="form-group col-md-3">
									<label for="senha">Senha</label> 
									<input type="password" maxlength="8" class="form-control" id="senha" aria-describedby="senhaHelp" placeholder="Senha" required="required" name="senha" value="${usuarioPorCodigo.senha}">
								</div>
								<div class="form-group col-md-3">
									<label for="csenha">Confirmação de Senha</label> 
									<input type="password" maxlength="8" class="form-control" id="confirmacaoSenha" aria-describedby="confirmacaoSenhaHelp" placeholder="Confirmar Senha" required="required" name="confirmacaoSenha" oninput="validaCorRetorna()" value="${usuarioPorCodigo.senha}">
								</div>

							</div>

							
							
							<button type="submit" class="btn btn-primary" name="btnSalvar">Salvar</button>
							<button type="reset" class="btn btn-primary">Cancelar</button>
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
												<td scope="col"><strong>Codigo</strong></td>
												<td scope="col"><strong>Usuario</strong></td>
												<td scope="col"><strong>Nome Completo do Usuario</strong></td>
												<td scope="col"><strong>Nivel</strong></td>
												<td scope="col"><strong>Ação</strong></td>
											
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${consultaTotal}" var="lista">
												<tr>
													<td scope="row"><c:out value="${lista.codigoUsuarios}"></c:out></td>
													<td><c:out value="${lista.nomeUsuarios}"></c:out></td>
													<td><c:out value="${lista.nomeCompletoUsuarios}"></c:out></td>
													<td><c:out value="${lista.nivelUsuarios}"></c:out></td>
													<td>
														<a href="UsuariosDel_Edit_Servlet?acao=editar&codigoUsuarios=${lista.codigoUsuarios}" class="btn btn-secondary btn-sm">Editar</a>
														<a href="UsuariosDel_Edit_Servlet?acao=del&codigoUsuarios=${lista.codigoUsuarios}" class="btn btn-danger btn-sm">Excluir</a>
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
								<form action="CadastrarUsuario" method="get" class="form-ConsulaUsusario" name="formConsultaUsuario">
									<fieldset>
									<legend>Entradas para Consulta:</legend>
										<div class="form-row">

											<div class="form-group col-md-12">
												<label for="codigo">Codigo</label> 
												<input type="number" class="form-control" id="codigo" aria-describedby="codigoHelp" placeholder="Codigo" name="codigoConsulta">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="matriculaUsuario">Matricula Usuário</label> 
												<input type="text" class="form-control" id="matriculaUsuario" aria-describedby="matriculaUsuarioHelp" placeholder="Matricula do Usuário" name="mtUsuarioConsulta">
											</div>
											<div class="form-group col-md-12">
												<label for="nivel">Nível de 1 - 3</label> 
												<input type="number" class="form-control" id="nivel" aria-describedby="nivelHelp" placeholder="De 1 a 3" name="nivelConsulta">
											</div>

										</div>

										<button type="submit" class="btn btn-primary">Consultar</button>
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
</body>
</html>