package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.swing.JOptionPane;

import beans.EnvolvidoOcorrenciaBean;
import connection.SingleConnection;

public class EnvolvioOcorrenciaDao {
	private Connection connection;
	
	public EnvolvioOcorrenciaDao() {
		 connection = SingleConnection.getConnection();
	}
	
	public void cadastrarEnvolvidoOcorrencia(EnvolvidoOcorrenciaBean envolvido) {
		
		String sql = "INSERT INTO tblenvolvidoocorrencia (codigoOcorrencia, graduacaoEnvolvidoOcorrencia, "
				+ "numeralEnvolvidoOcorrencia, nomeGuerraEnvolvidoOcorrencia, matriculaEnvolvidoOcorrencia, informacoesEnvolvidoOcorrencia) "
				+ "VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, envolvido.getCodigoOcorrenia());
			pst.setString(2, envolvido.getGraduacaoEnvolvidoOcorrencia());
			pst.setString(3, envolvido.getNumeralEnvolvidoOcorrencia());
			pst.setString(4, envolvido.getNomeGuerraEnvolvidoOcorrencia());
			pst.setString(5, envolvido.getMatriculaEnvolvidoOcorrencia());
			pst.setString(6, envolvido.getInformacoesEnvolvidoOcorrencia());
			pst.execute();
		}catch (Exception e) {
			System.out.println("Erro ao cadastrar envolvidos  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao cadastrar envolvidos na Ocorrencia! Tente novamente ou fale com o Administrador.");
		}
	}

}
