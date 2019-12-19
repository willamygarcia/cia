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
		<title>CIA 1.0 - Cadastro de Militares</title>
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
				<li class="li-menu-btn-close"><button class="menu-btn-close"><img src="${context}/img/menu-btn-close.png"></button></li>
				<li><a href="#">Cadastros</a>
						<ul>
							<li><a class="link-item" href="cadastroUsuarios.jsp">Usuários</a></li>
							<li><a class="link-item" href="cadastroMilitar.jsp">Militares</a></li>
							<li><a class="link-item" href="cadastroCidadao.jsp">Cidadão</a></li>
							<li><a class="link-item" href="/cia-1.0/pages/cadastroOcorrencia.jsp">Ocorrência</a></li>
							<li><a class="link-item" href="#">Viatura</a></li>
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
				<li><a href="#">Relatórios</a></li>
				<li><a href="#">Controle</a></li>
				<li><a href="#">Configurações</a></li>
				<li><a href="/cia-1.0/login.jsp">Sair</a></li>
			
			</ul>
		</nav>
		<button class="img-menu" ><img src="${context}/img/menu-mobile.png"></button>
	</header>
<aside id="box-left">
		<nav id="menu-nav-left">
			<ul>
	
				<li class="active"><a href="/cia-1.0/pages/cadastroCidadao.jsp">Cadastro do Cidadão</a></li>
				<li><a href="/cia-1.0/pages/cadastroUsuarios.jsp">Cadastro de Usuarios</a></li>
				<li><a href="/cia-1.0/pages/cadastroOcorrencia.jsp">Cadastro de Ocorrência</a></li>
				<li><a href="#">Escalas de Serviços</a></li>
				<li><a href="/cia-1.0/pages/controleViaturas.jsp">Controle de Viaturas</a></li>
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
			<h3 class="titulo-cadastro">Cadastro de Militares</h3>
				<form action="Militar" method="post" id="frm-cadMilitar" name="frm-cadMilitar" enctype="multipart/form-data">
					<ul>
						<li>
							<input type="radio" id="tab1" class="rd_tab" name="tabs" checked>
							<label for="tab1" class="tab_label">Geral</label>
								<div class="tab-content">
									<br>
		
									<div class="form-row">
										<div class="form-group col-md-1">
											<label for="codigo">Codigo</label>
											<input type="text" class="form-control" id="codigo" name="codigo" maxlength="10" aria-describedby="codigoHelp" placeholder="Automatico" readonly="readonly" value="${militar.codigo}">
										</div>
										<div class="form-group col-md-4">
											<label for="nome">Nome</label>
											<input type="text" class="form-control" id="nome" name="nome" maxlength="30" aria-describedby="nomeHelp" placeholder="Nome Completo do Militar" required="required" autofocus="autofocus" value="${militar.nome}">
										</div>
										<div class="form-group col-md-4">
											<label for="mae">Mãe</label>
											<input type="text" class="form-control" id="mae" name="mae" maxlength="30" placeholder="Informe o nome da Mãe do Militar" value="${militar.alcunha}">
										</div>
										<div class="form-group col-md-3">
											<label for="pai">Pai</label>
											<input type="text" class="form-control" id="pai" name="pai" maxlength="30" placeholder="Informe o nome do Pai do Militar" value="${militar.nascimento}" >
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="patente">Graduação/Posto</label>
											<select id="patente" name="patente" class="form-control">
												
												<c:if test="${militar.graduacaoOcorrencia == ''}"><option value="">Selecionar</option></c:if>
												<c:if test="${militar.graduacaoOcorrencia != ''}">${miltiar.graduacaoOcorrencia}</c:if>										
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
											<label for="nomeGuera">Nome de Guerra</label>
											<input type="text" class="form-control" id="nomeGuerra" name="nomeGuerra" placeholder="Nome Guerra do Militar"  value="${militar.nomeGuerra}">
										</div>
										<div class="form-group col-md-2">
											<label for="numeralMiltiar">Numeral do Militar</label>
											<input type="text" class="form-control" id="numeralMiltiar" name="numeralMiltiar" placeholder="Informe o Numeral do Militar"  value="${militar.numeralMiltar}">
										</div>
										<div class="form-group col-md-2">
											<label for="matriculaMilitar">Matricula</label>
											<input type="text" class="form-control" id="matriculaMilitar" name="matriculaMilitar" placeholder="Matricula do Militar" value="${militar.uf}">
										</div>
										<div class="form-group col-md-2">
											<label for="nascimentoMilitar">Nascimento</label>
											<input type="date" class="form-control" id="nascimentoMilitar" name="nascimentoMilitar" value="${militar.cpf}">
										</div>
										<div class="form-group col-md-2">
											<label for="cpfMilitar">CPF</label>
											<input type="text" class="form-control" id="cpfMilitar" name="cpfMilitar" value="${militar.cpf}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-3">
											<label for="rgMilitar">RG</label>
											<input type="text" class="form-control" id="rgMilitar" name="rgMilitar" placeholder="RG do Militar" value="${militar.rg}">
										</div>
										<div class="form-group col-md-1">
											<label for="emissorRG">Emissor da RG</label>
											<input type="text" class="form-control" id="emissorRG" name="emissorRG" placeholder="Emissor" value="${militar.emissorRgMilitar}">
										</div>
										<div class="form-group col-md-2">
											<label for="ctps">CTPS</label>
											<input type="text" class="form-control" id="ctps" name="ctps" placeholder="Carteira de Trabalho" value="${militar.ctpsMilitar}">
										</div>
										<div class="form-group col-md-2">
											<label for="pisPasep">PIS/PASEP</label>
											<input type="text" class="form-control" id="pisPasep" name="pisPasep" placeholder="Numero do Pis/Pasep" value="${militar.psiPasep}">
										</div>
										<div class="form-group col-md-2">
											<label for="titulo">Titulo</label>
											<input type="text" class="form-control" id="titulo" name="titulo" placeholder="Titulo Eleitoral" value="${militar.titulo}">
										</div>
										<div class="form-group col-md-1">
											<label for="zona">Zona</label>
											<input type="text" class="form-control" id="zona" name="zona" placeholder="Zona Eleitoral" value="${militar.zona}">
										</div>
										<div class="form-group col-md-1">
											<label for="secao">Seção</label>
											<input type="text" class="form-control" id="secao" name="secao" placeholder="Seção Eleitoral" value="${militar.secao}">
										</div>
										
									</div>
									<div class="form-row">
										<div class="form-group col-md-2">
											<label for="cep">CEP</label>
											<small><a href="http://www.buscacep.correios.com.br/sistemas/buscacep/buscaCep.cfm" target="_blank"> não sei !!!</a></small>
											<input type="text" class="form-control" id="cep" name="cep" size="10" aria-describedby="cepHelp" placeholder="CEP" maxlength="9" onblur="pesquisacep(this.value);" value="${militar.cep}">
										</div>
										<div class="form-group col-md-8">
											<label for="rua">Endereço</label>
											<input type="text" class="form-control" id="rua" name="rua" maxlength="30" aria-describedby="enderecoHelp" placeholder="Rua,TV,AV..." value="${militar.endereco}">
										</div>
										<div class="form-group col-md-2">
											<label for="numero">Numero:</label>
											<input type="number" class="form-control" id="numero" name="numero" maxlength="5" aria-describedby="numerocoHelp" placeholder="Numero" value="${militar.numero}">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-4">
											<label for="complemento">Complemento</label>
											<input type="text" class="form-control" id="complemento" name="complemento" maxlength="30" aria-describedby="complementoHelp" placeholder="Complemento"  value="${militar.complemento}">
										</div>
										<div class="form-group col-md-2">
											<label for="bairro">Bairro</label>
											<input type="text" class="form-control" id="bairro" name="bairro" maxlength="50" aria-describedby="bairroHelp" placeholder="Bairro"  value="${militar.bairro}">
										</div>
										<div class="form-group col-md-2">
											<label for="cidade">Cidade</label>
											<input type="text" class="form-control" id="cidade" name="cidade" maxlength="30" aria-describedby="cidadeHelp" placeholder="Cidade"  value="${militar.cidade}">
										</div>
										<div class="form-group col-md-2">
											<label for="uf">UF</label>
											<input type="text" class="form-control" id="uf" name="uf" maxlength="2" aria-describedby="ufHelp" placeholder="UF"  value="${militar.ufEndereco}">
										</div>
										<div class="form-group col-md-2">
											<label for="pais">Pais</label>
											<input type="text" class="form-control" id="pais" name="pais" maxlength="20"aria-describedby="paisHelp" placeholder="Pais"  value="${militar.pais}">
										</div>
										
									</div>
									
		
		
								</div>
						</li>
						<li>
							<input type="radio" id="tab2" class="rd_tab" name="tabs">
							<label for="tab2" class="tab_label">Complementares</label>
							<div class="tab-content">
								<br>
								<div class="form-row">
									<div class="form-group col-md-2">
										<label for="dataIngresso">Data de Ingresso</label>
										<input type="date" class="form-control" id="dataIngresso" name="dataIngresso" value="${militar.dataIngresso}">
									</div>
									<div class="form-group col-md-2">
										<label for="batalhao">Batalhão</label>
										<select id="batalhao" name="batalhao" class="form-control">
											
											<c:if test="${militar.batalhao == ''}"><option value="">Selecionar Batalhão</option></c:if>
											<c:if test="${militar.batalhao != ''}">${militar.batalhao}</c:if>
											<option>1º BPM</option>
											<option>2º BPM</option>
											<option>3º BPM</option>
											<option>4º BPM</option>
											<option>5º BPM</option>
											<option>6º BPM</option>
											<option>7º BPM</option>
											<option>8º BPM</option>
											<option>9º BPM</option>
											<option>10º BPM</option>
											<option>11º BPM</option>
											<option>12º BPM</option>
											<option>13º BPM</option>
											<option>14º BPM</option>
											<option>15º BPM</option>
											<option>16º BPM</option>
											<option>17º BPM</option>
											<option>18º BPM</option>
											<option>19º BPM</option>
											<option>20º BPM</option>
											<option>21º BPM</option>
											<option>22º BPM</option>
																						
										</select>
									</div>
									<div class="form-group col-md-1">
										<label for="cia">CIA</label>
										<input type="text" class="form-control" id="cia" name="cia" placeholder="CIA">
									</div>
									<div class="form-group col-md-2">
										<label for="reservista">Nº Reservista</label>
										<input type="text" class="form-control" id="reservista" name="reservista" placeholder="Nº Reservista">
									</div>
									<div class="form-group col-md-2">
										<label for="escolaridade">Escolaridade</label>
										<select class="form-control" id="escolaridade" name="escolaridade">
											<option>Ensino Médio</option>
											<option>Ensino Superior Incompleto</option>
											<option>Ensino Superior Completo</option>
											<option>Ensino Pós-Graduação Incompleta</option>
											<option>Ensino Pós-Graduação Completa</option>
										
										</select>
									</div>
									<div class="form-group col-md-3">
										<label for="naturalidade">Naturalidade</label>
										<input type="text" class="form-control" id="naturalidade" name="naturalidade" placeholder="Naturalidade">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-2">
										<label for="cnh">CNH</label>
										<input type="text" class="form-control" id="cnh" name="cnh"	placeholder="Nº CNH">
									</div>
									<div class="form-group col-md-2">
										<label for="categoria">Categoria</label>
										<input type="text" class="form-control" id="categoria" name="categoria"	maxlength="2" placeholder="Categoria">
									</div>
									<div class="form-group col-md-2">
										<label for="validadecnh">Validade</label>
										<input type="date" class="form-control" id="validadecnh" name="validadecnh">
									</div>
								</div>
						</div>
						</li>
						<li>
							<input type="radio" id="tab3" class="rd_tab" name="tabs">
							<label for="tab3" class="tab_label">Documentos</label>
	
							<div class="tab-content">
								
								PROGRAMAR TABELA DOCUMENTOS-MILITARES
								
							</div>
						</li>
						<li>
							<input type="radio" id="tab4" class="rd_tab" name="tabs" >
							<label for="tab4" class="tab_label">Fotos</label>
	
							<div class="tab-content">
								<figure class="fotos-militar">
	
									<div class="container-foto">
										<label for="fotoFrente">Adicionar Foto de Frente</label> 
										<input type="file" id="fotoFrente" name="fotoFrente" accept="image/jpeg, image/jpg">
	
										<div class="fotos">
											<img alt="fotoFrente" id="fotoDeFrente" src="<c:if test='${militar.fotoFrente == null}'> ../img/foto-frente.jpg </c:if>
																						 <c:if test='${militar.fotoFrente != null}'> ${militar.fotoFrente} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoLado">Adicionar Foto de Lado</label>
										<input type="file" id="fotoLado" name="fotoLado" accept="image/jpeg,image/jpg" value="${militar.fotoLado}">
	
										<div class="fotos">
											<img alt="fotoLado" id="fotoDeLado" name="fotoDeLado" src="<c:if test='${militar.fotoLado == null}'> ../img/foto-lado.jpg </c:if>
																						 			   <c:if test='${militar.fotoLado != null}'> ${militar.fotoLado} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoCostas">Adicionar Foto de Costa</label>
										<input type="file" id="fotoCostas" name="fotoCostas" accept="image/jpeg,image/jpg" value="${militar.fotoCostas}">
		
										<div class="fotos">
											<img alt="fotoCostas" id="fotoDeCostas" name="fotoDeCostas" src="<c:if test='${militar.fotoCostas == null}'> ../img/foto-costa.jpg </c:if>
																						 			  	     <c:if test='${militar.fotoCostas != null}'> ${militar.fotoCostas} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas01">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas01" name="fotoDiversas01" accept="image/jpeg,image/jpg" value="${militar.fotoDiversas01}">
	
										<div class="fotos">
											<img alt="fotoDiversas01" id="fotoDeDiversas01" name="fotoDeDiversas01" src="<c:if test='${militar.fotoDiversas01 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${militar.fotoDiversas01 != null}'> ${militar.fotoDiversas01} </c:if>">
										</div>
									</div>
									<div class="container-foto">
										<label for="fotoDiversas02">Adicionar Fotos Diversas</label>
										<input type="file" id="fotoDiversas02" name="fotoDiversas02" accept="image/jpeg,.jpg" value="${militar.fotoDiversas02}">
	
										<div class="fotos">
											<img alt="fotoDiversas02" id="fotoDeDiversas02" name="fotoDeDiversas02" src="<c:if test='${militar.fotoDiversas02 == null}'> ../img/camera-p.png </c:if>
																						 			  	   				 <c:if test='${militar.fotoDiversas02 != null}'> ${militar.fotoDiversas02} </c:if>">
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
										<textarea class="form-control" cols=60 id="historioOcorrencia" name="historioOcorrencia" rows="15" name="historioOcorrencia" maxlength="500" wrap="hard" placeholder="envolvidos, data, hora, endereço, mike da ocorrência, artigos...">${militar.historico}</textarea>
									</fieldset>
	
								</div>
								<button type="button" id="btnSalvar" name="btnSalvar" class="btn btn-primary btn-lg" onclick="acaoBotaomilitar('${acaoBtnSalvar}')">Salvar</button>
							
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
															<fmt:parseDate value="${lista.nascimento}" pattern="yyyy-MM-dd" var="myDate"/>
															<td><fmt:formatDate pattern="dd-MM-yyyy" value="${myDate}"/></td>
															<td><c:out value="${lista.bairro}"></c:out></td>
															<td><a href="Cidadao?acao=editar&codigo=${lista.codigo}" class="btn btn-secondary btn-sm">Editar</a>
																<a href="Cidadao?acao=excluir&codigo=${lista.codigo}" onclick="return confirm('Confirmar Exclusão');" class="btn btn-danger btn-sm">Excluir</a>
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
</script>	
</body>
</html>