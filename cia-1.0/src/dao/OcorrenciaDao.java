package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			try {
				conect.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
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
			while(rs.next()){
			ocorrencia.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
			ocorrencia.setMikeOcorrencia(rs.getString("mikeOcorrencia"));
			ocorrencia.setInqueritoOcorrencia(rs.getString("inqueritoOcorrencia"));
			ocorrencia.setBoOcorrencia(rs.getString("boletimOcorrencia"));
			ocorrencia.setOutrosOcorrencia(rs.getString("outrosOcorrencia"));
			ocorrencia.setGraduacaoOcorrencia(rs.getString("graduacaoOcorrencia"));
			ocorrencia.setNumeralOcorrencia(rs.getString("numeralOcorrencia"));
			ocorrencia.setNomeGuerraOcorrencia(rs.getString("nomeGuerraOcorrencia"));
			ocorrencia.setMatriculaOcorrencia(rs.getString("matriculaOcorrencia"));
			}
			return ocorrencia;
			
		} catch (Exception e) {
			System.out.println("Erro ao consultar por Codigo a Ocorrencia! :" + e);
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fala com o Administrador.");
			return null;
		}
	}
	
	public OcorrenciaBean consultaEditar(OcorrenciaBean ocorrenciaBean) {
		String sql = "SELECT * FROM tblocorrencia WHERE codigoOcorrencia = ?";
		OcorrenciaBean ocorrencia = new OcorrenciaBean(); 
		try {
			PreparedStatement pst =  conect.prepareStatement(sql);
			pst.setInt(1, ocorrenciaBean.getCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				ocorrencia.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
				ocorrencia.setMikeOcorrencia(rs.getString("mikeOcorrencia"));
				ocorrencia.setInqueritoOcorrencia(rs.getString("inqueritoOcorrencia"));
				ocorrencia.setBoOcorrencia(rs.getString("boletimOcorrencia"));
				ocorrencia.setOutrosOcorrencia(rs.getString("outrosOcorrencia"));
				ocorrencia.setGraduacaoOcorrencia(rs.getString("graduacaoOcorrencia"));
				ocorrencia.setNumeralOcorrencia(rs.getString("numeralOcorrencia"));
				ocorrencia.setNomeGuerraOcorrencia(rs.getString("nomeGuerraOcorrencia"));
				ocorrencia.setMatriculaOcorrencia(rs.getString("matriculaOcorrencia"));
				ocorrencia.setDataHoraOcorrencia((rs.getString("dataHoraOcorrencia") == null) ? "" : rs.getString("dataHoraOcorrencia"));
				ocorrencia.setDataHoraInicioComunicacao((rs.getString("dataHoraInicioOcorrencia") == null) ? "" : rs.getString("dataHoraInicioOcorrencia"));
				ocorrencia.setDataHoraFimComunicacao((rs.getString("dataHoraFimOcorrencia") == null) ? "" : rs.getString("dataHoraFimOcorrencia"));
				ocorrencia.setDelegaciaOcorrencia(rs.getString("delegaciaOcorrencia"));
				ocorrencia.setTipoOcorrencia(rs.getString("tipoOcorrencia"));
				ocorrencia.setEnderecoOcorrencia(rs.getString("logradouroOcorrencia"));
				ocorrencia.setBairroOcorrencia(rs.getString("bairroOcorrencia"));
				ocorrencia.setCidadeOcorrencia(rs.getString("cidadeOcorrencia"));
				ocorrencia.setReferenciaOcorrencia(rs.getString("pontoReferenciaOcorrencia"));
				ocorrencia.setDelegadoOcorrencia(rs.getString("delegadoOcorrencia"));
				ocorrencia.setEscrivaoOcorrencia(rs.getString("escrivaoOcorrencia"));
				ocorrencia.setAutoridadeMilitarOcorrencia(rs.getString("autoridadeMilitarOcorrencia"));
				ocorrencia.setFotosDiversasOcorrencia01(rs.getString("fotoDiversa01Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia02(rs.getString("fotoDiversa02Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia03(rs.getString("fotoDiversa03Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia04(rs.getString("fotoDiversa04Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia05(rs.getString("fotoDiversa05Ocorrencia"));
				ocorrencia.setHistoricoOcorrencia(rs.getString("historicoOcorrencia"));
							
			}
			
			return ocorrencia;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public String utimoCodigo() {
		String sql ="SELECT (MAX(codigoOcorrencia)) AS codigo FROM tblocorrencia";
		String rsCodigo = null;
		try {
			PreparedStatement pst = conect.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				rsCodigo = rs.getString("codigo");
			}
			
			if(rsCodigo.equals(null) || rsCodigo.equals("")) {
				return "1";
			}else {
				return rsCodigo;
			}
			
			
		} catch (Exception e) {
			System.out.println("Erro ao iniciar a Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Iniciar a Ocorrencia! Tente novamente ou fala com o Administrador.");
			return null;
		}
		
		
	}
	
	public void alterarOcorrencia(OcorrenciaBean ocorrencia) {
		String sql = "UPDATE tblocorrencia SET mikeOcorrencia = ?,"
											+ "inqueritoOcorrencia = ?,"
											+ "boletimOcorrencia = ?,"
											+ "outrosOcorrencia = ?,"
											+ "graduacaoOcorrencia = ?,"
											+ "numeralOcorrencia = ?,"
											+ "nomeGuerraOcorrencia = ?,"
											+ "matriculaOcorrencia = ?,"
											+ "dataHoraOcorrencia = ?,"
											+ "dataHoraInicioOcorrencia = ?,"
											+ "dataHoraFimOcorrencia = ?,"
											+ "delegaciaOcorrencia = ?,"
											+ "tipoOcorrencia = ?," 
											+ "logradouroOcorrencia = ?,"
											+ "bairroOcorrencia = ?,"
											+ "cidadeOcorrencia = ?,"
											+ "pontoReferenciaOcorrencia = ?,"
											+ "delegadoOcorrencia = ?,"
											+ "escrivaoOcorrencia = ?,"
											+ "autoridadeMilitarOcorrencia = ?,"
											+ "fotoDiversa01Ocorrencia = ?,"
											+ "fotoDiversa02Ocorrencia = ?,"
											+ "fotoDiversa03Ocorrencia = ?,"
											+ "fotoDiversa04Ocorrencia = ?,"
											+ "fotoDiversa05Ocorrencia = ?,"
											+ "historicoOcorrencia = ?"
											+ "WHERE codigoOCorrencia = ?";
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
				pst.setInt(27, ocorrencia.getCodigoOcorrencia());
				pst.executeUpdate();
				conect.commit();
			}catch(Exception e) {
				System.out.println("Erro ao salvar a Ocorrencia! " + e);
				JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
				
				try {
					conect.rollback();
				} catch (SQLException e1) {
					System.out.println("Erro ao salvar a Ocorrencia!" + e1);
					JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
				}
			}
		
	}
	
	public List<OcorrenciaBean> consultaTotalOcorrencia(OcorrenciaBean ocorrenciaBean){
		String sql = "SELECT * FROM tblocorrencia WHERE mikeOcorrencia LIKE ? AND nomeGuerraOcorrencia LIKE ? AND bairroOcorrencia LIKE ?";// AND dataHoraOcorrencia BETWEEN (?) AND (?)";
		List<OcorrenciaBean> lista = new ArrayList<OcorrenciaBean>();
		try {
			PreparedStatement pst = conect.prepareStatement(sql);
			pst.setString(1, "%"+ocorrenciaBean.getMikeOcorrencia()+"%");
			pst.setString(2, "%"+ocorrenciaBean.getNomeGuerraOcorrencia()+"%");
			pst.setString(3, "%"+ocorrenciaBean.getBairroOcorrencia()+"%");
			//pst.setString(4, (ocorrenciaBean.getDataHoraOcorrencia() == "") ? "1900-01-01" : ocorrenciaBean.getDataHoraOcorrencia());
			//pst.setString(5, (ocorrenciaBean.getDataHoraOcorrencia() == "") ? "9999-01-01" : ocorrenciaBean.getDataHoraOcorrencia());
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				OcorrenciaBean ocorrencia = new OcorrenciaBean();
				ocorrencia.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
				ocorrencia.setMikeOcorrencia(rs.getString("mikeOcorrencia"));
				ocorrencia.setInqueritoOcorrencia(rs.getString("inqueritoOcorrencia"));
				ocorrencia.setBoOcorrencia(rs.getString("boletimOcorrencia"));
				ocorrencia.setOutrosOcorrencia(rs.getString("outrosOcorrencia"));
				ocorrencia.setGraduacaoOcorrencia(rs.getString("graduacaoOcorrencia"));
				ocorrencia.setNumeralOcorrencia(rs.getString("numeralOcorrencia"));
				ocorrencia.setNomeGuerraOcorrencia(rs.getString("nomeGuerraOcorrencia"));
				ocorrencia.setMatriculaOcorrencia(rs.getString("matriculaOcorrencia"));
				ocorrencia.setDataHoraOcorrencia((rs.getString("dataHoraOcorrencia") == null) ? "" : rs.getString("dataHoraOcorrencia"));
				ocorrencia.setDataHoraInicioComunicacao((rs.getString("dataHoraInicioOcorrencia") == null) ? "" : rs.getString("dataHoraInicioOcorrencia"));
				ocorrencia.setDataHoraFimComunicacao((rs.getString("dataHoraFimOcorrencia") == null) ? "" : rs.getString("dataHoraFimOcorrencia"));
				ocorrencia.setDelegaciaOcorrencia(rs.getString("delegaciaOcorrencia"));
				ocorrencia.setTipoOcorrencia(rs.getString("tipoOcorrencia"));
				ocorrencia.setEnderecoOcorrencia(rs.getString("logradouroOcorrencia"));
				ocorrencia.setBairroOcorrencia(rs.getString("bairroOcorrencia"));
				ocorrencia.setCidadeOcorrencia(rs.getString("cidadeOcorrencia"));
				ocorrencia.setReferenciaOcorrencia(rs.getString("pontoReferenciaOcorrencia"));
				ocorrencia.setDelegadoOcorrencia(rs.getString("delegadoOcorrencia"));
				ocorrencia.setEscrivaoOcorrencia(rs.getString("escrivaoOcorrencia"));
				ocorrencia.setAutoridadeMilitarOcorrencia(rs.getString("autoridadeMilitarOcorrencia"));
				ocorrencia.setFotosDiversasOcorrencia01(rs.getString("fotoDiversa01Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia02(rs.getString("fotoDiversa02Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia03(rs.getString("fotoDiversa03Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia04(rs.getString("fotoDiversa04Ocorrencia"));
				ocorrencia.setFotosDiversasOcorrencia05(rs.getString("fotoDiversa05Ocorrencia"));
				ocorrencia.setHistoricoOcorrencia(rs.getString("historicoOcorrencia"));
				
				lista.add(ocorrencia);
			}
			
			return lista;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
			
		}
	}

}
