<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
		
		<title>CIA 1.0 - Cadastro de Ocorrência</title>
	</head>
<body onload="carregaFormulario()">
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
	
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do	Cidadão</a></li>
				<li><a href="/cia-1.0/pages/cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorrência</a></li>
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
		<nav class="nav_tabs">
			<h3 class="titulo-cadastro">Cadastro de Ocorrêcia</h3>
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
											<input type="text" class="form-control" id="codigoOcorrencia" name="codigoOcorrencia" placeholder="Automatico" readonly="readonly" value="${ocorrencia.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="mikeOcorrencia">Mike da Ocorrência</label>
											<input type="text" class="form-control" id="mikeOcorrencia" name="mikeOcorrencia" placeholder="Mike" value="${ocorrencia.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="inqueritoOcorrencia">Inquerio</label>
											<input type="text" class="form-control" id="inqueritoOcorrencia" name="inqueritoOcorrencia" placeholder="Inquerito" value="${ocorrencia.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="boOcorrencia">Boletem de Ocorrência</label>
											<input type="text" class="form-control" id="boOcorrencia" name="boOcorrencia" placeholder="Boletim de Ocorrência" value="${ocorrencia.codigo}">
										</div>
										<div class="form-group col-md-4">
											<label for="outrosOcorrencia">Outros</label>
											<input type="text" class="form-control" id="outrosOcorrencia" name="outrosOcorrencia" placeholder="Outros" value="${ocorrencia.codigo}">
										</div>
									</div>	
									<div class="form-row">	
										<h4>Noticiante</h4>
									</div>
									<hr>	
									<div class="form-row">	
										<div class="form-group col-md-2">
											<label for="graduacaoPostoOcorrencia">Graduação/Posto</label>
											<select id="graduacaoPostoOcorrencia" name="graduacaoPostoOcorrencia" class="form-control">
																						
												<option value="">Selecionar</option>
												<option>Soldado</option>
												<option>Cabo</option>
												<option>3º Sargento</option>
												<option>2º Sargento</option>
												<option>1º Sargento</option>
												<option>Sub-Tenente</option>
												<option>2º Tenente</option>
												<option>1º Tenente</option>
												<option>Capitão</option>
												<option>Major</option>
												<option>Tenente-Coronel</option>
												<option>Coronel</option>
											
											</select>
										</div>
										<div class="form-group col-md-1">
											<label for="numeralOcorrencia">Numeral</label>
											<input type="text" class="form-control" id="numeralOcorrencia" name="numeralOcorrencia" placeholder="Numeral" value="${ocorrencia.alcunha}">
										</div>
										<div class="form-group col-md-2">
											<label for="matriculaOcorrencia">Matricula</label>
											<input type="text" class="form-control" id="matriculaOcorrencia" name="matriculaOcorrencia" value="${ocrrencia.nascimento}">
										</div>
										<div class="form-group col-md-4">
											<label for="nomeGuerraOcorrencia">Nome de Guerra</label>
											<input type="text" class="form-control" id="nomeGuerraOcorrencia" name="nomeGuerraOcorrencia" placeholder="Nome de Guerra" value="${ocorrencia.nascimento}" >
										</div>
										<div class="form-group col-md-2">
											<label for="iniciarCadastro"> Clique para Iniciar o Cadastro</label>
											<button type="button" class="btn btn-dark" id="iniciarCadastro" name="iniciarCadastro" onclick="iniciarOcorrencia()">Iniciar Cadastro</button>
										</div>
									</div>
									<div class="form-row">	
										<h4>Guarnição</h4>
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
																<td scope="col"><strong>Graduação/Posto</strong></td>
																<td scope="col"><strong>Numeral</strong></td>
																<td scope="col"><strong>Matricula</strong></td>
																<td scope="col"><strong>Nome</strong></td>
																<td scope="col"><strong>Informações</strong></td>
																<td scope="col"><strong>Ação</strong></td>
															</tr>
														</thead>
														<tbody>
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
							<label for="tab2" class="tab_label">Ocorrência</label>
							<div class="tab-content">
								<br>
								<div class="form-row">
									<div class="form-group col-md-2">
										<label for="dataHoraOcorrencia">Data/Hora da Ocorrêcia</label>
										<input type="datetime-local" class="form-control" id="dataHoraOcorrencia" name="dataHoraOcorrencia" value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraInicioComunicacao">Data/Hora Inicio da Comunicação</label>
										<input type="datetime-local" class="form-control" id="dataHoraInicioComunicacao" name="dataHoraInicioComunicacao" value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraFimComunicacao">Data/Hora Fim da Comunicação</label>
										<input type="datetime-local" class="form-control" id="dataHoraFimComunicacao" name="dataHoraFimComunicacao" value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="delegaciaOcorrencia">Delegacia</label>
										<select id="delegaciaOcorrencia" name="delegaciaOcorrencia" class="form-control">
											
											${opcao1}${cidadao.delegacia}${opcao2}
											<option value="">Selecionar Delegacia</option>
											<option>1º Distrito Policial</option>
											<option>2º Distrito Policial</option>
											<option>3º Distrito Policial</option>
											<option>4º Distrito Policial</option>
											<option>5º Distrito Policial</option>
											<option>6º Distrito Policial</option>
											<option>7º Distrito Policial</option>
											<option>8º Distrito Policial</option>
											<option>9º Distrito Policial</option>
											<option>10º Distrito Policial</option>
											<option>11º Distrito Policial</option>
											<option>12º Distrito Policial</option>
											<option>13º Distrito Policial</option>
											<option>14º Distrito Policial</option>
											<option>15º Distrito Policial</option>
											<option>16º Distrito Policial</option>
											<option>17º Distrito Policial</option>
											<option>18º Distrito Policial</option>
											<option>19º Distrito Policial</option>
											<option>20º Distrito Policial</option>
											<option>21º Distrito Policial</option>
											<option>22º Distrito Policial</option>
											<option>23º Distrito Policial</option>
											<option>24º Distrito Policial</option>
											<option>25º Distrito Policial</option>
											<option>26º Distrito Policial</option>
											<option>27º Distrito Policial</option>
											<option>28º Distrito Policial</option>
											<option>29º Distrito Policial</option>
											<option>30º Distrito Policial</option>
											<option>31º Distrito Policial</option>
											<option>32º Distrito Policial</option>
											<option>33º Distrito Policial</option>
											<option>34º Distrito Policial</option>
											
										</select>
									</div>
									<div class="form-group col-md-4">
										<label for="tipoOcorrencia">Tipo de Ocorrência</label>
										<select id="tipoOcorrencia" name="tipoOcorrencia" class="form-control">
											${opcaoF1}${cidadao.faccao}${opcaoF2}
											<option value="">Selecionar</option>
											<option>Flagrante</option>
											<option>Auto de Apresentação</option>
											<option>TCO</option>
											<option>BO</option>
											<option>Comunicação de Fato</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="enderecoOcorrencia">Endereço da Ocorrência</label>
										<input type="text" class="form-control" id="enderecoOcorrencia" name="enderecoOcorrencia" placeholder="Endereço da Ocorrência" value="${cidadao.endOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="bairroOcorrencia">Bairro</label>
										<input type="text"	class="form-control" id="bairroOcorrencia" name="bairroOcorrencia" placeholder="Bairro da Ocorrencia" value="${cidadao.bairroOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="cidadeOcorrencia ">Cidade</label>
										<input type="text" class="form-control" id="cidadeOcorrencia" name="cidadeOcorrencia" placeholder="Cidade da Ocorrencia" value="${cidadao.cidadeOcorrencia}">
									</div>
									<div class="form-group col-md-4">
										<label for="referenciaOcorrencia">Ponto de Referencia</label>
										<input type="text" class="form-control" id="referenciaOcorrencia" name="referenciaOcorrencia" placeholder="Informe um Ponto de Referencia" value="${cidadao.referenciaOcorrencia}">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="delegadoOcorrencia">Delegado</label>
										<input type="text" class="form-control" id="delegadoOcorrencia" name="delegadoOcorrencia" maxlength="10" placeholder="Informe Nome do(a) Delegado(a)">
									</div>
									<div class="form-group col-md-4">
										<label for="escrivaoOcorrencia">Escrivão</label>
										<input type="text" class="form-control" id="escrivaoOcorrencia" name="escrivaoOcorrencia" maxlength="10" placeholder="Informe Nome do(a) Escrivã(o)">
									</div>
									<div class="form-group col-md-4">
										<label for="autoridadeMilitar">Autoridade Militar</label>
										<input type="text" class="form-control" id="autoridadeMilitar" name="autoridadeMilitar" maxlength="10" placeholder="Informe a Autoridade Militar">
									</div>
								
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="ordenamentoJuridico">Ordenamendo Juridico</label>
										<select id="ordenamentoJuridico" name="ordenamentoJuridico" class="form-control">
											<option value="">Selecionar</option>
											<option>Código Civil Brasileiro</option>
											<option>Constituição Federal</option>
											<option>Código de Processo Civil</option>
											<option>Código Penal</option>
											<option>Código de Processo Penal</option>
											<option>Código Penal Militar</option>
											<option>Código Processual Penal MIlitar</option>
											<option>Código de Defesa do Consumidor</option>
											<option>Código de Defesa do Consumidor</option>
											<option>Código de Defesa do Consumidor</option>
											<option>ECA (Estatuto da Criança e do Adolescente)</option>
										</select>
									</div>
									<div class="form-group col-md-2">
										<label for="artigoOcorrencia">Artigo</label>
										<input type="number" class="form-control" id="artigoOcorrencia" name="artigoOcorrencia"placeholder="Informe o Artigo">
									</div>
									<div class="form-group col-md-2">
										<label for="alineaOcorriencia">Paragrafo/Inciso/Alínea</label>
										<input type="text" class="form-control" id="alineaOcorriencia" name="alineaOcorriencia" maxlength="10"placeholder="Informe a Alínea">
									</div>
									<div class="form-group col-md-2">
										<label for="adicionarProcesso">Clique para Adicionar os Artigos</label><br>
										<button type="button" class="btn btn-dark" id="adicionarProcesso" onclick="adicionarArtigo()">Adicionar</button>
									</div>
								</div>
								<div class="form-row">
										<div class="form-group col-md-12">
											<fieldset>
												<legend>Informações Criminais</legend>
												<div class="table-overflow">
													<table class="table table-striped" id="tabela-informacoes-criminais">
														<thead>
															<tr>
																<td scope="col"><strong>Codigo Ordenamento</strong></td>
																<td scope="col"><strong>Codigo Ocorrencia</strong></td>
																<td scope="col"><strong>Ordenamento Juridico</strong></td>
																<td scope="col"><strong>Artigo</strong></td>
																<td scope="col"><strong>Paragrafo/Incisio/Alínea</strong></td>
																<td scope="col"><strong>Ação</strong></td>
															</tr>
														</thead>
														<tbody>
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
									<h4>Armas / Entorpecentes / Veiculos</h4>
									<div class="form-row">
										<div class="form-group col-md-1">
											<label for="quantidadeArma">QUANTIDADE</label><br>
											<label id="quantidadeArma" onclick="showModalArmasView();" style="cursor: pointer; font-weight: bold;">0</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarArma">Adicionar Armas</label><br>
											<button type="button" id="adicionarArma" class="btn btn-dark" onclick="showModalArmas()">Adicionar</button>
										</div>
										<div class="form-group col-md-1">
											<label for="quantidadeEntorpecentes">QUANTIDADE</label><br>
											<label id="quantidadeEntorpecentes" onclick="alert('Teste');" style="cursor: pointer; font-weight: bold;">0</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarEntorpecentes">Adicionar Entorpecentes</label><br>
											<button type="button" id="adicionarEntorpecentes" class="btn btn-dark" onclick="showModalEntorpecentes()">Adicionar</button>
										</div>
										<div class="form-group col-md-1">
											<label for="quantidadeVeiculos">QUANTIDADE</label><br>
											<label id="quantidadeVeiculos" onclick="alert('Teste');" style="cursor: pointer; font-weight: bold;">0</label><br>
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarVeiculos">Adicionar Veiculos</label><br>
											<button type="button" id="adicionarVeiculos" class="btn btn-dark" onclick="showModalVeiculos()">Adicionar</button>
										</div>
									</div>
									<h4>Veiculos</h4>
									<div class="form-row">
										<div class="form-group col-md-1">
											<label for="placa">Placa</label>
											<input type="text" class="form-control" id="placa" name="placa" aria-describedby="placaHelp" placeholder="AAA9999" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="chassi">Chassi</label>
											<input type="text" class="form-control" id="chassi" name="chassi" aria-describedby="chassiHelp" placeholder="Chassi" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="marca">Marca/Modelo</label>
											<input type="text" class="form-control" id="marca" name="marca" aria-describedby="marcaHelp" placeholder="Informe Marca e Modelo" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="cor">Cor</label>
											<input type="text" class="form-control" id="cor" name="cor" aria-describedby="corHelp" placeholder="Informe a Cor" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-1">
											<label for="ano">Ano/Ano</label>
											<input type="text" class="form-control" id="ano" name="ano" aria-describedby="anoHelp" placeholder="Ex:2009/2010" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarVeiculo">Clique para Adicionar a Veiculo</label><br>
										<button type="button" id="adicionarVeiculo" class="btn btn-dark" onclick="adicionarVeiculo()">Adicionar</button>
										</div>
									</div>
									<div class="form-group col-md-12">
									
										<textarea class="form-control" cols=60 id="veiculos" name="veiculos" rows="3" maxlength="500" wrap="hard" placeholder="Placa, Chassi, Marca/Modelo,Cor, Ano/Ano">${cidadao.historicoJuridico}</textarea>
								
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
										<input type="file" id="fotoDiversas01" name="fotoDiversas01" accept="image/jpeg, image/jpg">
	
										<div class="fotos">
											<img alt="fotoDiversas1" id="fotoDiversas1" src="<c:if test='${cidadao.fotoFrente == null}'> ../img/camera-p.png  </c:if>
																						 <c:if test='${cidadao.fotoFrente != null}'> ${cidadao.fotoFrente} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas02">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas02" name="fotoDiversas02" accept="image/jpeg,image/jpg" value="${cidadao.fotoLado}">
	
										<div class="fotos">
											<img alt="fotoDiversas2" id="fotoDiversas2" name="fotoDiversas2" src="<c:if test='${cidadao.fotoLado == null}'> ../img/camera-p.png  </c:if>
																						 			   <c:if test='${cidadao.fotoLado != null}'> ${cidadao.fotoLado} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas03">Adicionar Foto Diversas</label>
										<input type="file" id="fotoDiversas03" name="fotoDiversas03" accept="image/jpeg,image/jpg" value="${cidadao.fotoCostas}">
		
										<div class="fotos">
											<img alt="fotoDiversas3" id="fotoDiversas3" name="fotoDiversas3" src="<c:if test='${cidadao.fotoCostas == null}'> ../img/camera-p.png  </c:if>
																						 			  	     <c:if test='${cidadao.fotoCostas != null}'> ${cidadao.fotoCostas} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas04">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas04" name="fotoDiversas04" accept="image/jpeg,image/jpg" value="${cidadao.fotoDiversas01}">
	
										<div class="fotos">
											<img alt="fotoDiversas4" id="fotoDiversas4" name="fotoDiversas4" src="<c:if test='${cidadao.fotoDiversas01 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${cidadao.fotoDiversas01 != null}'> ${cidadao.fotoDiversas01} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas05">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas05" name="fotoDiversas05" accept="image/jpeg,.jpg" value="${cidadao.fotoDiversas02}">
	
										<div class="fotos">
											<img alt="fotoDiversas5" id="fotoDiversas5" name="fotoDiversas5" src="<c:if test='${cidadao.fotoDiversas02 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${cidadao.fotoDiversas02 != null}'> ${cidadao.fotoDiversas02} </c:if>">
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
										<label for="historicoOcorrencia"></label> Informe com detalhes um breve historico sobre a ocorrência: 
										<br>
										<textarea class="form-control" cols=60 id="historicoOcorrencia" name="historicoOcorrencia" rows="15" maxlength="500" wrap="hard" placeholder="envolvidos, data, hora, endereço, mike da ocorrência, artigos...">${cidadao.historico}</textarea>
									</fieldset>
	
								</div>
								<input type="submit" value="Enviar"/>
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
														<td scope="col"><strong>Nome</strong></td>
														<td scope="col"><strong>Mãe</strong></td>
														<td scope="col"><strong>Nascimento</strong></td>
														<td scope="col"><strong>Bairro</strong></td>
														<td scope="col"><strong>Ação</strong></td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${consultaTotal}" var="lista">
														<tr>
															<td scope="row"><c:out value="${lista.codigo}"></c:out></td>
															<td><c:out value="${lista.nome}"></c:out></td>
															<td><c:out value="${lista.mae}"></c:out></td>
															<td><c:out value="${lista.nascimento}"></c:out></td>
															<td><c:out value="${lista.bairro}"></c:out></td>
															<td><a href="Cidadao?acao=editar&codigo=${lista.codigo}" class="btn btn-secondary btn-sm">Editar</a>
																<a href="Cidadao?acao=excluir&codigo=${lista.codigo}" class="btn btn-danger btn-sm">Excluir</a>
																<a href="Cidadao?acao=visualizar&codigo=${lista.codigo}"  target="_blank" class="btn btn-info btn-sm">Visualizar</a>
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
											${salvo}
											${editado}
											${alterado}
											${excluido}
											<div class="form-row">

												<div class="form-group col-md-12">
													<label for="nomeConsulta">Nome:</label>
													<input type="text" class="form-control" id="nomeConsulta" aria-describedby="nomeConsultaHelp" placeholder="Nome" name="nomeConsulta">
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-12">
													<label for="maeCidadaoConsulta">Mãe:</label>
													<input type="text" class="form-control" id="maeCidadaoConsulta" aria-describedby="maeCidadaoConsultaHelp" placeholder="Nome da Mãe do Cidadão" name="maeCidadaoConsulta">
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
													<label for="atuacaoConsulta">Area de Atuação:</label> <input
														type="text" class="form-control" id="atuacaoConsulta"
														aria-describedby="atuacaoConsultaHelp"
														placeholder="Bairro da Area de Atuação do tan:"
														name="atuacaoConsulta">
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
	
