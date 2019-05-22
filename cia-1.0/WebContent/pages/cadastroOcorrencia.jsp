<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<c:set var="context" value="${pageContext.request.contextPath}" />
		<meta name=viewport content="width=device-width, initial-scale=1.0" >
		<meta charset="utf-8">
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${context}/css/estilo-principal.css" type="text/css">
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.js"></script>
			<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery.maskedinput.min.js"></script>
		<title>CIA 1.0 - Cadastro de Ocorrência</title>
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
	
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do	Cidadão</a></li>
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
											<label for="codigo">Codigo</label>
											<input type="text" class="form-control" id="codigo" name="codigo" aria-describedby="codigoHelp" placeholder="Automatico" readonly="readonly" value="${cidadao.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="mikeOcorrencia">Mike da Ocorrência</label>
											<input type="text" class="form-control" id="mikeOcorrencia" name="mikeOcorrencia" aria-describedby="mikeOcorrenciaHelp" placeholder="Mike" value="${cidadao.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="inquerito">Inquerio</label>
											<input type="text" class="form-control" id="inquerito" name="inquerito" aria-describedby="inqueritoHelp" placeholder="Inquerito" value="${cidadao.codigo}">
										</div>
										<div class="form-group col-md-2">
											<label for="bo">Boletem de Ocorrência</label>
											<input type="text" class="form-control" id="bo" name="bo" aria-describedby="boHelp" placeholder="Boletim de Ocorrência" value="${cidadao.codigo}">
										</div>
										<div class="form-group col-md-4">
											<label for="outros">Outros</label>
											<input type="text" class="form-control" id="outros" name="outros" aria-describedby="outrosHelp" placeholder="Outros" value="${cidadao.codigo}">
										</div>
										
									</div>	
										
									<div class="form-row">	
										<h4>Noticiante</h4>
									</div>
									<hr>	
									<div class="form-row">	
										<div class="form-group col-md-2">
											<label for="graduacaoPosto">Graduação/Posto</label>
											<select id="graduacaoPosto" name="graduacaoPosto" class="form-control" aria-describedby="graduacaoPostoHelp" >
																						
												<option>Selecionar</option>
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
											<label for="numeral">Numeral</label>
											<input type="text" class="form-control" id="numeral" name="numeral" aria-describedby="numeralHelp" placeholder="Numeral" value="${cidadao.alcunha}">
										</div>
										<div class="form-group col-md-2">
											<label for="nomeGuerra">Nome de Guerra</label>
											<input type="text" class="form-control" id="nomeGuerra" name="nomeGuerra" aria-describedby="nomeGuerraHelp" placeholder="Nome de Guerra" value="${cidadao.nascimento}" >
										</div>
									</div>
										<div class="form-row">	
										<h4>Guarnição</h4>
									</div>
									<hr>	
									<div class="form-row">	
										<div class="form-group col-md-2">
											<label for="graduacaoPostoGuanicao">Graduação/Posto</label>
											<select id="graduacaoPostoGuanicao" name="graduacaoPostoGuanicao" class="form-control" aria-describedby="graduacaoPostoGuanicaoHelp" >
																						
												<option>Selecionar</option>
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
											<label for="numeralGuanicao">Numeral</label>
											<input type="text" class="form-control" id="numeralGuanicao" name="numeralGuanicao" aria-describedby="numeralGuanicaoHelp" placeholder="Numeral" value="${cidadao.alcunha}">
										</div>
										<div class="form-group col-md-2">
											<label for="nomeGuerraGuanicao">Nome de Guerra</label>
											<input type="text" class="form-control" id="nomeGuerraGuanicao" name="nomeGuerraGuanicao" aria-describedby="nomeGuerraGuanicaoHelp" placeholder="Nome de Guerra" value="${cidadao.nascimento}" >
										</div>
										<div class="form-group col-md-2">
											<label for="viatruraGuanicao">Viatura</label>
											<input type="text" class="form-control" id="viatruraGuanicao" name="viatruraGuanicao" aria-describedby="viatruraGuanicaoHelp" placeholder="Informe a Viatura" value="${cidadao.nascimento}" >
										</div>
										<div class="form-group col-md-2">
											<label for="add">Clique para Adicionar os Militares</label><br>
											<button type="button" id="addMilitares" class="btn btn-dark" onclick="addMilitares()">Adicionar</button>
										</div>
									</div>
									<div class="form-group col-md-12">
										<fieldset>
											<legend>Todos os Militares Envolvidos</legend>
											<textarea class="form-control" cols=60 id="militares" name="militares" rows="5" name="militares" maxlength="500" wrap="hard" placeholder="Militares Envolvidos na Ocorrência">${cidadao.historicoJuridico}</textarea>
										</fieldset>
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
										<input type="datetime-local" class="form-control" id="dataHoraOcorrencia" name="dataHoraOcorrencia" aria-describedby="dataHoraOcorrenciaHelp"  value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraInicioComunicacao">Data/Hora Inicio da Comunicação</label>
										<input type="datetime-local" class="form-control" id="dataHoraInicioComunicacao" name="dataHoraInicioComunicacao" aria-describedby="dataHoraInicioComunicacaoHelp"  value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="dataHoraComunicacao">Data/Hora Fim da Comunicação</label>
										<input type="datetime-local" class="form-control" id="dataHoraComunicacao" name="dataHoraComunicacao" aria-describedby="dataHoraComunicacaoHelp"  value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="delegacia">Delegacia</label>
										<select id="delegacia" name="delegacia" class="form-control" aria-describedby="delegaciaHelp" >
											
											${opcao1}${cidadao.delegacia}${opcao2}
											<option>Selecionar Delegacia</option>
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
											<option>Selecionar</option>
											<option>Flagrante</option>
											<option>Auto de Apresentação</option>
											<option>TCO</option>
											<option>BO</option>
											<option>Comunicação de Fato</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="enderecoO">Endereço da Ocorrência</label>
										<input type="text" class="form-control" id="enderecoO" name="enderecoO" aria-describedby="enderecoOHelp" placeholder="Endereço da Ocorrência" value="${cidadao.endOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="bairroOcorrencia">Bairro</label>
										<input type="text"	class="form-control" id="bairroOcorrencia" name="bairroOcorrencia" aria-describedby="bairroOcorrenciaHelp" placeholder="Bairro da Ocorrencia" value="${cidadao.bairroOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="municipioOcorriencia ">Cidade</label>
										<input type="text" class="form-control" id="cidadeOcorriencia" name="cidadeOcorriencia" aria-describedby="cidadeOcorrienciaHelp" placeholder="Cidade da Ocorrencia" value="${cidadao.cidadeOcorrencia}">
									</div>
									<div class="form-group col-md-2">
										<label for="usuario">Ponto de Referencia</label>
										<input type="text" class="form-control" id="referenciaOcorrecia" name="referenciaOcorrecia" aria-describedby="usuarioHelp" placeholder="Informe um Ponto de Referencia" value="${cidadao.referenciaOcorrencia}">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="delegado">Delegado</label>
										<input type="text" class="form-control" id="delegado" name="delegado" maxlength="10" aria-describedby="delegadoHelp" placeholder="Informe Nome do(a) Delegado(a)">
									</div>
									<div class="form-group col-md-4">
										<label for="escrivao">Escrivão</label>
										<input type="text" class="form-control" id="escrivao" name="escrivao" maxlength="10" aria-describedby="escrivaoHelp" placeholder="Informe Nome do(a) Escrivã(o)">
									</div>
									<div class="form-group col-md-4">
										<label for="autoridadeMilitar">Autoridade Militar</label>
										<input type="text" class="form-control" id="autoridadeMilitar" name="autoridadeMilitar" maxlength="10" aria-describedby="autoridadeMilitarHelp" placeholder="Informe a Autoridade Militar">
									</div>
								
								</div>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="ordenamentoJuridico">Ordenamendo Juridico</label>
										<select id="ordenamentoJuridico" name="ordenamentoJuridico" class="form-control">
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
										<label for="art">Artigo</label>
										<input type="number" class="form-control" id="artOcorriencia" name="artOcorriencia" aria-describedby="artOcorrienciaHelp" placeholder="Informe o Artigo">
									</div>
									<div class="form-group col-md-2">
										<label for="alinea">Paragrafo/Inciso/Alínea</label>
										<input type="text" class="form-control" id="alineaOcorriencia" name="alineaOcorriencia" maxlength="10" aria-describedby="alineaOcorrienciaHelp" placeholder="Informe a Alínea">
									</div>
									<div class="form-group col-md-2">
										<label for="adicionarProcesso">Clique para Adicionar os Artigos</label><br>
										<button type="button" id="adicionarProcesso" class="btn btn-dark" onclick="adicionarProcesso()">Adicionar</button>
									</div>
								</div>
								<div class="form-row">
								<div class="form-group col-md-12">
									<fieldset>
										<legend>Ordenamento Juridico/Artigos/Inciso/Alinea</legend>
										<label for="artigos"></label> Informe de acordo com o exemplo abaixo: 
										<br>
										<textarea class="form-control" cols=60 id="artigos" name="artigos" rows="7" name="artigos" maxlength="500" wrap="hard" placeholder="Codigo Penal Artigo 121 Inciso I">${cidadao.historicoJuridico}</textarea>
									</fieldset>
								</div>
								</div>
	
							</div>
						</li>
						<li>
							<input type="radio" id="tab3" class="rd_tab" name="tabs">
							<label for="tab3" class="tab_label">Materiais</label>
	
							<div class="tab-content">
									<h4>Armas</h4>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="tipoArma" >Descrição da Arma</label>
											<select id="tipoArma" name="tipoArma" class="form-control">
												<option>Revolver</option>
												<option>Pistola</option>
												<option>Espigarda</option>
												<option>Fuzil</option>
												<option>Metralhadora</option>
												<option>Artesanal</option>
												<option>Faca</option>
										</select>
										</div>
										<div class="form-group col-md-2">
											<label for="calibre">Calibre</label>
											<input type="text" class="form-control" id="calibre" name="calibre" aria-describedby="calibreHelp" placeholder="Calibre" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="quantidade">Quantidade em UN</label>
											<input type="text" class="form-control" id="quantidade" name="quantidade" aria-describedby="quantidadeHelp" placeholder="Quantidade" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="fabricante">Fabricante</label>
											<input type="text" class="form-control" id="fabricante" name="fabricante" aria-describedby="fabricanteHelp" placeholder="Fabricante" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarArma">Clique para Adicionar a Arma</label><br>
										<button type="button" id="adicionarArma" class="btn btn-dark" onclick="adicionarArma()">Adicionar</button>
										</div>
									</div>
									<div class="form-group col-md-12">
									
										<textarea class="form-control" cols=60 id="materiaisArma" name="materiaisArma" rows="2" maxlength="500" wrap="hard" placeholder="Arma, Calibre, Quantidade, Fabricante">${cidadao.historicoJuridico}</textarea>
								
									</div>
									<h4>Entorpecentes</h4>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="tipoEntorpecente">Descrição do Entorpecentes</label>
											<select id="tipoEntorpecente" name="tipoEntorpecente" class="form-control">
												<option>Maconha</option>
												<option>Cocaína</option>
												<option>Crack</option>
												<option>Oxi</option>
												<option>Êxtase</option>
										</select>
										</div>
										<div class="form-group col-md-2">
											<label for="quantidadeEntorpecente">Quantidade em KG</label>
											<input type="text" class="form-control" id="quantidadeEntorpecente" name="quantidadeEntorpecente" aria-describedby="quantidadeEntorpecenteHelp" placeholder="Quantidade de Entorpecente" value="${cidadao.tatuPescoco}">
										</div>
										<div class="form-group col-md-2">
											<label for="adicionarEntorpecentes">Clique para Adicionar</label><br>
										<button type="button" id="adicionarEntorpecentes" class="btn btn-dark" onclick="adicionarEntorpecentes()">Adicionar</button>
										</div>
									</div>
									<div class="form-group col-md-12">
									
										<textarea class="form-control" cols=60 id="materiaisEntorpecentes" name="materiaisEntorpecentes" rows="2" maxlength="500" wrap="hard" placeholder="Entorpecentes, Quantidade,">${cidadao.historicoJuridico}</textarea>
								
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
										<label for="fotoFrente">Adicionar Fotos Diversas</label> 
										<input type="file" id="fotoFrente" name="fotoFrente" accept="image/jpeg, image/jpg">
	
										<div class="fotos">
											<img alt="fotoFrente" id="fotoDeFrente" src="<c:if test='${cidadao.fotoFrente == null}'> ../img/camera-p.png  </c:if>
																						 <c:if test='${cidadao.fotoFrente != null}'> ${cidadao.fotoFrente} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoLado">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoLado" name="fotoLado" accept="image/jpeg,image/jpg" value="${cidadao.fotoLado}">
	
										<div class="fotos">
											<img alt="fotoLado" id="fotoDeLado" name="fotoDeLado" src="<c:if test='${cidadao.fotoLado == null}'> ../img/camera-p.png  </c:if>
																						 			   <c:if test='${cidadao.fotoLado != null}'> ${cidadao.fotoLado} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoCostas">Adicionar Foto de Costa</label>
										<input type="file" id="fotoCostas" name="fotoCostas" accept="image/jpeg,image/jpg" value="${cidadao.fotoCostas}">
		
										<div class="fotos">
											<img alt="fotoCostas" id="fotoDeCostas" name="fotoDeCostas" src="<c:if test='${cidadao.fotoCostas == null}'> ../img/camera-p.png  </c:if>
																						 			  	     <c:if test='${cidadao.fotoCostas != null}'> ${cidadao.fotoCostas} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas01">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas01" name="fotoDiversas01" accept="image/jpeg,image/jpg" value="${cidadao.fotoDiversas01}">
	
										<div class="fotos">
											<img alt="fotoDiversas01" id="fotoDeDiversas01" name="fotoDeDiversas01" src="<c:if test='${cidadao.fotoDiversas01 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${cidadao.fotoDiversas01 != null}'> ${cidadao.fotoDiversas01} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas02">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas02" name="fotoDiversas02" accept="image/jpeg,.jpg" value="${cidadao.fotoDiversas02}">
	
										<div class="fotos">
											<img alt="fotoDiversas02" id="fotoDeDiversas02" name="fotoDeDiversas02" src="<c:if test='${cidadao.fotoDiversas02 == null}'> ../img/camera-p.png </c:if>
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
										<label for="historioOcorrencia"></label> Informe com detalhes um breve historico sobre a ocorrência: 
										<br>
										<textarea class="form-control" cols=60 id="historioOcorrencia" name="historioOcorrencia" rows="15" name="historioOcorrencia" maxlength="500" wrap="hard" placeholder="envolvidos, data, hora, endereço, mike da ocorrência, artigos...">${cidadao.historico}</textarea>
									</fieldset>
	
								</div>
								<button type="button" id="btnSalvar" name="btnSalvar" class="btn btn-primary btn-lg" onclick="acaoBotaoCidadao('${acaoBtnSalvar}')">Salvar</button>
							
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

											<button type="button" id="btnConsultar" name="btnConsultar" class="btn btn-primary btn-sm" onclick="acaoBotaoCidadao('consultar')">Consultar</button>
											<button type="button" id="btnLimpar" name="btnLimpar" class="btn btn-secondary btn-sm" onclick="acaoBotaoCidadao('limpar')">Limpar</button>
										
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
	
