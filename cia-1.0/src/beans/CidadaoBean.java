package beans;

import java.util.regex.Pattern;

public class CidadaoBean {
	
	private int codigo;
	private String nome;
	private String alcunha;
	private String nascimento;
	private Long telefone;
	private Long rg;
	private Long cpf;
	private String orgaoEmissor;
	private String uf;
	private String mae;
	private String pai;
	private Long cep;
	private String endereco;
	private Integer numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String ufEndereco;
	private String pais;
	private String dataUtimaInfracao;
	private String delegacia;
	private String faccao;
	private String endOcorrencia;
	private String bairroOcorrencia;
	private String cidadeOcorrencia;
	private String referenciaOcorrencia;
	private String historicoJuridico;
	private String tatuRosto;
	private String tatuPescoco;
	private String tatuTorax;
	private String tatuBracoDireito;
	private String tatuBracoEsquerdo;
	private String tatuPernaDireita;
	private String tatuPernaEsquerda;
	private String tatuCostas;
	private String fotoFrente;
	private String fotoLado;
	private String fotoCostas;
	private String fotoDiversas01;
	private String fotoDiversas02;
	private String historico;
	
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getAlcunha() {
		return alcunha;
	}
	public void setAlcunha(String alcunha) {
		this.alcunha = alcunha;
	}
	public String getNascimento() {
		return nascimento;
	}
	public void setNascimento(String nascimento) {
		
		if(nascimento.equals(null) || nascimento.equals("")) {
			this.nascimento = null;
		}else {
		
			this.nascimento = nascimento;
		}
	}
	public Long getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		
		if(telefone.equals(null) || telefone.equals("")) {
			this.telefone = null;
		}else {
			
			this.telefone = Long.parseLong(telefone.replaceAll("-", ""));
		}
	
	}
	public Long getRg() {
		return rg;
	}
	public void setRg(String rg) {
		if(rg.equals(null) || rg.equals("")) {
			this.rg = null;
		}else {
			this.rg = Long.parseLong(rg);
		}
	}
	public Long getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		if(cpf.equals(null) || cpf.equals("") || cpf == null){
			this.cpf = null;
		}else {
			cpf = cpf.replaceAll(Pattern.quote("."), "");
			cpf = cpf.replaceAll("-", "");
			this.cpf = Long.parseLong(cpf);
		
		}
	}
	public String getOrgaoEmissor() {
		return orgaoEmissor;
	}
	public void setOrgaoEmissor(String orgaoEmissor) {
		this.orgaoEmissor = orgaoEmissor;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getMae() {
		return mae;
	}
	public void setMae(String mae) {
		this.mae = mae;
	}
	public String getPai() {
		return pai;
	}
	public void setPai(String pai) {
		this.pai = pai;
	}
	public Long getCep() {
		return cep;
	}
	public void setCep(String cep) {
		if(cep.equals(null) || cep.equals("")) {
			this.cep = null;
		}else {
			this.cep = Long.parseLong(cep);
		}
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		if(numero.equals(null) || numero.equals("")) {
			this.numero = null;
		}else {
			this.numero = Integer.parseInt(numero);
		}
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUfEndereco() {
		return ufEndereco;
	}
	public void setUfEndereco(String ufEndereco) {
		this.ufEndereco = ufEndereco;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getDataUtimaInfracao() {
		return dataUtimaInfracao;
	}
	public void setDataUtimaInfracao(String dataUtimaInfracao) {
		
		if(dataUtimaInfracao.equals(null) || dataUtimaInfracao.equals("")) {
		
			this.dataUtimaInfracao = null;
		
		}else {
		
			this.dataUtimaInfracao = dataUtimaInfracao;
		}
	}
	public String getDelegacia() {
		return delegacia;
	}
	public void setDelegacia(String delegacia) {
		this.delegacia = delegacia;
	}
	public String getFaccao() {
		return faccao;
	}
	public void setFaccao(String faccao) {
		this.faccao = faccao;
	}
	public String getEndOcorrencia() {
		return endOcorrencia;
	}
	public void setEndOcorrencia(String endOcorrencia) {
		this.endOcorrencia = endOcorrencia;
	}
	public String getBairroOcorrencia() {
		return bairroOcorrencia;
	}
	public void setBairroOcorrencia(String bairroOcorrencia) {
		this.bairroOcorrencia = bairroOcorrencia;
	}
	public String getCidadeOcorrencia() {
		return cidadeOcorrencia;
	}
	public void setCidadeOcorrencia(String cidadeOcorrencia) {
		this.cidadeOcorrencia = cidadeOcorrencia;
	}
	public String getReferenciaOcorrencia() {
		return referenciaOcorrencia;
	}
	public void setReferenciaOcorrencia(String referenciaOcorrencia) {
		this.referenciaOcorrencia = referenciaOcorrencia;
	}
	public String getHistoricoJuridico() {
		return historicoJuridico;
	}
	public void setHistoricoJuridico(String historicoJuridico) {
		this.historicoJuridico = historicoJuridico;
	}
	public String getTatuRosto() {
		return tatuRosto;
	}
	public void setTatuRosto(String tatuRosto) {
		this.tatuRosto = tatuRosto;
	}
	public String getTatuPescoco() {
		return tatuPescoco;
	}
	public void setTatuPescoco(String tatuPescoco) {
		this.tatuPescoco = tatuPescoco;
	}
	public String getTatuTorax() {
		return tatuTorax;
	}
	public void setTatuTorax(String tatuTorax) {
		this.tatuTorax = tatuTorax;
	}
	public String getTatuBracoDireito() {
		return tatuBracoDireito;
	}
	public void setTatuBracoDireito(String tatuBracoDireito) {
		this.tatuBracoDireito = tatuBracoDireito;
	}
	public String getTatuBracoEsquerdo() {
		return tatuBracoEsquerdo;
	}
	public void setTatuBracoEsquerdo(String tatuBracoEsquerdo) {
		this.tatuBracoEsquerdo = tatuBracoEsquerdo;
	}
	public String getTatuPernaDireita() {
		return tatuPernaDireita;
	}
	public void setTatuPernaDireita(String tatuPernaDireita) {
		this.tatuPernaDireita = tatuPernaDireita;
	}
	public String getTatuPernaEsquerda() {
		return tatuPernaEsquerda;
	}
	public void setTatuPernaEsquerda(String tatuPernaEsquerda) {
		this.tatuPernaEsquerda = tatuPernaEsquerda;
	}
	public String getTatuCostas() {
		return tatuCostas;
	}
	public void setTatuCostas(String tatuCostas) {
		this.tatuCostas = tatuCostas;
	}
	public String getHistorico() {
		return historico;
	}
		
	public String getFotoFrente() {
		return fotoFrente;
	}
	public void setFotoFrente(String fotoFrente) {
		this.fotoFrente = fotoFrente;
	}
		
	public String getFotoLado() {
		return fotoLado;
	}
	public void setFotoLado(String fotoLado) {
		this.fotoLado = fotoLado;
	}
	public String getFotoCostas() {
		return fotoCostas;
	}
	public void setFotoCostas(String fotoCostas) {
		this.fotoCostas = fotoCostas;
	}
	public String getFotoDiversas01() {
		return fotoDiversas01;
	}
	public void setFotoDiversas01(String fotoDiversas01) {
		this.fotoDiversas01 = fotoDiversas01;
	}
	public String getFotoDiversas02() {
		return fotoDiversas02;
	}
	public void setFotoDiversas02(String fotoDiversas02) {
		this.fotoDiversas02 = fotoDiversas02;
	}
	public void setHistorico(String historico) {
		this.historico = historico;
	}
	
	

}
