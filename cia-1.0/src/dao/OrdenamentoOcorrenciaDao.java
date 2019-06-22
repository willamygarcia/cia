package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import beans.OrdenamentoOcorrenciaBean;
import connection.SingleConnection;

public class OrdenamentoOcorrenciaDao {
	private Connection connection;
	
	public OrdenamentoOcorrenciaDao() {
		
		 connection = SingleConnection.getConnection();
	}
	
	public void cadastrarOrdenamentoOcorrencia(OrdenamentoOcorrenciaBean ordenamento) {
		
		String sql = "INSERT INTO tblordenamentoocorrencia (codigoOcorrencia, leiOrdenamentoOcorrencia, artigoOrdenamentoOcorrencia, paragrafoOrdenamentoOcorrencia) VALUES (?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, ordenamento.getCodigoOcorrencia());
			pst.setString(2, ordenamento.getLeiOrdenamentoOcorrencia());
			pst.setString(3, ordenamento.getArtigoOrdenamentoOcorrencia());
			pst.setString(4, ordenamento.getParagrafoOrdenamentoOcorrencia());
			pst.execute();
			connection.commit();
		}catch (Exception e) {
			System.out.println("Erro ao cadastrar ordenamento  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao cadastrar ordenamento na Ocorrencia! Tente novamente ou fale com o Administrador.");
			try {
				connection.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao salvar a Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
	}
	

}
