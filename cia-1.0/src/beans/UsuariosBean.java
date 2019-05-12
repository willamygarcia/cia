package beans;

public class UsuariosBean {

	private int codigoUsuarios;
	private String nomeUsuarios;
	private String nomeCompletoUsuarios;
	private String senha;
	private String confirmaSenha;
	private int nivelUsuarios;
	
	
	public int getCodigoUsuarios() {
		return codigoUsuarios;
	}
	public void setCodigoUsuarios(int codigoUsuarios) {
	
		this.codigoUsuarios = codigoUsuarios;
	}
	public String getNomeUsuarios() {
		return nomeUsuarios;
	}
	public void setNomeUsuarios(String nomeUsuarios) {
		this.nomeUsuarios = nomeUsuarios;
	}
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getConfirmaSenha() {
		return confirmaSenha;
	}
	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}
	public int getNivelUsuarios() {
		return nivelUsuarios;
	}
	public void setNivelUsuarios(int nivelUsuarios) {
		this.nivelUsuarios = nivelUsuarios;
	}
	public String getNomeCompletoUsuarios() {
		return nomeCompletoUsuarios;
	}
	public void setNomeCompletoUsuarios(String nomeCompletoUsuarios) {
		this.nomeCompletoUsuarios = nomeCompletoUsuarios;
	}
	
	

}
