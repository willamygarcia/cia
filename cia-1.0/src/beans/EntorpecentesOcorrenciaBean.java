package beans;

public class EntorpecentesOcorrenciaBean {
	
	private int codigoEntorpecenteOcorrencia;
	private String nomeEntorpecenteOcorrencia;
	private int qtdUnEntorpecenteOcorrencia;
	private double qtdKgEntorpecenteOcorrencia;
	private String informacoesEntorpecenteOcorrencia;
	private int entorpCodigoOcorrencia;
	
	public int getCodigoEntorpecenteOcorrencia() {
		return codigoEntorpecenteOcorrencia;
	}
	public void setCodigoEntorpecenteOcorrencia(String codigoEntorpecenteOcorrencia) {
		
		if(!codigoEntorpecenteOcorrencia.equalsIgnoreCase("")) {
			this.codigoEntorpecenteOcorrencia = Integer.parseInt(codigoEntorpecenteOcorrencia.replaceAll("[^0-9]", ""));
		}else {
			this.codigoEntorpecenteOcorrencia = 0;
		}
		
	}
	public String getNomeEntorpecenteOcorrencia() {
		return nomeEntorpecenteOcorrencia;
	}
	public void setNomeEntorpecenteOcorrencia(String nomeEntorpecenteOcorrencia) {
		this.nomeEntorpecenteOcorrencia = nomeEntorpecenteOcorrencia;
	}
	public int getQtdUnEntorpecenteOcorrencia() {
		return qtdUnEntorpecenteOcorrencia;
	}
	public void setQtdUnEntorpecenteOcorrencia(String qtdUnEntorpecenteOcorrencia) {
		if(!qtdUnEntorpecenteOcorrencia.equalsIgnoreCase("")) {
			this.qtdUnEntorpecenteOcorrencia = Integer.parseInt(qtdUnEntorpecenteOcorrencia.replaceAll("[^0-9]", ""));
		}else {
			this.qtdUnEntorpecenteOcorrencia = 0;
		}
		
	}
	public double getQtdKgEntorpecenteOcorrencia() {
		return qtdKgEntorpecenteOcorrencia;
	}
	public void setQtdKgEntorpecenteOcorrencia(String qtdKgEntorpecenteOcorrencia) {
		
		if(!qtdKgEntorpecenteOcorrencia.equalsIgnoreCase("")) {
			this.qtdKgEntorpecenteOcorrencia = Double.parseDouble((qtdKgEntorpecenteOcorrencia.replaceAll("[^0-9]", "")));
			
		}else {
			this.qtdKgEntorpecenteOcorrencia = 0;
			
		}
	}
	public String getInformacoesEntorpecenteOcorrencia() {
		return informacoesEntorpecenteOcorrencia;
	}
	public void setInformacoesEntorpecenteOcorrencia(String informacoesEntorpecenteOcorrencia) {
		this.informacoesEntorpecenteOcorrencia = informacoesEntorpecenteOcorrencia;
	}
	public int getEntorpCodigoOcorrencia() {
		return entorpCodigoOcorrencia;
	}
	public void setEntorpCodigoOcorrencia(String entorpCodigoOcorrencia) {
		if(!entorpCodigoOcorrencia.equalsIgnoreCase("") || !entorpCodigoOcorrencia.equalsIgnoreCase(null)) {
			this.entorpCodigoOcorrencia = Integer.parseInt(entorpCodigoOcorrencia.replaceAll("[^0-9]", ""));
		}else {
			this.entorpCodigoOcorrencia = 0;
		}
	}
	

	
}
