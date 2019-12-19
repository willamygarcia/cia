<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<c:set var="context" value="${pageContext.request.contextPath}" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" >
		<meta charset="utf-8">
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${context}/css/estilo-principal.css" type="text/css">
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery.maskedinput.min.js"></script>
		<script type="text/javascript" src="${context}/javascript/jsAjax.js"></script>
	
		
		<title>CIA 1.0 - Cadastro de Ocorr�ncia</title>
	</head>
<body onload="carregaFormulario()">
	<header id="cabecalho">
		<figure id="imagem-topo">
			<a href="/cia-1.0/pages/principal.jsp"><img alt="Imagem Topo" src="${context}/img/topo.png"></a>
		</figure>
		<div id="box-titulo">
			<div class="titulo-topo">CIA 1.0</div>
			<div class="subtitulo-topo">Coleta de Informa��es para An�lise</div>
		</div>
		<nav id="menu-drop">
			<ul class="menu">
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroUsuarios.jsp">Usu�rios</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroCidadao.jsp">Cidad�o</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorr�ncia</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroViaturas.jsp">Viatura</a></li>
							<li><a class="link-item" href="#">Fac��es</a></li>
						</ul>
				</li>
				<li><a href="#">Consultas</a>
					<ul>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroUsuarios.jsp">Usu�rios</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroCidadao.jsp">Cidad�o</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorr�ncia</a></li>
						<li><a class="link-item" href="/cia-1.0/pages/cadastroViaturas.jsp">Viatura</a></li>
						<li><a class="link-item" href="#">Fac��es</a></li>
					</ul>
				
				</li>
				<li><a href="#">Relat�rios</a></li>
				<li><a href="#">Controle</a></li>
				<li><a href="#">Configura��es</a></li>
				<li><a href="login.jsp">Sair</a></li>
			
			</ul>
		</nav>
	</header>
	<aside id="box-left">
		<nav id="menu-nav-left">
			<ul>
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do	Cidad�o</a></li>
				<li><a href="/cia-1.0/pages/cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorr�ncia</a></li>
				<li><a href="#">Escalas de Servi�os</a></li>
				<li><a href="/cia-1.0/pages/controleViaturas.jsp">Controle de Viaturas</a></li>
				<li><a href="#">Fac��es</a></li>
				<li><a href="#">Relat�rios</a></li>
				<li><img alt="Link�s �teis" src="${context}/img/linksuteis.png"></li>
				<li><a href="http://apps4.sspds.ce.gov.br/consulta/index.do" target="_blank">SIP</a></li>
				<li><a href="https://erdsice2.prf.gov.br/spia/public/index.php" target="_blank">SPIA</a></li>
				<li><a href="http://sisbol.pm.ce.gov.br/login_bcg/" target="_blank">SISBOL - Boletim</a></li>
				<li><a href="http://sisdia.pm.ce.gov.br/sisdi_login/" target="_blank">Gerenciamento de Di�rias</a></li>
			</ul>
		</nav>
	</aside>
	<div id="conteiner">
		<nav class="nav_tabs">
			<h3 class="titulo-cadastro">Cadastro de Ocorr�ncia</h3>
				<form action="Ocorrencia" method="post" id="frm-cadOcorrencia" name="frm-cadOcorrencia" enctype="multipart/form-data">
					<ul>
						<li>
							<input type="radio" id="tab1" class="rd_tab" name="tabs" checked>
							<label for="tab1" class="tab_label">Geral</label>
								<div class="tab-content">
									<br>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="codigoOcorrencia">Codigo</label>
											<input type="text" class="form-control" id="codigoOcorrencia" name="codigoOcorrencia" placeholder="Automatico" readonly="readonly" value="${ocorrencia.codigoOcorrencia}">
										</div>
										<div class="form-group col-md-2">
											<label for="mikeOcorrencia">Mike da Ocorr�ncia</label>
											<input type="text" class="form-control" id="mikeOcorrencia" name="mikeOcorrencia" placeholder="Mike" value="${ocorrencia.mikeOcorrencia}">
										</div>
										<div class="form-group col-md-2">
											<label for="inqueritoOcorrencia">Inquerio</label>
											<input type="text" class="form-control" id="inqueritoOcorrencia" name="inqueritoOcorrencia" placeholder="Inquerito" value="${ocorrencia.inqueritoOcorrencia}">
										</div>
										<div class="form-group col-md-2">
											<label for="boOcorrencia">Boletim de Ocorr�ncia</label>
											<input type="text" class="form-control" id="boOcorrencia" name="boOcorrencia" placeholder="Boletim de Ocorr�ncia" value="${ocorrencia.boOcorrencia}">
										</div>
										<div class="form-group col-md-4">
											<label for="outrosOcorrencia">Outros</label>
											<input type="text" class="form-control" id="outrosOcorrencia" name="outrosOcorrencia" placeholder="Outros" value="${ocorrencia.outrosOcorrencia}">
										</div>
									</div>	
									<div class="form-row">	
										<h4>Noticiante</h4>
									</div>
									<hr>	
									<div class="form-row">	
										<div class="form-group col-md-2">
											<label for="graduacaoPostoOcorrencia">Gradua��o/Posto</label>
											<select id="graduacaoPostoOcorrencia" name="graduacaoPostoOcorrencia" class="form-control">
												
												<c:if test="${ocorrencia.graduacaoOcorrencia == ''}"><option value="">Selecionar</option></c:if>
												<c:if test="${ocorrencia.graduacaoOcorrencia != ''}">${ocorrencia.graduacaoOcorrencia}</c:if>										
												<option>Soldado</option>
												<option>Cabo</option>
												<option>3� Sargento</option>
												<option>2� Sargento</option>
												<option>1� Sargento</option>
												<option>Sub-Tenente</option>
												<option>2� Tenente</option>
												<option>1� Tenente</option>
												<option>Capit�o</option>
												<option>Major</option>
												<option>Tenente-Coronel</option>
												<option>Coronel</option>
											
											</select>
										</div>
										<div class="form-group col-md-1">
											<label for="numeralOcorrencia">Numeral</label>
											<input type="text" class="form-control" id="numeralOcorrencia" name="numeralOcorrencia" placeholder="Numeral" value="${ocorrencia.numeralOcorrencia}">
										</div>
										<div class="form-group col-md-2">
											<label for="matriculaOcorrencia">Matricula</label>
											<input type="text" class="form-control" id="matriculaOcorrencia" name="matriculaOcorrencia" value="${ocorrencia.matriculaOcorrencia}">
										</div>
										<div class="form-group col-md-4">
											<label for="nomeGuerraOcorrencia">Nome de Guerra</label>
											<input type="text" class="form-control" id="nomeGuerraOcorrencia" name="nomeGuerraOcorrencia" placeholder="Nome de Guerra" value="${ocorrencia.nomeGuerraOcorrencia}" >
										</div>
										<div class="form-group col-md-2">
											<label for="iniciarCadastro"> Clique para Iniciar o Cadastro</label>
											<button type="button" class="btn btn-dark" id="iniciarCadastro" name="iniciarCadastro" onclick="iniciarOcorrencia()">Iniciar Cadastro</button>
										</div>
									</div>
									<div class="form-row">	
										<h4>Guarni��o</h4>
									</div>
									<hr>	
									<div class="form-row">	
										<div class="form-group col-md-2">
											<label for="add">Clique para Adicionar os Militares</label><br>
											<button type="button" id="addMilitares" class="btn btn-dark" onclick="showModal()">Adicionar</button>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-12">
											<fieldset>
												<legend>Todos os Militares Envolvidos</legend>
													<div class="table-overflow">
													<table class="table table-striped" id="tabela-militares-envolvidos">
														<thead>
															<tr>
																<td scope="col"><strong>Codigo Envolvido</strong></td>
																<td scope="col"><strong>Codigo Ocorrencia</strong></td>
																<td scope="col"><strong>Gradua��o/Posto</strong></td>
																<td scope="col"><strong>Numeral</strong></td>
																<td scope="col"><strong>Matricula</strong></td>
																<td scope="col"><strong>Nome</strong></td>
																<td scope="col"><strong>Informa��es</strong></td>
																<td scope="col"><strong>A��o</strong></td>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${envolvidos}" var="listaEnvolvidos">
																<tr>
																	<td scope="row"><c:out value="${listaEnvolvidos.codigoEnvolvidoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.codigoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.graduacaoEnvolvidoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.numeralEnvolvidoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.nomeGuerraEnvolvidoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.matriculaEnvolvidoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaEnvolvidos.informacoesEnvolvidoOcorrencia}"></c:out></td>
																	<td><a onclick="removerMilitarEnvolvido(${listaEnvolvidos.codigoEnvolvidoOcorrencia});" class="btn btn-danger btn-sm">Remover</a>
																	</td>
					
																</tr>
					
															</c:forEach>
														</tbody>
													</table>
												</div>
											</fieldset>
										</div>
									</div>
								</div>
						</li>
						<li>
							<input type="radio" id="tab2" class="rd_tab" name="tabs">
							<label for="tab2" class="tab_label">Ocorr�ncia</label>
							<div class="tab-content">
								<br>
								<div class="form-row">
									<div class="form-group col-md-2">
										<label for="dataHoraOcorrencia">Data/Hora da Ocorr�cia</label><!-- ${ocorrencia.dataHoraOcorrencia} -->
										<input type="datetime-local" class="form-control" id="dataHoraOcorrencia" name="dataHoraOcorrencia" value="${dataHoraFormato}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraInicioComunicacao">Data/Hora Inicio da Comunica��o</label>
										<input type="datetime-local" class="form-control" id="dataHoraInicioComunicacao" name="dataHoraInicioComunicacao" value="${ocorrencia.dataHoraInicioComunicacao}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraFimComunicacao">Data/Hora Fim da Comunica��o</label>
										<input type="datetime-local" class="form-control" id="dataHoraFimComunicacao" name="dataHoraFimComunicacao" value="${ocorrencia.dataHoraFimComunicacao}">
									</div>
									<div class="form-group col-md-2">
										<label for="delegaciaOcorrencia">Delegacia</label>
										<select id="delegaciaOcorrencia" name="delegaciaOcorrencia" class="form-control">
											
											<c:if test="${ocorrencia.delegaciaOcorrencia == ''}"><option value="">Selecionar Delegacia</option></c:if>
											<c:if test="${ocorrencia.delegaciaOcorrencia != ''}">${ocorrencia.delegaciaOcorrencia}</c:if>
											<option>1� Distrito Policial</option>
											<option>2� Distrito Policial</option>
											<option>3� Distrito Policial</option>
											<option>4� Distrito Policial</option>
											<option>5� Distrito Policial</option>
											<option>6� Distrito Policial</option>
											<option>7� Distrito Policial</option>
											<option>8� Distrito Policial</option>
											<option>9� Distrito Policial</option>
											<option>10� Distrito Policial</option>
											<option>11� Distrito Policial</option>
											<option>12� Distrito Policial</option>
											<option>13� Distrito Policial</option>
											<option>14� Distrito Policial</option>
											<option>15� Distrito Policial</option>
											<option>16� Distrito Policial</option>
											<option>17� Distrito Policial</option>
											<option>18� Distrito Policial</option>
											<option>19� Distrito Policial</option>
											<option>20� Distrito Policial</option>
											<option>21� Distrito Policial</option>
											<option>22� Distrito Policial</option>
											<option>23� Distrito Policial</option>
											<option>24� Distrito Policial</option>
											<option>25� Distrito Policial</option>
											<option>26� Distrito Policial</option>
											<option>27� Distrito Policial</option>
											<option>28� Distrito Policial</option>
											<option>29� Distrito Policial</option>
											<option>30� Distrito Policial</option>
											<option>31� Distrito Policial</option>
											<option>32� Distrito Policial</option>
											<option>33� Distrito Policial</option>
											<option>34� Distrito Policial</option>
											
										</select>
									</div>
									<div class="form-group col-md-4">
										<label for="tipoOcorrencia">Tipo de Ocorr�ncia</label>
										<select id="tipoOcorrencia" name="tipoOcorrencia" class="form-control">
											<c:if test="${ocorrencia.tipoOcorrencia == ''}"><option value="">Selecionar</option></c:if>
											<c:if test="${ocorrencia.tipoOcorrencia != ''}">${ocorrencia.tipoOcorrencia}</c:if>
											<option>Flagrante</option>
											<option>Auto de Apresenta��o</option>
											<option>TCO</option>
											<option>BO</option>
											<option>Comunica��o de Fato</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="enderecoOcorrencia">Endere�o da Ocorr�ncia</label>
										<input type="text" class="form-control" id="enderecoOcorrencia" name="enderecoOcorrencia" placeholder="Endere�o da Ocorr�ncia" value="${ocorrencia.enderecoOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="bairroOcorrencia">Bairro</label>
										<input type="text"	class="form-control" id="bairroOcorrencia" name="bairroOcorrencia" placeholder="Bairro da Ocorrencia" value="${ocorrencia.bairroOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="cidadeOcorrencia ">Cidade</label>
										<input type="text" class="form-control" id="cidadeOcorrencia" name="cidadeOcorrencia" placeholder="Cidade da Ocorrencia" value="${ocorrencia.cidadeOcorrencia}">
									</div>
									<div class="form-group col-md-4">
										<label for="referenciaOcorrencia">Ponto de Referencia</label>
										<input type="text" class="form-control" id="referenciaOcorrencia" name="referenciaOcorrencia" placeholder="Informe um Ponto de Referencia" value="${cidadao.referenciaOcorrencia}">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="delegadoOcorrencia">Delegado</label>
										<input type="text" class="form-control" id="delegadoOcorrencia" name="delegadoOcorrencia" maxlength="10" placeholder="Informe Nome do(a) Delegado(a)" value="${ocorrencia.delegadoOcorrencia}">
									</div>
									<div class="form-group col-md-4">
										<label for="escrivaoOcorrencia">Escriv�o</label>
										<input type="text" class="form-control" id="escrivaoOcorrencia" name="escrivaoOcorrencia" maxlength="10" placeholder="Informe Nome do(a) Escriv�(o)" value="${ocorrencia.escrivaoOcorrencia}">
									</div>
									<div class="form-group col-md-4">
										<label for="autoridadeMilitar">Autoridade Militar</label>
										<input type="text" class="form-control" id="autoridadeMilitar" name="autoridadeMilitar" maxlength="10" placeholder="Informe a Autoridade Militar" value="${ocorrencia.autoridadeMilitarOcorrencia}">
									</div>
								
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="ordenamentoJuridico">Ordenamendo Juridico</label>
										<select id="ordenamentoJuridico" name="ordenamentoJuridico" class="form-control">
											<option value="">Selecionar</option>
											<option>C�digo Civil Brasileiro</option>
											<option>Constitui��o Federal</option>
											<option>C�digo de Processo Civil</option>
											<option>C�digo Penal</option>
											<option>C�digo de Processo Penal</option>
											<option>C�digo Penal Militar</option>
											<option>C�digo Processual Penal MIlitar</option>
											<option>C�digo de Defesa do Consumidor</option>
											<option>C�digo de Defesa do Consumidor</option>
											<option>C�digo de Defesa do Consumidor</option>
											<option>ECA (Estatuto da Crian�a e do Adolescente)</option>
										</select>
									</div>
									<div class="form-group col-md-2">
										<label for="artigoOcorrencia">Artigo</label>
										<input type="number" class="form-control" id="artigoOcorrencia" name="artigoOcorrencia"placeholder="Informe o Artigo">
									</div>
									<div class="form-group col-md-2">
										<label for="alineaOcorriencia">Paragrafo/Inciso/Al�nea</label>
										<input type="text" class="form-control" id="alineaOcorriencia" name="alineaOcorriencia" maxlength="10"placeholder="Informe a Al�nea">
									</div>
									<div class="form-group col-md-2">
										<label for="adicionarProcesso">Clique para Adicionar os Artigos</label><br>
										<button type="button" class="btn btn-dark" id="adicionarProcesso" onclick="adicionarArtigo()">Adicionar</button>
									</div>
								</div>
								<div class="form-row">
										<div class="form-group col-md-12">
											<fieldset>
												<legend>Informa��es Criminais</legend>
												<div class="table-overflow">
													<table class="table table-striped" id="tabela-informacoes-criminais">
														<thead>
															<tr>
																<td scope="col"><strong>Codigo Ordenamento</strong></td>
																<td scope="col"><strong>Codigo Ocorrencia</strong></td>
																<td scope="col"><strong>Ordenamento Juridico</strong></td>
																<td scope="col"><strong>Artigo</strong></td>
																<td scope="col"><strong>Paragrafo/Incisio/Al�nea</strong></td>
																<td scope="col"><strong>A��o</strong></td>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${processos}" var="listaProcessos">
																<tr>
																	<td scope="row"><c:out value="${listaProcessos.codigoOrdenamentoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaProcessos.codigoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaProcessos.leiOrdenamentoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaProcessos.artigoOrdenamentoOcorrencia}"></c:out></td>
																	<td><c:out value="${listaProcessos.paragrafoOrdenamentoOcorrencia}"></c:out></td>
																	<td><a onclick="removerOrdenamento(${listaProcessos.codigoOrdenamentoOcorrencia});" class="btn btn-danger btn-sm">Remover</a>
																	</td>
					
																</tr>
					
															</c:forEach>
														</tbody>
													</table>
												</div>
											</fieldset>
										</div>
									</div>
								</div>
						</li>
						<li>
							<input type="radio" id="tab3" class="rd_tab" name="tabs">
							<label for="tab3" class="tab_label">Materiais</label>
	
							<div class="tab-content">
									<br>
									<h4>Armas / Entorpecentes / Veiculos / Documentos</h4>
									<div class="form-row">
										<div class="form-group col-md-1">
											<label for="quantidadeArma">QUANTIDADE</label><br>
											<label id="quantidadeArma" onclick="showModalArmasView();" style="cursor: pointer; font-weight: bold; width: 100px; height: 38px;"  class="btn btn-info btn-sm">${quantidadeArmas}</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarArma">Adicionar Armas</label><br>
											<button type="button" id="adicionarArma" class="btn btn-dark" onclick="showModalArmas()">Adicionar</button>
										</div>
										<div class="form-group col-md-1">
											<label for="quantidadeEntorpecentes">QUANTIDADE</label><br>
											<label id="quantidadeEntorpecentes" onclick="showModalEntorpecentesView()" style="cursor: pointer; font-weight: bold; width: 100px; height: 38px;"  class="btn btn-info btn-sm">${quantidadeEntorpecentes}</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarEntorpecentes">Adicionar Entorpecentes</label><br>
											<button type="button" id="adicionarEntorpecentes" class="btn btn-dark" onclick="showModalEntorpecentes()">Adicionar</button>
										</div>
										<div class="form-group col-md-1">
											<label for="quantidadeVeiculos">QUANTIDADE</label><br>
											<label id="quantidadeVeiculos" onclick="showModalVeiculosView();" style="cursor: pointer; font-weight: bold; width: 100px; height: 38px;"  class="btn btn-info btn-sm">${quantidadeVeiculos}</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarVeiculos">Adicionar Veiculos</label><br>
											<button type="button" id="adicionarVeiculos" class="btn btn-dark" onclick="showModalVeiculos()">Adicionar</button>
										</div>
										<div class="form-group col-md-1">
											<label for="quantidadeDocumentos">QUANTIDADE</label><br>
											<label id="quantidadeDocumentos" onclick="showModalDocumentosView();" style="cursor: pointer; font-weight: bold; width: 100px; height: 38px;"  class="btn btn-info btn-sm">${quantidadeDocumentos}</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarDocumentos">Adicionar Documentos</label><br>
											<button type="button" id="adicionarDocumentos" class="btn btn-dark" onclick="showModalDocumentos()">Adicionar</button>
										</div>
									</div>
									<br>
									<h4>Informa��es/Observa��es Complementares</h4>
									<br>
									<div class="form-group col-md-12">
										<textarea class="form-control" cols=60 id="informcoesMateriais" name="informcoesMateriais" rows="5" maxlength="500" wrap="hard" placeholder="Informa��es Complementares"></textarea>
									</div>
						
						
							</div>
						</li>
						<li>
							<input type="radio" id="tab4" class="rd_tab" name="tabs" >
							<label for="tab4" class="tab_label">Fotos</label>
	
							<div class="tab-content">
								<figure class="fotos-cidadao">
									<div class="container-foto">
										<label for="fotoDiversas01">Adicionar Fotos Diversas</label> 
										<input type="file" id="fotoDiversas01" name="fotoDiversas01" accept="image/jpeg, image/jpg" value="${ocorrencia.fotosDiversasOcorrencia01}">
	
										<div class="fotos">
											<img alt="fotoDiversas1" id="fotoDiversas1" src="<c:if test='${ocorrencia.fotosDiversasOcorrencia01 == null}'> ../img/camera-p.png  </c:if>
																						     <c:if test='${ocorrencia.fotosDiversasOcorrencia01 != null}'> ${ocorrencia.fotosDiversasOcorrencia01} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas02">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas02" name="fotoDiversas02" accept="image/jpeg,image/jpg" value="${ocorrencia.fotosDiversasOcorrencia02}">
	
										<div class="fotos">
											<img alt="fotoDiversas2" id="fotoDiversas2" name="fotoDiversas2" src="<c:if test='${ocorrencia.fotosDiversasOcorrencia02 == null}'> ../img/camera-p.png  </c:if>
																						 			   <c:if test='${ocorrencia.fotosDiversasOcorrencia02 != null}'> ${ocorrencia.fotosDiversasOcorrencia02} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas03">Adicionar Foto Diversas</label>
										<input type="file" id="fotoDiversas03" name="fotoDiversas03" accept="image/jpeg,image/jpg" value="${ocorrencia.fotosDiversasOcorrencia03}">
		
										<div class="fotos">
											<img alt="fotoDiversas3" id="fotoDiversas3" name="fotoDiversas3" src="<c:if test='${ocorrencia.fotosDiversasOcorrencia03 == null}'> ../img/camera-p.png  </c:if>
																						 			  	     <c:if test='${ocorrencia.fotosDiversasOcorrencia03 != null}'> ${ocorrencia.fotosDiversasOcorrencia03} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas04">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas04" name="fotoDiversas04" accept="image/jpeg,image/jpg" value="${ocorrencia.fotosDiversasOcorrencia04}">
	
										<div class="fotos">
											<img alt="fotoDiversas4" id="fotoDiversas4" name="fotoDiversas4" src="<c:if test='${ocorrencia.fotosDiversasOcorrencia04 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${ocorrencia.fotosDiversasOcorrencia04 != null}'> ${ocorrencia.fotosDiversasOcorrencia04} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas05">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas05" name="fotoDiversas05" accept="image/jpeg,.jpg" value="${ocorrencia.fotosDiversasOcorrencia05}">
	
										<div class="fotos">
											<img alt="fotoDiversas5" id="fotoDiversas5" name="fotoDiversas5" src="<c:if test='${ocorrencia.fotosDiversasOcorrencia05 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${ocorrencia.fotosDiversasOcorrencia05 != null}'> ${ocorrencia.fotosDiversasOcorrencia05} </c:if>">
										</div>
									</div>
								</figure>
							</div>
						</li>
						<li>
							<input type="radio" id="tab5" class="rd_tab" name="tabs">
							<label for="tab5" class="tab_label">Historico</label>
							<div class="tab-content">
								<br>
								<div class="form-group">
									<fieldset>
										<legend>Historico</legend>
										<label for="historicoOcorrencia"></label> Informe com detalhes um breve historico sobre a ocorr�ncia: 
										<br>
										<textarea class="form-control" cols=60 id="historicoOcorrencia" name="historicoOcorrencia" rows="15" maxlength="500" wrap="hard" placeholder="envolvidos, data, hora, endere�o, mike da ocorr�ncia, artigos...">${ocorrencia.historicoOcorrencia}</textarea>
									</fieldset>
	
								</div>
								<button type="button" id="btnSalvar" name="btnSalvar" class="btn btn-primary btn-lg" onclick="acaoBotaoOcorrencia('alterar')">Salvar</button>
							
							</div>
						</li>
						
						<li>
							<input type="radio" id="tab7" class="rd_tab" name="tabs" ${checado}>
							<label for="tab7" class="tab_label">Consulta</label>
							<div class="tab-content">
								<br>
								<section class="tela-consulta">
									<article class="lado-esquerdo">
										<fieldset>
											<legend>Resultados da Consulta:</legend>
											<div class="table-overflow">
												<table class="table table-striped">
													<thead>
														<tr>
															<td scope="col"><strong>Codigo</strong></td>
															<td scope="col"><strong>Mike</strong></td>
															<td scope="col"><strong>Noticiante</strong></td>
															<td scope="col"><strong>Bairro</strong></td>
															<td scope="col"><strong>Data</strong></td>
															<td scope="col"><strong>A��o</strong></td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${consultaTotal}" var="lista">
															<tr>
																<td scope="row"><c:out value="${lista.codigoOcorrencia}"></c:out></td>
																<td><c:out value="${lista.mikeOcorrencia}"></c:out></td>
																<td><c:out value="${lista.nomeGuerraOcorrencia}"></c:out></td>
																<td><c:out value="${lista.bairroOcorrencia}"></c:out></td>
																<fmt:parseDate value="${lista.dataHoraOcorrencia}" pattern="yyyy-MM-dd HH:mm:ss" var="myDate"/>
																<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${myDate}"/></td>
																<td><a href="Ocorrencia?acao=editar&codigo=${lista.codigoOcorrencia}" class="btn btn-secondary btn-sm">Editar</a>
																	<a href="Ocorrencia?acao=excluir&codigo=${lista.codigoOcorrencia}" onclick="return confirm('Confirmar Exclus�o');" class="btn btn-danger btn-sm">Excluir</a>
																	<a href="Ocorrencia?acao=visualizar&codigo=${lista.codigoOcorrencia}"  target="_blank" class="btn btn-info btn-sm">Visualizar</a>
																</td>
		
															</tr>
		
														</c:forEach>
													</tbody>
												</table>
											</div>
										</fieldset>
	
									</article>
									<article class="lado-direito">
											<fieldset>
												<legend>Entradas para Consulta:</legend>
												<div class="form-row">
													<div class="form-group col-md-12">
														<label for="mikeConsulta">Mike:</label>
														<input type="text" class="form-control" id="mikeConsulta" aria-describedby="mikeConsultaHelp" placeholder="Ex.:M20201231232" name="mikeConsulta">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-12">
														<label for="noticianteOcorrenciaConsulta">Noticiante:</label>
														<input type="text" class="form-control" id="noticianteOcorrenciaConsulta" aria-describedby="noticianteOcorrenciaConsultaHelp" placeholder="Informe Noticiante" name="noticianteOcorrenciaConsulta">
													</div>
												</div>	
												<div class="form-row">
													<div class="form-group col-md-12">
														<label for="bairroConsulta">Bairro:</label> 
														<input type="text" class="form-control" id="bairroConsulta" aria-describedby="bairroConsultaHelp"
															placeholder="Rua,Logradouro,Travessa,Numero"
															name="bairroConsulta">
													</div>
													<div class="form-group col-md-12">
														<label for="dataOcorrenciaConsulta">Data da Ocorrencia:</label> <input
															type="date" class="form-control" id="dataOcorrenciaConsulta" aria-describedby="dataOcorrenciaConsultaHelp" placeholder="Informe a data da Ocorrencia" name="dataOcorrenciaConsulta">
													</div>
	
	
												</div>
	
												<button type="button" id="btnConsultar" name="btnConsultar" class="btn btn-primary btn-sm" onclick="acaoBotaoOcorrencia('consultar')">Consultar</button>
												<button type="button" id="btnLimpar" name="btnLimpar" class="btn btn-secondary btn-sm" onclick="acaoBotaoOcorrencia('limpar')">Limpar</button>
																						
											</fieldset>
									
									</article>
	
								</section>
							</div>
						</li>
				</ul>
			</form>	
		</nav>
	</div>
	<footer id="rodape">
		<span></span>
		<nav>
			<ul>
				<li>Copyright � | 2018 | #Cobax Tecnologia - Todos os Direitos
					Reservados</li>
				<li><a href="https://www.instagram.com/willamygarcia/"
					target="_blank">Sobre o autor</a></li>
				<li><a
					href="mailto:willamy.t.i@gmail.com?Subject=Suporte%20CIA1.0"
					target="_top">Suporte: willamy.t.i@gmail.com</a></li>
			</ul>
		</nav>
	</footer>
	
