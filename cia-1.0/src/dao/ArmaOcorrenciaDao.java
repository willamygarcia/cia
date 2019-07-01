package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<ArmasOcorrenciaBean> consultaTotalArmas(ArmasOcorrenciaBean armas){
		String sql = "SELECT * FROM tblarmasocorrencia WHERE codigoOcorrencia = ?";
		List<ArmasOcorrenciaBean> lista = new ArrayList<ArmasOcorrenciaBean>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, armas.getCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				ArmasOcorrenciaBean armasOcorrencia = new ArmasOcorrenciaBean();
				armasOcorrencia.setCodigoArma(rs.getInt("codigoArma"));
				armasOcorrencia.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
				armasOcorrencia.setSerieArma(rs.getString("serieArma"));
				armasOcorrencia.setTipoArma(rs.getString("tipoArma"));
				armasOcorrencia.setFuncionamentoArma(rs.getString("funcionamentoArma"));
				armasOcorrencia.setMarcaArma(rs.getString("marcaArma"));
				armasOcorrencia.setCalibreArma(rs.getString("calibreArma"));
				armasOcorrencia.setCapacidadeArma(rs.getString("capacidadeArma"));
				armasOcorrencia.setInformacoesArama(rs.getString("informacoesArma"));
				lista.add(armasOcorrencia);
			}
			
			return lista;
		} catch (Exception e) {
			
			System.out.println("Erro ao Salvar Arma na Ocorrencia!" + e);
			JOptionPane.showMessageDialog(null, "Erro ao  Salvar Arma na Ocorrencia! Tente novamente ou fale com o Administrador.");
			return null;
		}
	}
	
	public void removerArmaOcorrencia(ArmasOcorrenciaBean arma) {
		String sql = "DELETE FROM tblarmasocorrencia WHERE codigoArma = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, arma.getCodigoArma());
			pst.execute();
			connection.commit();
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao Remover Arma na Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao  Remover Arma na Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
		
	}

}
