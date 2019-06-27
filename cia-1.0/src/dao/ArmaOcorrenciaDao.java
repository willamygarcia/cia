package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import beans.ArmasOcorrenciaBean;
import connection.SingleConnection;

public class ArmaOcorrenciaDao {
	Connection connection ;
	public ArmaOcorrenciaDao() {
		connection = SingleConnection.getConnection();
	}
	
	public void salvarArmaOcorrencia(ArmasOcorrenciaBean arma) {
		String sql = "INSERT INTO tblarmasocorrencia (codigoOcorrencia, serieArma, tipoArma, funcionamentoArma, marcaArma, calibreArma, capacidadeArma, informacoesArma) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, arma.getCodigoOcorrencia());
			pst.setString(2, arma.getSerieArma());
			pst.setString(3, arma.getTipoArma());
			pst.setString(4, arma.getFuncionamentoArma());
			pst.setString(5, arma.getMarcaArma());
			pst.setString(6, arma.getCalibreArma());
			pst.setString(7, arma.getCapacidadeArma());
			pst.setString(8, arma.getInformacoesArama());
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "Erro ao  salvar Arma na Ocorrencia! Tente novamente ou fale com o Administrador. ERRO:"+ e);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao Salvar Arma na Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao  Salvar Arma na Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
		
	}

}