<!-- TELA MODAL CADASTRO DE ENVOLVIDO-->	
<!-- Modal -->
<div id="modal-content">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Envolvidos</label>
			<button type="button" onclick="hiddenModal()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="codigoEnvOcorrencia">Codigo:</label>
					<input type="text" class="form-control" id="codigoEnvOcorrencia" name="codigoEnvOcorrencia" placeholder="Automatico" readonly="readonly">
				</div>
			</div>
			<div class="form-row">
					<div class="form-group col-md-3">
						<label for="graduacaoPostoGuanicaoEnvOcorrencia">Gradua��o/Posto:</label> 
						<select class="form-control" id="graduacaoPostoGuanicaoEnvOcorrencia" name="graduacaoPostoGuanicaoEnvOcorrencia">

							<option value="">Selecionar</option>
							<option>Soldado</option>
							<option>Cabo</option>
							<option>3� Sargento</option>
							<option>2� Sargento</option>
							<option>1� Sargento</option>
							<option>Sub-Tenente</option>
							<option>2� Tenente</option>
							<option>1� Tenente</option>
							<option>Capit�o</option>
							<option>Major</option>
							<option>Tenente-Coronel</option>
							<option>Coronel</option>

						</select>
					</div>
					<div class="form-group col-md-2">
						<label for="numeralEnvOcorrencia">Numeral:</label>
						<input type="text" class="form-control" id="numeralEnvOcorrencia" name="numeralEnvOcorrencia" placeholder="Ex.:30419">
					</div>
					<div class="form-group col-md-3">
						<label for="matriculaEnvOcorrencia">Matricula:</label>
						<input type="text" class="form-control" id="matriculaEnvOcorrencia" name="matriculaEnvOcorrencia" placeholder="Ex.:30836812">
					</div>
					<div class="form-group col-md-4">
						<label for="nomeEnvOcorrencia">Nome:</label>
						<input type="text" class="form-control" id="nomeEnvOcorrencia" name="nomeEnvOcorrencia" placeholder="Ex.: Willamy S. Garcia">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="informacoesEnvOcorrencia">Informa��es Adicionais:</label>
						<textarea class="form-control" id="informacoesEnvOcorrencia" name="informacoesEnvOcorrencia" cols="60" rows="5" placeholder="Opcional ou Adicione informa��es para deixar mais claro a indentifica��o do Envolvido"></textarea>
					</div>
				</div>
				<div id="modal-btns">
					<button type="button" id="btnSalvarEnvOcorrencia" name="btnSalvarEnvOcorrencia" class="btn btn-success" onclick="salvarMilitarEnvolvido('salvar')">Salvar</button>
					<button type="button" id="btnSairEnvOcorrencia" name="btnSairEnvOcorrencia" class="btn btn-danger" onclick="hiddenModal()">Fechar</button>
				</div>
		</div>
		
	</div>
