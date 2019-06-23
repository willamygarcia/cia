package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<OrdenamentoOcorrenciaBean> consultaTotalOrdenamento(OrdenamentoOcorrenciaBean ordenamento){
		List<OrdenamentoOcorrenciaBean> lista = new ArrayList<OrdenamentoOcorrenciaBean>();
		String sql = " SELECT * FROM tblordenamentoocorrencia WHERE codigoOcorrencia = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, ordenamento.getCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				OrdenamentoOcorrenciaBean ordenamentoOco = new OrdenamentoOcorrenciaBean();
				ordenamentoOco.setCodigoOrdenamentoOcorrencia(rs.getInt("codigoOrdenamentoOcorrencia"));
				ordenamentoOco.setCodigoOcorrencia(rs.getInt("codigoOcorrencia"));
				ordenamentoOco.setLeiOrdenamentoOcorrencia(rs.getString("leiOrdenamentoOcorrencia"));
				ordenamentoOco.setArtigoOrdenamentoOcorrencia(rs.getString("artigoOrdenamentoOcorrencia"));
				ordenamentoOco.setParagrafoOrdenamentoOcorrencia(rs.getString("paragrafoOrdenamentoOcorrencia"));
				
				lista.add(ordenamentoOco);
				
			}
			
			return lista;
			
		} catch (Exception e) {
			System.out.println("Erro ao consultar ordenamento  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao consultar ordenamento na Ocorrencia! Tente novamente ou fale com o Administrador.");
			return null;
		}
	}
	
	public void removerOrdenamento(OrdenamentoOcorrenciaBean ordenamento) {
		
		String sql = "DELETE FROM tblordenamentoocorrencia WHERE codigoOrdenamentoOcorrencia = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, ordenamento.getCodigoOrdenamentoOcorrencia());
			pst.execute();
			connection.commit();
		}catch(Exception e) {
			System.out.println("Erro ao remover ordenamento  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao remover ordenamento na Ocorrencia! Tente novamente ou fale com o Administrador.");
			try {
				connection.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao remover ordenamento  na Ocorrencia! :" + e);
				JOptionPane.showMessageDialog(null, "Erro ao remover ordenamento na Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
	}
	

}
