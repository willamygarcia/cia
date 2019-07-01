/**
 *  TODAS AS REQUISIÇÕES EM AJAX SERÃO FEITA AQUI.
 *  GERALMENTO REQUISIÇÕES DAS TELAS MODAIS
 */

function salvarArmasOcorrencia(acao){
	var codigoOcorrencia,serieArma, tipoArma, funcionamentoArma, marcaArma, calibreArma, capacidadeArma, informacaoArma;
	codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	serieArma=document.getElementById('serieArmaOcorrencia').value;
	tipoArma=document.getElementById('tipoArmaOcorrencia').value;
	funcionamentoArma=document.getElementById('funcionamentoArmaOcorrencia').value;
	marcaArma=document.getElementById('marcaArmaOcorrencia').value;
	calibreArma=document.getElementById('calibreArmaOcorrencia').value;
	capacidadeArma=document.getElementById('capacidadeArmaOcorrencia').value;
	informacaoArma=document.getElementById('informacoesArmasOcorrencia').value;
	$.ajax({
		method: "POST",
		dataType: "json",
		url: "ArmasOcorrencia",
		data:{
			codigoOcorrencia: codigoOcorrencia,
			serieArma: serieArma,
			tipoArma: tipoArma,
			funcionamentoArma: funcionamentoArma,
			marcaArma: marcaArma,
			calibreArma: calibreArma,
			capacidadeArma: capacidadeArma,
			informacaoArma:informacaoArma,
			acao:acao
		},
		success: function(data){
			$('#tabela-armas-ocorrencia tbody > tr').remove();
			document.getElementById('quantidadeArma').innerHTML=data.length;
			for(var i in data){
				$('#tabela-armas-ocorrencia').append('<tr><td>'+data[i].codigoArma+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].serie+'</td>'+
						       '<td>'+data[i].tipo+'</td>'+
							   '<td>'+data[i].funcionamento+'</td>'+
							   '<td>'+data[i].marca+'</td>'+
							   '<td>'+data[i].calibre+'</td>'+
							   '<td>'+data[i].capacidade+'</td>'+
					    	   '<td>'+data[i].informacao+'</td>'+
							   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerArmaOcorrecia('+data[i].codigoArma+')">Remover</button></td></tr>');
			}
		}
	})
	hiddenModalArmas(); //OCULTANDO A TELA DE MODAL.
}

function removerArmaOcorrecia(codigo){
	var codigoArma, codigoOcorrencia,acao;
	codigoArma=codigo;
	codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	acao="remover";
	$.ajax({
		method: "GET",
		dataType: "json",
		url: "ArmasOcorrencia",
		data: {
			codigoArma: codigoArma,
			codigoOcorrencia: codigoOcorrencia,
			acao: acao
		},
		success: function(data){
			console.log(data);
			$('#tabela-armas-ocorrencia tbody > tr').remove();
			document.getElementById('quantidadeArma').innerHTML=data.length;
			for(var i in data){
				$('#tabela-armas-ocorrencia').append('<tr><td>'+data[i].codigoArma+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].serie+'</td>'+
						       '<td>'+data[i].tipo+'</td>'+
							   '<td>'+data[i].funcionamento+'</td>'+
							   '<td>'+data[i].marca+'</td>'+
							   '<td>'+data[i].calibre+'</td>'+
							   '<td>'+data[i].capacidade+'</td>'+
					    	   '<td>'+data[i].informacao+'</td>'+
							   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerArmaOcorrecia('+data[i].codigoArma+')">Remover</button></td></tr>');
			}
		},
		 error: function(xhr, status) {
		        console.log("Algum erro");
		    }
	})
	
}