</div>
<!-- MODAL CADASTRO DE ARMAS--> 
<!-- Modal -->
<div id="modal-content-armas">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Armas de Fogo</label>
			<button type="button" onclick="hiddenModalArmas()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="serieArmaOcorrencia">N� de Serie:</label>
					<input type="text" class="form-control" id="serieArmaOcorrencia" name="serieArmaOcorrencia" placeholder="Ex.: KYX0003">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-3">
						<label for="tipoArmaOcorrencia">Tipo:</label> 
						<select class="form-control" id="tipoArmaOcorrencia" name="tipoArmaOcorrencia">

							<option value="">Selecionar</option>
							<option>Revolver</option>
							<option>Pistola</option>
							<option>Carabina</option>
							<option>Fuzil</option>
							<option>Espigarda</option>
							<option>Metralhadora</option>
							<option>SubMetralhadora</option>
							

						</select>
					</div>
					<div class="form-group col-md-3">
						<label for="funcionamentoArmaOcorrencia">Funcionamento:</label> 
						<select class="form-control" id="funcionamentoArmaOcorrencia" name="funcionamentoArmaOcorrencia">

							<option value="">Selecionar</option>
							<option>Repeti��o</option>
							<option>Semi-Automatica</option>
							<option>Automatica</option>
							
						</select>
					</div>
					<div class="form-group col-md-2">
						<label for="marcaArmaOcorrencia">Marca:</label>
						<input type="text" class="form-control" id="marcaArmaOcorrencia" name="marcaArmaOcorrencia" placeholder="Ex.: IMBEL">
					</div>
					<div class="form-group col-md-2">
						<label for="calibreArmaOcorrencia">Calibre:</label>
						<input type="text" class="form-control" id="calibreArmaOcorrencia" name="calibreArmaOcorrencia" placeholder="Ex.:. 40">
					</div>
					<div class="form-group col-md-2">
						<label for="capacidadeArmaOcorrencia">Capacidade:</label>
						<input type="text" class="form-control" id="capacidadeArmaOcorrencia" name="capacidadeArmaOcorrencia" placeholder="Ex.: 11+1">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="informacoesArmasOcorrencia">Informa��es Adicionais:</label>
						<textarea class="form-control" id="informacoesArmasOcorrencia" name="informacoesArmasOcorrencia" cols="60" rows="5" placeholder="Ex.: Arma fruto de roubou. Arma com numera��o raspada."></textarea>
					</div>
				</div>
				<div id="modal-btns">
					<button type="button" id="btnSalvarArmaOcorrencia" name="btnSalvarArmaOcorrencia" class="btn btn-success" onclick="salvarArmasOcorrencia('salvar')">Salvar</button>
					<button type="button" id="btnSairArmaOcorrencia" name="btnSairArmaOcorrencia" class="btn btn-danger" onclick="hiddenModalArmas()">Fechar</button>
				</div>
		</div>
		
	</div>
