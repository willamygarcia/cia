<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<c:set var="context" value="${pageContext.request.contextPath}" />
		<link rel="shortcut icon" href="${context}/ico/principal.ico" type="image/x-icon">
		<link rel="stylesheet" href="${context}/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${context}/css/estilo-view.css" type="text/css">
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery-3.3.1.js"></script>
			<script type="text/javascript" src="http://cobaxtecnologia.com.br/cobax_js/jquery.maskedinput.min.js"></script>
		<title>CIA 1.0</title>
	</head>
<body>
	<div id="conteiner-view">
		<header id="cabecalho-view">
			<img alt="logo-cia" src="${context}/img/topo.png">
			<img alt="logo-cia" src="${context}/img/logoPM.png">
			<h3 class="titulo-view">FICHA DO CIDADÃO</h3>
			<h4 class="numero-view">Nº ${cidadao.codigo}</h4>
		</header>
		<figure id="foto-ficha">
		
			<img alt="foto-inicial-view" src="${cidadao.fotoFrente}">
			
		</figure>
		
		<aside id="dados-pessoais-view">
			<fieldset>
				<legend>Dados Pessoais</legend>
				
				<label class="legenda">Nome:&nbsp;</label>
				${cidadao.nome}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alcunha:&nbsp;</label>
				${cidadao.alcunha}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nascimento:&nbsp;</label>
				${cidadao.nascimento}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telefone:&nbsp;</label>
				${cidadao.telefone}
				<br>
				<label class="legenda">RG:&nbsp;</label>
				${cidadao.rg}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Orgão Emissor:&nbsp;</label>
				${cidadao.orgaoEmissor}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UF:&nbsp;</label>
				${cidadao.uf}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CPF:&nbsp;</label>
				${cidadao.cpf}
				<br>
				<label class="legenda">Mãe:&nbsp;</label>
				${cidadao.mae}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pai:&nbsp;</label>
				${cidadao.pai}
				<br>
				<label class="legenda">CEP:&nbsp;</label>
				${cidadao.cep}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Endereço:&nbsp;</label>
				${cidadao.endereco}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nº:&nbsp;</label>
				${cidadao.numero}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bairro:&nbsp;</label>
				${cidadao.bairro}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cidade:&nbsp;</label>
				${cidadao.cidade}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UF:&nbsp;</label>
				${cidadao.ufEndereco}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pais:&nbsp;</label>
				${cidadao.pais}
				<br>
				<label class="legenda">Complemento:&nbsp;</label>
				${cidadao.complemento}
				
			
			</fieldset>
		</aside>
		<article id="dados-juridicos-view">
			<fieldset>
				<legend>Dados Juridicos</legend>
				
				<label class="legenda">Data Utima Infração:&nbsp;</label>
				${cidadao.dataUtimaInfracao}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Delegacia:&nbsp;</label>
				${cidadao.delegacia}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Facção Criminosa:&nbsp;</label>
				${cidadao.faccao}
				<br>
				<label class="legenda">Endereço da Utima Ocorrêcia:&nbsp;</label>
				${cidadao.endOcorrencia}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bairro:&nbsp;</label>
				${cidadao.bairroOcorrencia}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cidade:&nbsp;</label>
				${cidadao.cidadeOcorrencia}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ponto de Referência:&nbsp;</label>
				${cidadao.referenciaOcorrencia}
				<br>
				<label class="legenda">Ordenamento Juridico/Artigos/Inciso/Alinea:&nbsp;</label>
				<pre>
${cidadao.historicoJuridico}
				</pre>
				
			
			</fieldset>
		
		</article>
		<article id="dados-tatuagens-view">
			<fieldset>
				<legend>Tatuagens</legend>
				
				<label class="legenda">Rosto:&nbsp;</label>
				${cidadao.tatuRosto}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pescoço:&nbsp;</label>
				${cidadao.tatuPescoco}
				<br>
				<label class="legenda">Torax(Peito Direito,Esquerdo e Barriga):&nbsp;</label>
				${cidadao.tatuTorax}
				<br>
				<label class="legenda">Braço(Obro até as Mãos) Direito:&nbsp;</label>
				${cidadao.tatuBracoDireito}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Braço(Obro até as Mãos) Equerdo:&nbsp;</label>
				${cidadao.tatuBracoEsquerdo}
				<br>
				<label class="legenda">Perna(Coxa até os Pes) Direita:&nbsp;</label>
				${cidadao.tatuPernaDireita}
				<label class="legenda">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Perna(Coxa até os Pes) Esquerda:&nbsp;</label>
				${cidadao.tatuPernaEsquerda}
				<br>
				<label class="legenda">Costas(Toda Região):&nbsp;</label>
				${cidadao.tatuCostas}
			</fieldset>
		
		</article>
		<article id="dados-fotos-view">
			<fieldset>
				<legend>Fotos</legend>
				
				<figure id="foto-ficha-view">
		
					<img alt="foto-Frente-view" src="${cidadao.fotoFrente}">
					<img alt="foto-lado-view" src="${cidadao.fotoLado}">
					<img alt="foto-costas-view" src="${cidadao.fotoCostas}">
					<img alt="foto-diversos01-view" src="${cidadao.fotoDiversas01}">
					<img alt="foto-diversos02-view" src="${cidadao.fotoDiversas02}">
					
			
				</figure>
			
			</fieldset>
		
		</article>
		<article id="dados-historico-view">
			<fieldset>
				<legend>Historico</legend>
				
				<label>Historico sobre Ocorrências: </label>
				<p>
				${cidadao.historico}
				</p>
			</fieldset>
		
		</article>
	</div>
</body>
</html>