</body>
 <!-- Adicionando Javascript -->
<script type="text/javascript">
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
	
	function addArtigo() {
		var lei,artigo,paragrafo,tipificacao;
		lei = document.getElementById('lei').value;
		artigo = document.getElementById('artOcorriencia').value;
		paragrafo = document.getElementById('alineaOcorriencia').value;
		
		if(artigo == ""){
			alert("Por favor informe o Artigo da Lei :" + lei);
		}else{
			tipificacao = lei +" Artigo: " + artigo + "º " + " Paragrafo/Inciso/Alínea: " + paragrafo + ";" ;
			document.getElementById('artigos').value=document.getElementById('artigos').value + tipificacao + "\n";
		}
		
		
		
	}
	
	function acaoBotaoCidadao(acao){
		if(acao == null || acao == ""){
			document.getElementById('frm-cadCidadao').action = "Cidadao?acao=" + 'salvar';
			document.getElementById('frm-cadCidadao').submit();
		}else{
			
			document.getElementById('frm-cadCidadao').action = "Cidadao?acao=" + acao;
			document.getElementById('frm-cadCidadao').submit();
		}
		
	}

//MOSTRAR IMAGEM AO SELECIONAR NO TYPE="FILE"   ---------------------------------------------------------------------------------------------------------------------------------
	function frenteFoto() {
		  
		  if (this.files && this.files[0]) {
		    
		    var FR= new FileReader();
		    
		    FR.addEventListener("load", function(e) {
		      document.getElementById("fotoDeFrente").src = e.target.result;
		    
		    }); 
		    
		    FR.readAsDataURL( this.files[0] );
		  }
		  
		}

		document.getElementById("fotoFrente").addEventListener("change", frenteFoto);
		
		function ladoFoto() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDeLado").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoLado").addEventListener("change", ladoFoto);
		
		function costasFoto() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDeCostas").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoCostas").addEventListener("change", costasFoto);
		
		function diversoFoto01() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDeDiversas01").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas01").addEventListener("change", diversoFoto01);
		
		function diversoFoto02() {
			  
			  if (this.files && this.files[0]) {
			    
			    var FR= new FileReader();
			    
			    FR.addEventListener("load", function(e) {
			      document.getElementById("fotoDeDiversas02").src = e.target.result;
			    
			    }); 
			    
			    FR.readAsDataURL( this.files[0] );
			  }
			  
			}
		document.getElementById("fotoDiversas02").addEventListener("change", diversoFoto02);
</script>
<script type="text/javascript">
	jQuery.noConflict();
	jQuery(function($){
		$("#telefone").mask("99-99999-9999");
		$("#cpf").mask("999.999.999-99");
	});
</script>
</html>