</div>

<!-- MODAL CADASTRO DE ARMAS VIEW--> 
<!-- Modal -->
<div id="modal-content-armas-view">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Armas de Fogo</label>
			<button type="button" onclick="hiddenModalArmasView()" class="btn-close-modal">X</button> 
		</div>
			<div id="model-body">
				<div class="form-row">
					<div class="form-group col-md-12">
						<fieldset>
							<legend>Armas da Ocorrencia</legend>
							<div class="table-overflow">
								<table class="table table-striped"
									id="tabela-armas-ocorrencia">
									<thead>
										<tr>
											<td scope="col"><strong>Codigo Arma</strong></td>
											<td scope="col"><strong>Codigo Ocorrencia</strong></td>
											<td scope="col"><strong>N� Serie</strong></td>
											<td scope="col"><strong>Tipo</strong></td>
											<td scope="col"><strong>Funcionamento</strong></td>
											<td scope="col"><strong>Marca</strong></td>
											<td scope="col"><strong>Calibre</strong></td>
											<td scope="col"><strong>Capacidade</strong></td>
											<td scope="col"><strong>Informa��es</strong></td>
											<td scope="col"><strong>A��o</strong></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${armas}" var="listaArmas">
											<tr>
												<td scope="row"><c:out value="${listaArmas.codigoArma}"></c:out></td>
												<td><c:out value="${listaArmas.codigoOcorrencia}"></c:out></td>
												<td><c:out value="${listaArmas.serieArma}"></c:out></td>
												<td><c:out value="${listaArmas.tipoArma}"></c:out></td>
												<td><c:out value="${listaArmas.funcionamentoArma}"></c:out></td>
												<td><c:out value="${listaArmas.marcaArma}"></c:out></td>
												<td><c:out value="${listaArmas.calibreArma}"></c:out></td>
												<td><c:out value="${listaArmas.capacidadeArma}"></c:out></td>
												<td><c:out value="${listaArmas.informacoesArama}"></c:out></td>
												<td><a onclick="removerArmaOcorrecia(${listaArmas.codigoArma});" class="btn btn-danger btn-sm">Remover</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

		</div>