<!-- TELA MODAL -->	
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
						<label for="graduacaoPostoGuanicaoEnvOcorrencia">Graduação/Posto:</label> 
						<select class="form-control" id="graduacaoPostoGuanicaoEnvOcorrencia" name="graduacaoPostoGuanicaoEnvOcorrencia">

							<option value="">Selecionar</option>
							<option>Soldado</option>
							<option>Cabo</option>
							<option>3º Sargento</option>
							<option>2º Sargento</option>
							<option>1º Sargento</option>
							<option>Sub-Tenente</option>
							<option>2º Tenente</option>
							<option>1º Tenente</option>
							<option>Capitão</option>
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
						<label for="informacoesEnvOcorrencia">Informações Adicionais:</label>
						<textarea class="form-control" id="informacoesEnvOcorrencia" name="informacoesEnvOcorrencia" cols="60" rows="5" placeholder="Opcional ou Adicione informações para deixar mais claro a indentificação do Envolvido"></textarea>
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
<div id="modal-content-armas">
	<div id="modal-tela">
		<div id="modal-title">
			<label class="titulo-modal">Cadastro de Armas de Fogo</label>
			<button type="button" onclick="hiddenModalArmas()" class="btn-close-modal">X</button> 
		</div>
		<div id="model-body">
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="serieArmaOcorrencia">Nº de Serie:</label>
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
							<option>Repetição</option>
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
						<label for="informacoesArmasOcorrencia">Informações Adicionais:</label>
						<textarea class="form-control" id="informacoesArmasOcorrencia" name="informacoesArmasOcorrencia" cols="60" rows="5" placeholder="Ex.: Arma fruto de roubou. Arma com numeração raspada."></textarea>
					</div>
				</div>
				<div id="modal-btns">
					<button type="button" id="btnSalvarArmaOcorrencia" name="btnSalvarArmaOcorrencia" class="btn btn-success" onclick="salvarArmasOcorrencia('salvar')">Salvar</button>
					<button type="button" id="btnSairArmaOcorrencia" name="btnSairArmaOcorrencia" class="btn btn-danger" onclick="hiddenModalArmas()">Fechar</button>
				</div>
		</div>
		
	</div>