function iniciarOcorrencia(){
	var acao, codigo, mike, inquerito, bo, outros, graduacaoNotic, numeralNotic, matriculaNotic, nomeGuerraNotic;
	acao = "";
	codigo = document.getElementById('codigoOcorrencia').value;
	mike = document.getElementById('mikeOcorrencia').value;
	inquerito = document.getElementById('inqueritoOcorrencia').value;
	bo = document.getElementById('boOcorrencia').value;
	outros = document.getElementById('outrosOcorrencia').value;
	graduacaoNotic = document.getElementById('graduacaoPostoOcorrencia').value;
	numeralNotic = document.getElementById('numeralOcorrencia').value;
	matriculaNotic = document.getElementById('matriculaOcorrencia').value;
	nomeGuerraNotic = document.getElementById('nomeGuerraOcorrencia').value;
	$.ajax({
		method: "POST",
		url: "Ocorrencia",
		data: {
			acao: acao,
			codigoOcorrencia: codigo,
			mikeOcorrencia: mike,
			inqueritoOcorrencia: inquerito,
			boOcorrencia: bo,
			outrosOcorrencia: outros,
			graduacaoPostoOcorrencia: graduacaoNotic,
			numeralOcorrencia: numeralNotic,
			matriculaOcorrencia: matriculaNotic,
			nomeGuerraOcorrencia: nomeGuerraNotic
		},
		success: function(codigo){
			$('#codigoOcorrencia').val(codigo);
		}
	})
	
	document.getElementById('iniciarCadastro').disabled=true;
	document.getElementById('addMilitares').disabled=false;
	
	document.getElementById('tab2').disabled=false;
	document.getElementById('tab3').disabled=false;
	document.getElementById('tab4').disabled=false;
	document.getElementById('tab5').disabled=false;
	
}
function salvarMilitarEnvolvido(acao){
	var codigoOcorrencia, graduacao, numeral, matricula, nome, informacoes;
	codigoOcorrencia = document.getElementById('codigoOcorrencia').value;
	graduacao = document.getElementById('graduacaoPostoGuanicaoEnvOcorrencia').value;
	numeral = document.getElementById('numeralEnvOcorrencia').value;
	matricula = document.getElementById('matriculaEnvOcorrencia').value;
	nome = document.getElementById('nomeEnvOcorrencia').value;
	informacoes = document.getElementById('informacoesEnvOcorrencia').value;
	$.ajax({
		method: "POST",
		dataType: 'json',
		url: "EnvolvidosOcorrencia",
		data: {
			codigoOcorrencia: codigoOcorrencia,
			graduacao: graduacao,
			numeral: numeral,
			matricula: matricula,
			nome: nome,
			informacoes: informacoes,
			acao:"salvarEnvolvido"
		},
		success: function(data){
			$('#tabela-militares-envolvidos tbody > tr').remove();
			for(var i in data){
				$('#tabela-militares-envolvidos').append('<tr><td>'+data[i].codigoEnvolvido+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].graduacaoEnvolvido+'</td>'+
						       '<td>'+data[i].numeralEnvolvido+'</td>'+
							   '<td>'+data[i].matriculaEnvolvido+'</td>'+
							   '<td>'+data[i].nomeGuerraEnvolvido+'</td>'+
					    	   '<td>'+data[i].informacaoEnvolvido+'</td>'+
							   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerMilitarEnvolvido('+data[i].codigoEnvolvido+')">Remover</button></td></tr>');
			}
		}
	})
	hiddenModal(); //OCULTANDO A TELA DE MODAL.
}

function removerMilitarEnvolvido(codigo){
	var codigoOcorrencia;
	codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	$.ajax({
		method: "GET",
		dataType: 'json',
		url: "EnvolvidosOcorrencia",
		data: {
			codigoEnv: codigo,
			codigoOco: codigoOcorrencia,
			acao: "remover",
		},
		success: function(data){
			$('#tabela-militares-envolvidos tbody > tr').remove();
			for(var i in data){
				$('#tabela-militares-envolvidos').append('<tr><td>'+data[i].codigoEnvolvido+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].graduacaoEnvolvido+'</td>'+
						       '<td>'+data[i].numeralEnvolvido+'</td>'+
							   '<td>'+data[i].matriculaEnvolvido+'</td>'+
							   '<td>'+data[i].nomeGuerraEnvolvido+'</td>'+
					    	   '<td>'+data[i].informacaoEnvolvido+'</td>'+
					    	   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerMilitarEnvolvido('+data[i].codigoEnvolvido+')">Remover</button></td></tr>');
			}
		}
	})
}

function adicionarArtigo(){
	var ordenamento, artigo, paragrafo, codigoOcorrencia;
	ordenamento=document.getElementById('ordenamentoJuridico').value;
	artigo=document.getElementById('artigoOcorrencia').value;
	paragrafo=document.getElementById('alineaOcorriencia').value;
	codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	
	$.ajax({
		method: "POST",
		dataType: 'json',
		url: "OrdenamentoOcorrencia",
		data: {
			ordenamento: ordenamento,
			artigo: artigo,
			paragrafo: paragrafo,
			codigoOcorrencia: codigoOcorrencia,
			acao: "salvar"
		},
		success: function(data){
			document.getElementById('ordenamentoJuridico').value="";
			document.getElementById('artigoOcorrencia').value="";
			document.getElementById('alineaOcorriencia').value="";
			$('#tabela-informacoes-criminais tbody > tr').remove();
			for(var i in data){
				$('#tabela-informacoes-criminais').append('<tr><td>'+data[i].codigoOrdenamento+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].leiOrdenamento+'</td>'+
						       '<td>'+data[i].artigoOrdenamento+'</td>'+
							   '<td>'+data[i].paragrafoOrdenamento+'</td>'+
					    	   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerOrdenamento('+data[i].codigoOrdenamento+')">Remover</button></td></tr>');
			}
		}
	})
	
	
}

function removerOrdenamento(codigoOrdenamento){
	var codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	$.ajax({
		method: "GET",
		dataType: 'json',
		url: "OrdenamentoOcorrencia",
		data: {
			codigoOrd: codigoOrdenamento,
			codigoOcor: codigoOcorrencia,
			acao: "remover"
		},
		success: function(data){
			$('#tabela-informacoes-criminais tbody > tr').remove();
			for(var i in data){
				$('#tabela-informacoes-criminais').append('<tr><td>'+data[i].codigoOrdenamento+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].leiOrdenamento+'</td>'+
						       '<td>'+data[i].artigoOrdenamento+'</td>'+
							   '<td>'+data[i].paragrafoOrdenamento+'</td>'+
					    	   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerOrdenamento('+data[i].codigoOrdenamento+')">Remover</button></td></tr>');
			}
		}
	})
}