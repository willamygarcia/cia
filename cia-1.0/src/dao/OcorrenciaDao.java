package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			conect.commit();
		} catch (Exception e) {
			System.out.println("Erro ao iniciar a Ocorrencia!" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			try {
				conect.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao salvar a Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
		
	}
	
	public void salvarOcorrencia(OcorrenciaBean ocorrencia) {
		String sql = "INSERT INTO tblocorrencia  (mikeOcorrencia, inqueritoOcorrencia, boletimOcorrencia," 
												  +" outrosOcorrencia, graduacaoOcorrencia, numeralOcorrencia, nomeGuerraOcorrencia, matriculaOcorrencia,"
												  + "dataHoraOcorrencia, dataHoraInicioOcorrencia, dataHoraFimOcorrencia, delegaciaOcorrencia, tipoOcorrencia,"
												  + "logradouroOcorrencia, bairroOcorrencia,cidadeOcorrencia, pontoReferenciaOcorrencia, delegadoOcorrencia,"
												  + "escrivaoOcorrencia, autoridadeMilitarOcorrencia, fotoDiversa01Ocorrencia, fotoDiversa02Ocorrencia, "
												  + "fotoDiversa03Ocorrencia, fotoDiversa04Ocorrencia, fotoDiversa05Ocorrencia, historicoOcorrencia)"
												  + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pst.setString(9, ocorrencia.getDataHoraOcorrencia());
			pst.setString(10, ocorrencia.getDataHoraInicioComunicacao());
			pst.setString(11, ocorrencia.getDataHoraFimComunicacao());
			pst.setString(12, ocorrencia.getDelegaciaOcorrencia());
			pst.setString(13, ocorrencia.getTipoOcorrencia());
			pst.setString(14, ocorrencia.getEnderecoOcorrencia());
			pst.setString(15, ocorrencia.getBairroOcorrencia());
			pst.setString(16, ocorrencia.getCidadeOcorrencia());
			pst.setString(17, ocorrencia.getReferenciaOcorrencia());
			pst.setString(18, ocorrencia.getDelegadoOcorrencia());
			pst.setString(19, ocorrencia.getEscrivaoOcorrencia());
			pst.setString(20, ocorrencia.getAutoridadeMilitarOcorrencia());
			pst.setString(21, ocorrencia.getFotosDiversasOcorrencia01());
			pst.setString(22, ocorrencia.getFotosDiversasOcorrencia02());
			pst.setString(23, ocorrencia.getFotosDiversasOcorrencia03());
			pst.setString(24, ocorrencia.getFotosDiversasOcorrencia04());
			pst.setString(25, ocorrencia.getFotosDiversasOcorrencia05());
			pst.setString(26, ocorrencia.getHistoricoOcorrencia());
			pst.execute();
			conect.commit();
		}catch(Exception e) {
			System.out.println("Erro ao salvar a Ocorrencia!" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			
			try {
				conect.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao salvar a Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
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
