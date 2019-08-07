package beans;

public class VeiculosOcorrenciaBean {
	private int codigoVeiculoOco;
	private String placaVeiculoOco;
	private String maracaVeiculoOco;
	private String modeloVeiculoOco;
	private String tipoVeiculoOco;
	private String corVeiculoOco;
	private int anoFabVeiculoOco;
	private int anoModVeiculoOco;
	private int codigoOcorrencia;
	
	public int getCodigoVeiculoOco() {
		return codigoVeiculoOco;
	}
	public void setCodigoVeiculoOco(int codigoVeiculoOco) {
		this.codigoVeiculoOco = codigoVeiculoOco;
	}
	public String getPlacaVeiculoOco() {
		return placaVeiculoOco;
	}
	public void setPlacaVeiculoOco(String placaVeiculoOco) {
		this.placaVeiculoOco = placaVeiculoOco;
	}
	public String getMaracaVeiculoOco() {
		return maracaVeiculoOco;
	}
	public void setMaracaVeiculoOco(String maracaVeiculoOco) {
		this.maracaVeiculoOco = maracaVeiculoOco;
	}
	public String getModeloVeiculoOco() {
		return modeloVeiculoOco;
	}
	public void setModeloVeiculoOco(String modeloVeiculoOco) {
		this.modeloVeiculoOco = modeloVeiculoOco;
	}
	public String getTipoVeiculoOco() {
		return tipoVeiculoOco;
	}
	public void setTipoVeiculoOco(String tipoVeiculoOco) {
		this.tipoVeiculoOco = tipoVeiculoOco;
	}
	public String getCorVeiculoOco() {
		return corVeiculoOco;
	}
	public void setCorVeiculoOco(String corVeiculoOco) {
		this.corVeiculoOco = corVeiculoOco;
	}
	public int getAnoFabVeiculoOco() {
		return anoFabVeiculoOco;
	}
	public void setAnoFabVeiculoOco(String anoFabVeiculoOco) {
		if(!anoFabVeiculoOco.equalsIgnoreCase("")) {
			this.anoFabVeiculoOco = Integer.parseInt(anoFabVeiculoOco.replaceAll("[^0-9]", ""));
		}else {
			this.anoFabVeiculoOco=0;
		}
	}
	public int getAnoModVeiculoOco() {
		return anoModVeiculoOco;
	}
	public void setAnoModVeiculoOco(String anoModVeiculoOco) {
		if(!anoModVeiculoOco.equalsIgnoreCase("")) {
			this.anoModVeiculoOco = Integer.parseInt(anoModVeiculoOco.replaceAll("[^0-9]", ""));
		}else {
			this.anoModVeiculoOco=0;
		}
	}
	public int getCodigoOcorrencia() {
		return codigoOcorrencia;
	}
	public void setCodigoOcorrencia(String codigoOcorrencia) {
		this.codigoOcorrencia = Integer.parseInt(codigoOcorrencia.replaceAll("[^0-9]", ""));
	}
	
	

}