</div>
<!-- MODAL CADASTRO DE ENTORPECENTES--> 
<!-- Modal -->
<div id="modal-content-entorpecentes">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Entorpecentes</label>
			<button type="button" onclick="hiddenModalEntorpecentes()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-4">
						<label for="nomeEntorpecente">Nome:</label> 
						<select class="form-control" id="nomeEntorpecente" name="nomeEntorpecente">

							<option value="">Selecionar</option>
							<option>Maconha</option>
							<option>Skank</option>
							<option>Cocaina</option>
							<option>Crack</option>
							<option>Ecstasy</option>
							<option>LSD</option>
							<option>Inalantes</option>
							<option>Heroina</option>
							<option>Barbituricos</option>
							<option>Cloroformio</option>
							<option>Morfina</option>
							<option>Cha de Cogumelo</option>
							<option>Anfetaminas</option>
							
						</select>
				</div>
				<div class="form-group col-md-4">
					<label for="quantidadeUnEntorpecente">Quantidade UN:</label>
					<input type="text" class="form-control" id="quantidadeUnEntorpecente" name="quantidadeUnEntorpecente" placeholder="Ex.:30 -> (30 UN)">
				</div>
				<div class="form-group col-md-4">
					<label for="quantidadeKgEntorpecente">Quantidade Kg:</label>
					<input type="text" class="form-control" id="quantidadeKgEntorpecente" name="quantidadeKgEntorpecente" placeholder="Ex.: 1,000 ->(1 Kilo)">
				</div>
			</div>
			<div class="form-row">
					<div class="form-group col-md-12">
						<label for="informacoesEntorpecentes">Informa��es Adicionais:</label>
						<textarea class="form-control" id="informacoesEntorpecentes" name="informacoesEntorpecentes" cols="60" rows="5" placeholder="Ex.: Mais informa��es que o Agente Julga importante."></textarea>
					</div>
			</div>
			<div id="modal-btns">
					<button type="button" id="btnSalvarEntorpecemtesOcorrencia" name="btnSalvarEntorpecemtesOcorrencia" class="btn btn-success" onclick="salvarEntorpecentesOcorrencia('salvar')">Salvar</button>
					<button type="button" id="btnSairEntorpecemtesOcorrencia" name="btnSairEntorpecemtesOcorrencia" class="btn btn-danger" onclick="hiddenModalEntorpecentes()">Fechar</button>
			</div>
		</div>
		
	</div>