</div>
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
											<td scope="col"><strong>Nº Serie</strong></td>
											<td scope="col"><strong>Tipo</strong></td>
											<td scope="col"><strong>Funcionamento</strong></td>
											<td scope="col"><strong>Marca</strong></td>
											<td scope="col"><strong>Calibre</strong></td>
											<td scope="col"><strong>Capacidade</strong></td>
											<td scope="col"><strong>Informações</strong></td>
											<td scope="col"><strong>Ação</strong></td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>
			</div>

		</div>
</div>

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

	function showModalArmasView() {
		document.getElementById("modal-content-armas-view").style.display = "block";
	}
	function showModalArmas() {
		document.getElementById("modal-content-armas").style.display = "block";
	}
	function showModal() {
		document.getElementById("modal-content").style.display = "block";
	}
	
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

// TRATAMENTO DOS CAMPOS DE ENDEREÇO

	function limpa_formulário_cep() {
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
			limpa_formulário_cep();
			alert("CEP não encontrado.");
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
				limpa_formulário_cep();
				alert("Formato de CEP inválido.");
			}
		} else {
			limpa_formulário_cep();
		}
	};

//SUBMIT´S DO FORMULARIO GERAL

	function acaoBotaoOcorrencia(acao){
		var codigo;
		codigo = document.getElementById('codigoOcorrencia').value;
		if(codigo == "" || codigo == null){
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