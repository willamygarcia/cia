/**
 *  TODAS AS REQUISIÇÕES EM AJAX SERÃO FEITA AQUI.
 *  GERALMENTE REQUISIÇÕES DAS TELAS MODAIS
 */

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
	
	confirmacao = confirm('Deseja remover Arma da Ocorrencia?');
	if(confirmacao){
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
	
	confirmacao = confirm('Deseja Remover o Envolvido?');
	
	if(confirmacao){
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
	
	confirmacao = confirm('Deseja remover Informação Criminal?');
	if(confirmacao){
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
}

function salvarEntorpecentesOcorrencia(acao){
	var EntorpCodigoOcorrencia, nomeEntorpecente, qtdUn, qtdKg, informacoesAdicionais;
	
	EntorpCodigoOcorrencia=document.getElementById('codigoOcorrencia').value;
	nomeEntorpecente=document.getElementById('nomeEntorpecente').value;
	qtdUn=document.getElementById('quantidadeUnEntorpecente').value;
	qtdKg=document.getElementById('quantidadeKgEntorpecente').value;
	informacoesAdicionais=document.getElementById('informacoesEntorpecentes').value;
	$.ajax({
		method: "POST",
		dataType: "json",
		url: "EntorpecentesOcorrencia",
		data:{
			EntorpCodigoOcorrencia: EntorpCodigoOcorrencia,
			nomeEntorpecente: nomeEntorpecente,
			qtdUn: qtdUn,
			qtdKg: qtdKg,
			informacoesAdicionais: informacoesAdicionais,
			acao:acao
		},
		success: function(data){
			$('#tabela-entorpecentes-ocorrencia tbody > tr').remove();
			document.getElementById('quantidadeEntorpecentes').innerHTML=data.length;
			for(var i in data){
				$('#tabela-entorpecentes-ocorrencia').append('<tr><td>'+data[i].codigoEntorpecente+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].nome+'</td>'+
						       '<td>'+data[i].qtdUn+'</td>'+
							   '<td>'+data[i].qtdKg+'</td>'+
							   '<td>'+data[i].informacoes+'</td>'+
							   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerEntorpecenteOcorrencia('+data[i].codigoEntorpecente+')">Remover</button></td></tr>');
			}
		}
	})
	hiddenModalEntorpecentes(); //OCULTANDO A TELA DE MODAL.
}

function removerEntorpecenteOcorrencia(codigoEntorpecente){
	var confirmacao = confirm('Deseja remover entorpecentes da Ocorrencia?');
	if(confirmacao){
		var codOcorrencia, codEntorpecente, acao;
		codOcorrencia=document.getElementById('codigoOcorrencia').value;
		codEntorpecente=codigoEntorpecente;
		acao="remover";
		$.ajax({
			method: "GET",
			dataType: "json",
			url: "EntorpecentesOcorrencia",
			data:{
				ocorrencia: codOcorrencia,
				entorpecente: codEntorpecente,
				acao: acao
			},
			success: function(data){
				$('#tabela-entorpecentes-ocorrencia tbody > tr').remove();
				document.getElementById('quantidadeEntorpecentes').innerHTML=data.length;
				for(var i in data){
					$('#tabela-entorpecentes-ocorrencia').append('<tr><td>'+data[i].codigoEntorpecente+'</td>'+
								   '<td>'+data[i].codigoOcorrencia+'</td>'+
								   '<td>'+data[i].nome+'</td>'+
							       '<td>'+data[i].qtdUn+'</td>'+
								   '<td>'+data[i].qtdKg+'</td>'+
								   '<td>'+data[i].informacoes+'</td>'+
								   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerEntorpecenteOcorrencia('+data[i].codigoEntorpecente+')">Remover</button></td></tr>');
				}
			}
		})
	}
} 

function salvarVeiculoOcorrencia(){
	var placaVeiculo,marcaVeiculo,modeloVeiculo,tipoVeiculo,corVeiculo,anoFabVeiculo,anoModVeiculo,codigoOcorrencia,acao;
		placaVeiculo=document.getElementById('placaVeiculo').value;
		marcaVeiculo=document.getElementById('marcaVeiculo').value;
		modeloVeiculo=document.getElementById('modeloVeiculo').value;
		tipoVeiculo=document.getElementById('tipoVeiculo').value;
		corVeiculo=document.getElementById('corVeiculo').value;
		anoFabVeiculo=document.getElementById('anoFab').value;
		anoModVeiculo=document.getElementById('anoMod').value;
		codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
		acao="salvar";
		$.ajax({
			method: "POST",
			dataType: "json",
			url: "VeiculoOcorrencia",
			data:{
				placa: placaVeiculo,
				marca: marcaVeiculo,
				modelo: modeloVeiculo,
				tipo: tipoVeiculo,
				cor: corVeiculo,
				anoFab: anoFabVeiculo,
				anoMod: anoModVeiculo,
				codigoOcorrencia: codigoOcorrencia,
				acao: acao
			},
			success: function(data){
				$('#tabela-veiculos-ocorrencia tbody > tr').remove();
				document.getElementById('quantidadeVeiculos').innerHTML=data.length;
				for(var i in data){
					$('#tabela-veiculos-ocorrencia').append('<tr><td>'+data[i].codigoVeiculo+'</td>'+
								   '<td>'+data[i].codigoOcorrencia+'</td>'+
								   '<td>'+data[i].placa+'</td>'+
							       '<td>'+data[i].marca+'</td>'+
								   '<td>'+data[i].modelo+'</td>'+
								   '<td>'+data[i].tipo+'</td>'+
								   '<td>'+data[i].cor+'</td>'+
								   '<td>'+data[i].anoFab+'</td>'+
								   '<td>'+data[i].anoMod+'</td>'+
								   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerVeiculosOcorrencia('+data[i].codigoVeiculo+')">Remover</button></td></tr>');
				}
			}
		})
		hiddenModalVeiculos();
		
}
function removerVeiculosOcorrencia(codigoVeiculo){
	
	var confirmacao = confirm('Deseja remover veiculo da ocorrencia?');
	if(confirmacao){
		var codOcorrencia, codVeiculo, acao;
		codOcorrencia=document.getElementById('codigoOcorrencia').value;
		codVeiculo=codigoVeiculo;
		acao="remover";
		$.ajax({
			method: "GET",
			dataType: "json",
			url: "VeiculoOcorrencia",
			data:{
				ocorrencia: codOcorrencia,
				codigoVeiculo: codVeiculo,
				acao: acao
			},
			success: function(data){
				$('#tabela-veiculos-ocorrencia tbody > tr').remove();
				document.getElementById('quantidadeVeiculos').innerHTML=data.length;
				for(var i in data){
					$('#tabela-veiculos-ocorrencia').append('<tr><td>'+data[i].codigoVeiculo+'</td>'+
							   '<td>'+data[i].codigoOcorrencia+'</td>'+
							   '<td>'+data[i].placa+'</td>'+
						       '<td>'+data[i].marca+'</td>'+
							   '<td>'+data[i].modelo+'</td>'+
							   '<td>'+data[i].tipo+'</td>'+
							   '<td>'+data[i].cor+'</td>'+
							   '<td>'+data[i].anoFab+'</td>'+
							   '<td>'+data[i].anoMod+'</td>'+
							   '<td><button type="button" class="btn btn btn-danger btn-sm" onclick="removerVeiculosOcorrencia('+data[i].codigoVeiculo+')">Remover</button></td></tr>');
				}
			}
		})
	}
} 
function salvarDocumentoOcorrencia(){
	var descricao,documento,documento2,codigoOcorrencia,acao,exibir,exibir2;
	
	    descricao=document.getElementById('descricaoDocumento').value;
		documento=document.getElementById('documentoLido').value;
		codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
		acao="salvar";
		
		
		$.ajax({
			method: "POST",
			dataType: "json",
			url: "DocumentosOcorrencia",
			data:{
				descricaoDocumento: descricao,
				documentoDocumento: documento,
				codigoOcorrencia: codigoOcorrencia,
				acao: acao
			},
			success: function(data){
				$('#tabela-documentos-ocorrencia tbody > tr').remove();
				document.getElementById('quantidadeDocumentos').innerHTML=data.length;
				for(var i in data){
					$('#tabela-documentos-ocorrencia').append('<tr><td>'+data[i].codigoDocumento+'</td>'+
								   '<td>'+data[i].codigoOcorrencia+'</td>'+
								   '<td>'+data[i].descricao+'</td>'+
								   '<td>'+
								   '<a href="DocumentosOcorrencia?codigoDocumento='+data[i].codigoDocumento+'&acao=visualizar" target="_blank" class="btn btn-info btn-sm">Vizualizar</a>&nbsp;'+
								   '<a href="DocumentosOcorrencia?codigoDocumento='+data[i].codigoDocumento+'&acao=download" target="_blank" class="btn btn-success btn-sm">Baixar</a>&nbsp;'+
								   '<button type="button" class="btn btn btn-danger btn-sm" onclick="removerDocumentoOcorrencia('+data[i].codigoDocumento+')">Remover</button></td></tr>');
				}
			}
		})
		hiddenModalDocumentos();
	
}
function removerDocumentoOcorrencia(codDocumento){
	
	var confirmacao = confirm('Deseja remover documento da ocorrencia?');
	if(confirmacao){
		var codigoOcorrencia, codigoDocumento, acao;
		codigoOcorrencia=document.getElementById('codigoOcorrencia').value;
		codigoDocumento=codDocumento;
		acao="remover";
		$.ajax({
			method: "GET",
			dataType: "json",
			url: "DocumentosOcorrencia",
			data:{
				codigoOcorrencia: codigoOcorrencia,
				codigoDocumento: codigoDocumento,
				acao: acao
			},
			success: function(data){
				$('#tabela-documentos-ocorrencia tbody > tr').remove();
				document.getElementById('quantidadeDocumentos').innerHTML=data.length;
				for(var i in data){
					$('#tabela-documentos-ocorrencia').append('<tr><td>'+data[i].codigoDocumento+'</td>'+
								   '<td>'+data[i].codigoOcorrencia+'</td>'+
								   '<td>'+data[i].descricao+'</td>'+
								   '<td>'+
								   '<a href="DocumentosOcorrencia?codigoDocumento='+data[i].codigoDocumento+'&acao=visualizar" target="_blank" class="btn btn-info btn-sm">Vizualizar</a>&nbsp;'+
								   '<a href="DocumentosOcorrencia?codigoDocumento='+data[i].codigoDocumento+'&acao=download" target="_blank" class="btn btn-success btn-sm">Baixar</a>&nbsp;'+
								   '<button type="button" class="btn btn btn-danger btn-sm" onclick="removerDocumentoOcorrencia('+data[i].codigoDocumento+')">Remover</button></td></tr>');
				}
			}
		})
	}
}
function base(input){
	
	var file = input.files[0];
	var reader = new FileReader();
	reader.onloadend = function() {
	 var dataUrl = reader.result;
	 document.getElementById('documentoLido').value = dataUrl;
	};
	reader.readAsDataURL(file);
};


