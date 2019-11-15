<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<c:set var="context" value="${pageContext.request.contextPath}" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="${context}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${context}/css/estilo-principal.css">
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery.maskedinput.min.js"></script>
		<title>CIA 1.0 - Cadastro de Cidad�o</title>
	</head>
<body>
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
				<li class="li-menu-btn-close"><button class="menu-btn-close"><img src="${context}/img/menu-btn-close.png"></button></li>
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="cadastroUsuarios.jsp">Usu�rios</a></li>
							<li><a class="link-item" href="cadastroCidadao.jsp">Cidad�o</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorr�ncia</a></li>
							<li><a class="link-item" href="#">Viatura</a></li>
							<li><a class="link-item" href="#">Fac��es</a></li>
						</ul>
				</li>
				<li><a href="#">Consultas</a></li>
				<li><a href="#">Consultas</a></li>
				<li><a href="#">Controle</a></li>
				<li><a href="#">Relatorios</a></li>
				<li><a href="/cia-1.0/login.jsp">Sair</a></li>
			
			</ul>
		</nav>
		<button class="img-menu" ><img src="${context}/img/menu-mobile.png"></button>
	</header>
	<aside id="box-left">
		<nav id="menu-nav-left">
			<ul>
	
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do
						Cidad�o</a></li>
				<li><a href="/cia-1.0/pages/cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorr�ncia</a></li>
				<li><a href="#">Escalas de Servi�os</a></li>
				<li><a href="#">Controle de Viaturas</a></li>
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
			<h3 class="titulo-cadastro">Cadastro de Cidad�o</h3>
				<form action="Cidadao" method="post" id="frm-cadCidadao" name="frm-cadCidadao" enctype="multipart/form-data">
					<ul>
						<li>
							<input type="radio" id="tab1" class="rd_tab" name="tabs" checked>
							<label for="tab1" class="tab_label">Geral</label>
								<div class="tab-content">
									<br>
		
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="codigo">Codigo</label>
											<input type="text" class="form-control" id="codigo" name="codigo" maxlength="10" aria-describedby="codigoHelp" placeholder="Automatico" readonly="readonly" value="${cidadao.codigo}">
										</div>
										<div class="form-group col-md-4">
											<label for="nome">Nome</label>
											<input type="text" class="form-control" id="nome" name="nome" maxlength="30" aria-describedby="nomeHelp" placeholder="Nome Completo" required="required" autofocus="autofocus" value="${cidadao.nome}">
										</div>
										<div class="form-group col-md-4">
											<label for="alcunha">Alcunha</label>
											<input type="text" class="form-control" id="alcunha" name="alcunha" maxlength="20" aria-describedby="alcunhaHelp" placeholder="Apelido" value="${cidadao.alcunha}">
										</div>
										<div class="form-group col-md-2">
											<label for="nascimento">Nascimento</label>
											<input type="date" class="form-control" id="nascimento" name="nascimento" aria-describedby="nascimentoHelp"  value="${cidadao.nascimento}" >
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="telefone">Telefone</label>
											<input type="text" maxlength="15" class="form-control" id="telefone" name="telefone" aria-describedby="telefoneHelp" placeholder="Telefone"  value="${cidadao.telefone}">
										</div>
										<div class="form-group col-md-4">
											<label for="rg">RG</label>
											<input type="number" class="form-control" id="rg" name="rg" maxlength="20" aria-describedby="rgHelp" placeholder="Registro de Identifica��o"  value="${cidadao.rg}">
										</div>
										<div class="form-group col-md-2">
											<label for="orgaoEmissor">Org�o Emissor</label>
											<input type="text" class="form-control" id="orgaoEmissor" name="orgaoEmissor"  maxlength="5" aria-describedby="orgaoEmissorHelp" placeholder="Org�o Emissor"  value="${cidadao.orgaoEmissor}">
										</div>
										<div class="form-group col-md-2">
											<label for="ufRg">UF</label>
											<input type="text" class="form-control" id="ufRg" name="ufRg" maxlength="2" aria-describedby="ufRgHelp" placeholder="UF" value="${cidadao.uf}">
										</div>
										<div class="form-group col-md-2">
											<label for="cpf">CPF</label>
											<input type="text" class="form-control" id="cpf" name="cpf" maxlength="11" aria-describedby="cpfHelp" placeholder="CPF" value="${cidadao.cpf}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="mae">M�e</label>
											<input type="text" class="form-control" id="mae" name="mae" maxlength="30"aria-describedby="maeHelp" placeholder="Nome da M�e" value="${cidadao.mae}">
										</div>
										<div class="form-group col-md-6">
											<label for="pai">Pai</label>
											<input type="text" class="form-control" id="pai" name="pai" maxlength="30" aria-describedby="paiHelp" placeholder="Nome do Pai" value="${cidadao.pai}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="cep">CEP</label>
											<small><a href="http://www.buscacep.correios.com.br/sistemas/buscacep/buscaCep.cfm" target="_blank"> n�o sei !!!</a></small>
											<input type="text" class="form-control" id="cep" name="cep" size="10" aria-describedby="cepHelp" placeholder="CEP" maxlength="9" onblur="pesquisacep(this.value);" value="${cidadao.cep}">
										</div>
										<div class="form-group col-md-8">
											<label for="rua">Endere�o</label>
											<input type="text" class="form-control" id="rua" name="rua" maxlength="30" aria-describedby="enderecoHelp" placeholder="Rua,TV,AV..." value="${cidadao.endereco}">
										</div>
										<div class="form-group col-md-2">
											<label for="numero">Numero:</label>
											<input type="number" class="form-control" id="numero" name="numero" maxlength="5" aria-describedby="numerocoHelp" placeholder="Numero" value="${cidadao.numero}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="complemento">Complemento</label>
											<input type="text" class="form-control" id="complemento" name="complemento" maxlength="30" aria-describedby="complementoHelp" placeholder="Complemento"  value="${cidadao.complemento}">
										</div>
										<div class="form-group col-md-2">
											<label for="bairro">Bairro</label>
											<input type="text" class="form-control" id="bairro" name="bairro" maxlength="50" aria-describedby="bairroHelp" placeholder="Bairro"  value="${cidadao.bairro}">
										</div>
										<div class="form-group col-md-2">
											<label for="cidade">Cidade</label>
											<input type="text" class="form-control" id="cidade" name="cidade" maxlength="30" aria-describedby="cidadeHelp" placeholder="Cidade"  value="${cidadao.cidade}">
										</div>
										<div class="form-group col-md-2">
											<label for="uf">UF</label>
											<input type="text" class="form-control" id="uf" name="uf" maxlength="2" aria-describedby="ufHelp" placeholder="UF"  value="${cidadao.ufEndereco}">
										</div>
										<div class="form-group col-md-2">
											<label for="pais">Pais</label>
											<input type="text" class="form-control" id="pais" name="pais" maxlength="20"aria-describedby="paisHelp" placeholder="Pais"  value="${cidadao.pais}">
										</div>
										
									</div>
									
		
		
								</div>
						</li>
						<li>
							<input type="radio" id="tab2" class="rd_tab" name="tabs">
							<label for="tab2" class="tab_label">Ficha Criminal</label>
							<div class="tab-content">
								<br>
								<div class="form-row">
									<div class="form-group col-md-2">
										<label for="dataInfracao">Data da Utima Infra��o</label>
										<input type="date" class="form-control" id="dataInfracao" name="dataInfracao" aria-describedby="dataInfracaoHelp"  value="${cidadao.dataUtimaInfracao}">
									</div>
									<div class="form-group col-md-2">
										<label for="delegacia">Delegacia</label>
										<select id="delegacia" name="delegacia" class="form-control" aria-describedby="delegaciaHelp" >
											
											<c:if test="${cidadao.delegacia == ''}"><option value="">Selecionar Delegacia</option></c:if>
											<c:if test="${cidadao.delegacia != ''}">${cidadao.delegacia}</c:if>
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
										<label for="faccao">Fac��o Criminosa</label>
										<select id="faccao" name="faccao" class="form-control">
										
											<c:if test="${cidadao.faccao == ''}"><option value="">Selecionar Fac��o</option></c:if>
											<c:if test="${cidadao.faccao != ''}">${cidadao.faccao}</c:if>
											<option>Comando Vermelho (CV)</option>
											<option>Guardi�es do Estado (GDE)</option>
											<option>Primeiro Comando da Capital (PCC)</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="enderecoO">Endere�o da Ocorr�ncia</label>
										<input type="text" class="form-control" id="enderecoO" name="enderecoO" aria-describedby="enderecoOHelp" placeholder="Endere�o da Ocorr�ncia" value="${cidadao.endOcorrencia}">
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
										<label for="faccao">Ordenamendo Juridico</label>
										<select id="lei" name="lei" class="form-control">
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
										<label for="art">Artigo</label>
										<input type="number" class="form-control" id="artOcorriencia" name="artOcorriencia" aria-describedby="artOcorrienciaHelp" placeholder="Informe o Artigo">
									</div>
									<div class="form-group col-md-2">
										<label for="alinea">Paragrafo/Inciso/Al�nea</label>
										<input type="text" class="form-control" id="alineaOcorriencia" name="alineaOcorriencia" maxlength="10" aria-describedby="alineaOcorrienciaHelp" placeholder="Informe a Al�nea">
									</div>
									<div class="form-group col-md-2">
										<label for="add">Clique para Adicionar os Artigos</label><br>
										<button type="button" id="add" class="btn btn-dark" onclick="addArtigo()">Adicionar</button>
									</div>
								</div>
								<div class="form-group">
									<fieldset>
										<legend>Ordenamento Juridico/Artigos/Inciso/Alinea</legend>
										<label for="artigos"></label> Informe de acordo com o exemplo abaixo: 
										<br>
										<textarea class="form-control" cols=60 id="artigos" name="artigos" rows="10" name="artigos" maxlength="500" wrap="hard" placeholder="Codigo Penal Artigo 121 Inciso I">${cidadao.historicoJuridico}</textarea>
									</fieldset>
	
								</div>
	
							</div>
						</li>
						<li>
							<input type="radio" id="tab3" class="rd_tab" name="tabs">
							<label for="tab3" class="tab_label">Tatuagens</label>
	
							<div class="tab-content">
								
								<div id="localTatuagens">
								</div>
								<div id="box-cadastroTatu">
								<fieldset>
											<legend>Descrever Tatuagens:</legend>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="rosto" >Rosto</label>
											<input type="text"	class="form-control" id="rosto" name="rosto" aria-describedby="rostoHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuRosto}">
										</div>
										<div class="form-group col-md-6">
											<label for="pescoco">Pesco�o</label>
											<input type="text" class="form-control" id="pescoco" name="pescoco" aria-describedby="pescocoHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuPescoco}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-12">
											<label for="torax">Torax(Peito Direito,Esquerdo e Barriga)</label>
											<input type="text" class="form-control" id="torax" name="torax" aria-describedby="toraxHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuTorax}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="bracoDireito" >Bra�o(Obro at� as M�os) Direito</label>
											<input type="text"	class="form-control" id="bracoDireito" name="bracoDireito" aria-describedby="bracoDireitoHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuBracoDireito}">
										</div>
										<div class="form-group col-md-6">
											<label for="bracoEsquerdo">Bra�o(Obro at� as M�os) Equerdo</label>
											<input type="text" class="form-control" id="bracoEsquerdo" name="bracoEsquerdo" aria-describedby="bracoEsquerdoHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuBracoEsquerdo}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="pernaDireita" >Perna(Coxa at� os Pes) Direita</label>
											<input type="text"	class="form-control" id="pernaDireita" name="pernaDireita" aria-describedby="pernaDireitaHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuPernaDireita}">
										</div>
										<div class="form-group col-md-6">
											<label for="pernaEsquerda">Perna(Coxa at� os Pes) Esquerda</label>
											<input type="text" class="form-control" id="pernaEsquerda" name="pernaEsquerda"  aria-describedby="pernaEsquerdaHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuPernaEsquerda}">
										</div>
									</div>	
									<div class="form-row">
										<div class="form-group col-md-12">
											<label for="torax">Costas(Toda Regi�o)</label>
											<input type="text" class="form-control" id="costas" name="costas" aria-describedby="toraxHelp" placeholder="Descreva a Tatuagem" value="${cidadao.tatuCostas}">
										</div>
									</div>
								</fieldset>	
								</div>
							</div>
						</li>
						<li>
							<input type="radio" id="tab4" class="rd_tab" name="tabs" >
							<label for="tab4" class="tab_label">Fotos</label>
	
							<div class="tab-content">
								<figure class="fotos-cidadao">
	
									<div class="container-foto">
										<label for="fotoFrente">Adicionar Foto de Frente</label> 
										<input type="file" id="fotoFrente" name="fotoFrente" accept="image/jpeg, image/jpg">
	
										<div class="fotos">
											<img alt="fotoFrente" id="fotoDeFrente" src="<c:if test='${cidadao.fotoFrente == null}'> ../img/foto-frente.jpg </c:if>
																						 <c:if test='${cidadao.fotoFrente != null}'> ${cidadao.fotoFrente} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoLado">Adicionar Foto de Lado</label>
										<input type="file" id="fotoLado" name="fotoLado" accept="image/jpeg,image/jpg" value="${cidadao.fotoLado}">
	
										<div class="fotos">
											<img alt="fotoLado" id="fotoDeLado" name="fotoDeLado" src="<c:if test='${cidadao.fotoLado == null}'> ../img/foto-lado.jpg </c:if>
																						 			   <c:if test='${cidadao.fotoLado != null}'> ${cidadao.fotoLado} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoCostas">Adicionar Foto de Costa</label>
										<input type="file" id="fotoCostas" name="fotoCostas" accept="image/jpeg,image/jpg" value="${cidadao.fotoCostas}">
		
										<div class="fotos">
											<img alt="fotoCostas" id="fotoDeCostas" name="fotoDeCostas" src="<c:if test='${cidadao.fotoCostas == null}'> ../img/foto-costa.jpg </c:if>
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
										<label for="historioOcorrencia"></label> Informe com detalhes um breve historico sobre a ocorr�ncia: 
										<br>
										<textarea class="form-control" cols=60 id="historioOcorrencia" name="historioOcorrencia" rows="15" name="historioOcorrencia" maxlength="500" wrap="hard" placeholder="envolvidos, data, hora, endere�o, mike da ocorr�ncia, artigos...">${cidadao.historico}</textarea>
									</fieldset>
	
								</div>
								<button type="button" id="btnSalvar" name="btnSalvar" class="btn btn-primary btn-lg" onclick="acaoBotaoCidadao('${acaoBtnSalvar}')">Salvar</button>
							
							</div>
						</li>
					<li>
					 <div  class="aba-consulta">
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
														<td scope="col"><strong>M�e</strong></td>
														<td scope="col"><strong>Nascimento</strong></td>
														<td scope="col"><strong>Bairro</strong></td>
														<td scope="col"><strong>A��o</strong></td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${consultaTotal}" var="lista">
														<tr>
															<td scope="row"><c:out value="${lista.codigo}"></c:out></td>
															<td><c:out value="${lista.nome}"></c:out></td>
															<td><c:out value="${lista.mae}"></c:out></td>
															<fmt:parseDate value="${lista.nascimento}" pattern="yyyy-MM-dd" var="myDate"/>
															<td><fmt:formatDate pattern="dd-MM-yyyy" value="${myDate}"/></td>
															<td><c:out value="${lista.bairro}"></c:out></td>
															<td><a href="Cidadao?acao=editar&codigo=${lista.codigo}" class="btn btn-secondary btn-sm">Editar</a>
																<a href="Cidadao?acao=excluir&codigo=${lista.codigo}" onclick="return confirm('Confirmar Exclus�o');" class="btn btn-danger btn-sm">Excluir</a>
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
													<label for="maeCidadaoConsulta">M�e:</label>
													<input type="text" class="form-control" id="maeCidadaoConsulta" aria-describedby="maeCidadaoConsultaHelp" placeholder="Nome da M�e do Cidad�o" name="maeCidadaoConsulta">
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
													<label for="atuacaoConsulta">Area de Atua��o:</label> <input
														type="text" class="form-control" id="atuacaoConsulta"
														aria-describedby="atuacaoConsultaHelp"
														placeholder="Bairro da Area de Atua��o do tan:"
														name="atuacaoConsulta">
												</div>


											</div>

											<button type="button" id="btnConsultar" name="btnConsultar" class="btn btn-primary btn-sm" onclick="acaoBotaoCidadao('consultar')">Consultar</button>
											<button type="button" id="btnLimpar" name="btnLimpar" class="btn btn-secondary btn-sm" onclick="acaoBotaoCidadao('limpar')">Limpar</button>
										
										</fieldset>
								
								</article>

							</section>
						</div>
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
	
</body>
 <!-- Adicionando Javascript -->
<script type="text/javascript">
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
	
	function addArtigo() {
		var lei,artigo,paragrafo,tipificacao;
		lei = document.getElementById('lei').value;
		artigo = document.getElementById('artOcorriencia').value;
		paragrafo = document.getElementById('alineaOcorriencia').value;
		
		if(artigo == ""){
			alert("Por favor informe o Artigo da Lei :" + lei);
		}else{
			tipificacao = lei +" Artigo: " + artigo + "� " + " Paragrafo/Inciso/Al�nea: " + paragrafo + ";" ;
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
		
		
		$(".img-menu").click(function(){
			$("#menu-drop").show();
		});

		$(".menu-btn-close").click(function(){
			$("#menu-drop").hide();
		});

</script>
<script type="text/javascript">
	jQuery.noConflict();
	jQuery(function($){
		$("#telefone").mask("99-99999-9999");
		$("#cpf").mask("999.999.999-99");
	});
</script>
</html>