</div>
<!-- MODAL CADASTRO DE ENTORPECENTES VIEW--> 
<!-- Modal -->
<div id="modal-content-entorpecentes-view">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Entorpecentes</label>
			<button type="button" onclick="hiddenModalEntorpecentesView()" class="btn-close-modal">X</button> 
		</div>
			<div id="model-body">
				<div class="form-row">
					<div class="form-group col-md-12">
						<fieldset>
							<legend>Entorpecentes Ocorrencia</legend>
							<div class="table-overflow">
								<table class="table table-striped"
									id="tabela-entorpecentes-ocorrencia">
									<thead>
										<tr>
											<td scope="col"><strong>Codigo Entorpecentes</strong></td>
											<td scope="col"><strong>Codigo Ocorrencia</strong></td>
											<td scope="col"><strong>Nome</strong></td>
											<td scope="col"><strong>QTD Unit�ria</strong></td>
											<td scope="col"><strong>QTD em Kg</strong></td>
											<td scope="col"><strong>Informa��es</strong></td>
											<td scope="col"><strong>A��o</strong></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${entorpecentes}" var="listaEntorpecentes">
											<tr>
												<td scope="row"><c:out value="${listaEntorpecentes.codigoEntorpecenteOcorrencia}"></c:out></td>
												<td><c:out value="${listaEntorpecentes.entorpCodigoOcorrencia}"></c:out></td>
												<td><c:out value="${listaEntorpecentes.nomeEntorpecenteOcorrencia}"></c:out></td>
												<td><c:out value="${listaEntorpecentes.qtdUnEntorpecenteOcorrencia}"></c:out></td>
												<td><c:out value="${listaEntorpecentes.qtdKgEntorpecenteOcorrencia}"></c:out></td>
												<td><c:out value="${listaEntorpecentes.informacoesEntorpecenteOcorrencia}"></c:out></td>
												<td><a href="Ocorrencia?acao=excluir&codigo=${listaEntorpecentes.entorpCodigoOcorrencia}" onclick="return confirm('Confirmar Exclus�o');" class="btn btn-danger btn-sm">Remover</a></td>

											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

		</div>
</div>
<!-- ################################################################# -->
<!-- MODAL CADASTRO DE VEICULOS--> 
<!-- Modal -->
<div id="modal-content-veiculos">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Veiculos</label>
			<button type="button" onclick="hiddenModalVeiculos()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="placaVeiculo">Placa:</label>
					<input type="text" class="form-control" id="placaVeiculo" name="placaVeiculo" placeholder="Ex.: XYZ1234" >
				</div>
				<div class="form-group col-md-4">
					<label for="narcaVeiculo">Marca:</label>
					<input type="text" class="form-control" id="marcaVeiculo" name="marcaVeiculo" placeholder="Ex.: TOYOTA">
				</div>
				<div class="form-group col-md-4">
					<label for="modeloVeiculo">Modelo:</label>
					<input type="text" class="form-control" id="modeloVeiculo" name="modeloVeiculo" placeholder="Ex.: COROLLA XEI">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
							<label for="tipoVeiculo">Tipo:</label> 
							<select class="form-control" id="tipoVeiculo" name="tipoVeiculo">
	
								<option value="">Selecionar</option>
								<option>Autom�vel</option>
								<option>Motocicleta</option>
								<option>Micro�nibus</option>
								<option>�nibus</option>
								<option>Reboque </option>
								<option>Triciclo</option>
								<option>Quadriciclo</option>
								<option>Caminhonete</option>
								<option>Caminh�o</option>
								<option>Carro�a</option>
								<option>Trator </option>
								<option>Utilit�rio</option>
								<option>Bicicleta</option>
								
							</select>
					</div>
					<div class="form-group col-md-4">
						<label for="corVeiculo">Cor:</label>
						<input type="text" class="form-control" id="corVeiculo" name="corVeiculo" placeholder="Ex.: Branco">
					</div>
					<div class="form-group col-md-2">
						<label for="anoFab">Ano Fabrica��o:</label>
						<input type="text" class="form-control" id="anoFab" name="anoFab" placeholder="Ex.: 2019">
					</div>
					<div class="form-group col-md-2">
						<label for="anoMod">Ano Modelo:</label>
						<input type="text" class="form-control" id="anoMod" name="anoMod" placeholder="Ex.: 2020">
					</div>
			</div>
			<div id="modal-btns">
					<button type="button" id="btnSalvarVeiculosOcorrencia" name="btnSalvarVeiculosOcorrencia" class="btn btn-success" onclick="salvarVeiculoOcorrencia()">Salvar</button>
					<button type="button" id="btnSairVeiculosOcorrencia" name="btnSairVeiculosOcorrencia" class="btn btn-danger" onclick="hiddenModalVeiculos()">Fechar</button>
			</div>
		</div>
		
	</div>
