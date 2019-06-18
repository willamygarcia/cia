package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import beans.OcorrenciaBean;
import connection.SingleConnection;

public class OcorrenciaDao {
	private Connection conect;
	
	public OcorrenciaDao() {
		conect = SingleConnection.getConnection();
	}
	
	public void iniciarOcorrencia(OcorrenciaBean ocorrencia) {
		String sql = "INSERT INTO tblocorrencia (mikeOcorrencia, inqueritoOcorrencia, boletimOcorrencia,"
				+ " outrosOcorrencia, graduacaoOcorrencia, numeralOcorrencia, nomeGuerraOcorrencia, matriculaOcorrencia) VALUES(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conect.prepareStatement(sql);
			pst.setString(1, ocorrencia.getMikeOcorrencia());
			pst.setString(2, ocorrencia.getInqueritoOcorrencia());
			pst.setString(3, ocorrencia.getBoOcorrencia());
			pst.setString(4, ocorrencia.getOutrosOcorrencia());	
			pst.setString(5, ocorrencia.getGraduacaoOcorrencia());
			pst.setString(6, ocorrencia.getNumeralOcorrencia());
			pst.setString(7, ocorrencia.getNomeGuerraOcorrencia());
			pst.setString(8, ocorrencia.getMatriculaOcorrencia());
			pst.execute();
		} catch (Exception e) {
			System.out.println("Erro ao iniciar a Ocorrencia!" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fala com o Administrador.");
		}
		
	}
	
	public OcorrenciaBean consultaOcorenciaPorCodigo(OcorrenciaBean ocorrenciaBean) {
		String sql = "SELECT * FROM tblocorrencia WHERE codigoOcorrencia = ?";
		OcorrenciaBean ocorrencia = new OcorrenciaBean();
		try {
			PreparedStatement pst = conect.prepareStatement(sql);
			pst.setInt(1, ocorrenciaBean.getCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			ocorrencia.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
			ocorrencia.setMikeOcorrencia(rs.getString("mikeOcorrencia"));
			ocorrencia.setInqueritoOcorrencia(rs.getString("inqueritoOcorrencia"));
			ocorrencia.setBoOcorrencia(rs.getString("boletimOcorrencia"));
			ocorrencia.setOutrosOcorrencia(rs.getString("outrosOcorrencia"));
			ocorrencia.setGraduacaoOcorrencia(rs.getString("graduacaoOcorrencia"));
			ocorrencia.setNumeralOcorrencia(rs.getString("numeralOcorrencia"));
			ocorrencia.setNomeGuerraOcorrencia(rs.getString("nomeGuerraOcorrencia"));
			ocorrencia.setMatriculaOcorrencia(rs.getString("matriculaOcorrencia"));
			return ocorrencia;
			
		} catch (Exception e) {
			System.out.println("Erro ao iniciar a Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fala com o Administrador.");
			return null;
		}
	}
	
	public String utimoCodigo() {
		String sql ="SELECT (MAX(codigoOcorrencia)+1) AS codigo FROM tblocorrencia";
		String rsCodigo = null;
		try {
			PreparedStatement pst = conect.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				rsCodigo = rs.getString("codigo");
			}
			
			return rsCodigo;
			
		} catch (Exception e) {
			System.out.println("Erro ao iniciar a Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fala com o Administrador.");
			return null;
		}
		
		
	}

}