</div>
<!-- MODAL CADASTRO DE VEICULOS VIEW--> 
<!-- Modal -->
<div id="modal-content-veiculos-view">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Veiculos</label>
			<button type="button" onclick="hiddenModalVeiculosView()" class="btn-close-modal">X</button> 
		</div>
			<div id="model-body">
				<div class="form-row">
					<div class="form-group col-md-12">
						<fieldset>
							<legend>Veiculos Ocorrencia</legend>
							<div class="table-overflow">
								<table class="table table-striped"
									id="tabela-veiculos-ocorrencia">
									<thead>
										<tr>
											<td scope="col"><strong>Codigo Veiculo</strong></td>
											<td scope="col"><strong>Codigo Ocorrencia</strong></td>
											<td scope="col"><strong>Placa</strong></td>
											<td scope="col"><strong>Marca</strong></td>
											<td scope="col"><strong>Modelo</strong></td>
											<td scope="col"><strong>Tipo</strong></td>
											<td scope="col"><strong>Cor</strong></td>
											<td scope="col"><strong>Ano Fabrica��o</strong></td>
											<td scope="col"><strong>Ano Modelo</strong></td>
											<td scope="col"><strong>A��o</strong></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${veiculos}" var="listaVeiculos">
											<tr>
												<td scope="row"><c:out value="${listaVeiculos.codigoVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.codigoOcorrencia}"></c:out></td>
												<td><c:out value="${listaVeiculos.placaVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.maracaVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.modeloVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.tipoVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.corVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.anoFabVeiculoOco}"></c:out></td>
												<td><c:out value="${listaVeiculos.anoModVeiculoOco}"></c:out></td>
												<td><a onclick="removerVeiculosOcorrencia(${listaVeiculos.codigoVeiculoOco});" class="btn btn-danger btn-sm">Remover</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

		</div>
	</div>	
<!-- ################################################################# -->
<!-- MODAL CADASTRO DE DOCUMENTOS--> 
<!-- Modal -->
<div id="modal-content-documentos">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Documentos</label>
			<button type="button" onclick="hiddenModalDocumentos()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="descricaoDocumento">Descri��o do Documento:</label>
					<input type="text" class="form-control" id="descricaoDocumento" name="descricaoDocumento" placeholder="Ex.: Boletim de Ocorr�ncia" >
				</div>
			</div>	
			<div class="form-row">	
				<div class="form-group col-md-12">
					<label for="fileDocumento">Anexar Documento:</label>
					<input type="file" class="form-control" id="fileDocumento" name="fileDocumento" accept="application/pdf,application/vnd.ms-excel" onchange="base(this)">
					<input type="text" hidden="hidden" id="documentoLido" name="documentoLido">
				</div>
			</div>
			<div id="modal-btns">
					<button type="button" id="btnSalvarDocumentosOcorrencia" name="btnSalvarDocumentosOcorrencia" class="btn btn-success" onclick="salvarDocumentoOcorrencia()">Salvar</button>
					<button type="button" id="btnSairDocumentosOcorrencia" name="btnSairDocumentosOcorrencia" class="btn btn-danger" onclick="hiddenModalDocumentos()">Fechar</button>
			</div>
		</div>
		
	</div>
</div>
<!-- MODAL CADASTRO DE DOCUMENTOS VIEW--> 
<!-- Modal -->
<div id="modal-content-documentos-view">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Documentos</label>
			<button type="button" onclick="hiddenModalDocumentosView()" class="btn-close-modal">X</button> 
		</div>
			<div id="model-body">
				<div class="form-row">
					<div class="form-group col-md-12">
						<fieldset>
							<legend>Documentos Ocorrencia</legend>
							<div class="table-overflow">
								<table class="table table-striped" id="tabela-documentos-ocorrencia">
									<thead>
										<tr>
											<td scope="col"><strong>Codigo Documento</strong></td>
											<td scope="col"><strong>Codigo Ocorrencia</strong></td>
											<td scope="col"><strong>Descri��o</strong></td>
											<td scope="col"><strong>A��o</strong></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${documentos}" var="listaDocumentos">
											<tr>
												<td scope="row"><c:out value="${listaDocumentos.codigoDocumento}"></c:out></td>
												<td><c:out value="${listaDocumentos.codigoDocumentoOcorrencia}"></c:out></td>
												<td><c:out value="${listaDocumentos.descricaoDocumento}"></c:out></td>
												<td><a href="DocumentosOcorrencia?codigoDocumento=${listaDocumentos.codigoDocumento}&acao=visualizar" target="_blank" class="btn btn-info btn-sm">Vizualizar</a>
												    <a href="DocumentosOcorrencia?codigoDocumento=${listaDocumentos.codigoDocumento}&acao=download" target="_blank" class="btn btn-success btn-sm">Baixar</a>
												    <button type="button" class="btn btn btn-danger btn-sm" onclick="removerDocumentoOcorrencia(${listaDocumentos.codigoDocumento})">Remover</button>
												      
												     
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

		</div>
</div>
${salvo}
${editado}
${alterado}
${excluido}
</body>
 <!-- Adicionando Javascript -->
<script type="text/javascript">

//TRATAMENTOS INICIAIS
	jQuery.noConflict();
	jQuery(function($){
		$("#telefone").mask("99-99999-9999");
		$("#cpf").mask("999.999.999-99");
	});

	function carregaFormulario() {
		var codigo;
		codigo = document.getElementById('codigoOcorrencia').value;
		if(codigo == ""){
			document.getElementById('iniciarCadastro').disabled=false;
			document.getElementById('addMilitares').disabled=true;
			
			document.getElementById('tab2').disabled=true;
			document.getElementById('tab3').disabled=true;
			document.getElementById('tab4').disabled=true;
			document.getElementById('tab5').disabled=true;
		}else{
			document.getElementById('iniciarCadastro').disabled=true;
			document.getElementById('addMilitares').disabled=false;
			
			document.getElementById('tab2').disabled=false;
			document.getElementById('tab3').disabled=false;
			document.getElementById('tab4').disabled=false;
			document.getElementById('tab5').disabled=false;
			
		}
		
	}
	
//VARIAVEIS GLOBAIS




// TRATAMENTOS DOS MODAIS
// ----------------MOSTRAR TELA MODAL	
	function showModal() {
		document.getElementById("modal-content").style.display = "block";
	}
	function showModalArmas() {
		document.getElementById("modal-content-armas").style.display = "block";
	}
	function showModalArmasView() {
		document.getElementById("modal-content-armas-view").style.display = "block";
	}
	function showModalEntorpecentes() {
		document.getElementById("modal-content-entorpecentes").style.display = "block";
	}
	function showModalEntorpecentesView() {
		document.getElementById("modal-content-entorpecentes-view").style.display = "block";
	}
	function showModalVeiculos() {
		document.getElementById("modal-content-veiculos").style.display = "block";
	}
	function showModalVeiculosView() {
		document.getElementById("modal-content-veiculos-view").style.display = "block";
	}
	function showModalDocumentos() {
		document.getElementById("modal-content-documentos").style.display = "block";
	}
	function showModalDocumentosView() {
		document.getElementById("modal-content-documentos-view").style.display = "block";
	}
	
// ------------------OCULTAR TELA MODAL		
	function hiddenModal() {
		document.getElementById("modal-content").style.display = "none";
		document.getElementById("codigoEnvOcorrencia").value="";
		document.getElementById("graduacaoPostoGuanicaoEnvOcorrencia").value="";
		document.getElementById("numeralEnvOcorrencia").value="";
		document.getElementById("matriculaEnvOcorrencia").value="";
		document.getElementById("nomeEnvOcorrencia").value="";
		document.getElementById('informacoesEnvOcorrencia').value="";
	}
	function hiddenModalArmas() {
		document.getElementById("modal-content-armas").style.display = "none";
		document.getElementById("serieArmaOcorrencia").value="";
		document.getElementById("tipoArmaOcorrencia").value="";
		document.getElementById("funcionamentoArmaOcorrencia").value="";
		document.getElementById("marcaArmaOcorrencia").value="";
		document.getElementById("calibreArmaOcorrencia").value="";
		document.getElementById("capacidadeArmaOcorrencia").value="";
		document.getElementById('informacoesArmasOcorrencia').value="";
	}
	function hiddenModalArmasView() {
		document.getElementById("modal-content-armas-view").style.display = "none";
		
	}
	function hiddenModalEntorpecentes() {
		document.getElementById("modal-content-entorpecentes").style.display = "none";
		document.getElementById("nomeEntorpecente").value="";
		document.getElementById("quantidadeUnEntorpecente").value="";
		document.getElementById("quantidadeKgEntorpecente").value="";
		document.getElementById("informacoesEntorpecentes").value="";
	}
	function hiddenModalEntorpecentesView() {
		document.getElementById("modal-content-entorpecentes-view").style.display = "none";
		
	}
	function hiddenModalVeiculos() {
		document.getElementById("modal-content-veiculos").style.display = "none";
		document.getElementById("placaVeiculo").value="";
		document.getElementById("marcaVeiculo").value="";
		document.getElementById("modeloVeiculo").value="";
		document.getElementById("tipoVeiculo").value="";
		document.getElementById("tipoVeiculo").value="";
		document.getElementById("corVeiculo").value="";
		document.getElementById("anoFab").value="";
		document.getElementById("anoMod").value="";
	}
	function hiddenModalVeiculosView() {
		document.getElementById("modal-content-veiculos-view").style.display = "none";
		
	}
	function hiddenModalDocumentos() {
		document.getElementById("modal-content-documentos").style.display = "none";
		document.getElementById("placaVeiculo").value="";
		document.getElementById("marcaVeiculo").value="";
		document.getElementById("modeloVeiculo").value="";
		document.getElementById("tipoVeiculo").value="";
		document.getElementById("tipoVeiculo").value="";
		document.getElementById("corVeiculo").value="";
		document.getElementById("anoFab").value="";
		document.getElementById("anoMod").value="";
	}
	function hiddenModalDocumentosView() {
		document.getElementById("modal-content-documentos-view").style.display = "none";
		
	}

// TRATAMENTO DOS CAMPOS DE ENDERE�O

	function limpa_formul�rio_cep() {
		document.getElementById('rua').value = ("");
		document.getElementById('bairro').value = ("");
		document.getElementById('cidade').value = ("");
		document.getElementById('uf').value = ("");
		
	}
	function meu_callback(conteudo) {
		if (!("erro" in conteudo)) {
			document.getElementById('rua').value = (conteudo.logradouro);
			document.getElementById('bairro').value = (conteudo.bairro);
			document.getElementById('cidade').value = (conteudo.localidade);
			document.getElementById('uf').value = (conteudo.uf);
			
		} else {
			limpa_formul�rio_cep();
			alert("CEP n�o encontrado.");
		}
	}
	function pesquisacep(valor) {
		var cep = valor.replace(/\D/g, '');
		if (cep != "") {
			var validacep = /^[0-9]{8}$/;
			if (validacep.test(cep)) {
				document.getElementById('rua').value = "...";
				document.getElementById('bairro').value = "...";
				document.getElementById('cidade').value = "...";
				document.getElementById('uf').value = "...";
				
				var script = document.createElement('script');
				script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
				document.body.appendChild(script);
			} else {
				limpa_formul�rio_cep();
				alert("Formato de CEP inv�lido.");
			}
		} else {
			limpa_formul�rio_cep();
		}
	};

//SUBMIT�S DO FORMULARIO GERAL

	function acaoBotaoOcorrencia(acao){
		var codigo;
		codigo = document.getElementById('codigoOcorrencia').value;
		if((codigo == "" || codigo == null) && (acao == "")){
			document.getElementById('frm-cadOcorrencia').action = "Ocorrencia?acao=" + 'salvar';
			document.getElementById('frm-cadOcorrencia').submit();
		}else{
			document.getElementById('frm-cadOcorrencia').action = "Ocorrencia?acao=" + acao;
			document.getElementById('frm-cadOcorrencia').submit();
		}
		
	}

//MOSTRAR IMAGEM AO SELECIONAR NO TYPE="FILE"   ---------------------------------------------------------------------------------------------------------------------------------
	function fotoDiversas1() {
		  
		  if (this.files && this.files[0]) {
		    
		    var FR= new FileReader();
		    
		    FR.addEventListener("load", function(e) {
		      document.getElementById("fotoDiversas1").src = e.target.result;
		    
		    }); 
		    
		    FR.readAsDataURL( this.files[0] );
		  }
		  
		}

		document.getElementById("fotoDiversas01").addEventListener("change", fotoDiversas1);
		
		function fotoDiversas2() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDiversas2").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas02").addEventListener("change", fotoDiversas2);
		
		function fotoDiversas3() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDiversas3").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas03").addEventListener("change", fotoDiversas3);
		
		function fotoDiversas4() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDiversas4").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas04").addEventListener("change", fotoDiversas4);
		
		function fotoDiversas5() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDiversas5").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas05").addEventListener("change", fotoDiversas5);
</script>
</html>