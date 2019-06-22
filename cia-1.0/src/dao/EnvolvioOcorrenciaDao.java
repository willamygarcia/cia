package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			connection.commit();
		}catch (Exception e) {
			System.out.println("Erro ao cadastrar envolvidos  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao cadastrar envolvidos na Ocorrencia! Tente novamente ou fale com o Administrador.");
			try {
				connection.rollback();
			} catch (SQLException e1) {
				System.out.println("Erro ao salvar a Ocorrencia!" + e1);
				JOptionPane.showMessageDialog(null, "Erro ao Salvar a Ocorrencia! Tente novamente ou fale com o Administrador.");
			}
		}
	}
	
	public List<EnvolvidoOcorrenciaBean> consultaEnvolvidosTotal(EnvolvidoOcorrenciaBean envolvido){
		List<EnvolvidoOcorrenciaBean> lista = new ArrayList<EnvolvidoOcorrenciaBean>();
		String sql ="SELECT * FROM tblenvolvidoocorrencia WHERE codigoOcorrencia = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, envolvido.getCodigoOcorrenia());
			ResultSet rs = pst.executeQuery();
		
			while(rs.next()) {
				EnvolvidoOcorrenciaBean envolvidoOcorrenciaBean = new EnvolvidoOcorrenciaBean();
				envolvidoOcorrenciaBean.setCodigoEnvolvidoOcorrencia(rs.getInt("codigoEnvolvidoOcorrencia"));
				envolvidoOcorrenciaBean.setCodigoOcorrenia(rs.getInt("codigoOcorrencia"));
				envolvidoOcorrenciaBean.setGraduacaoEnvolvidoOcorrencia(rs.getString("graduacaoEnvolvidoOcorrencia"));
				envolvidoOcorrenciaBean.setNumeralEnvolvidoOcorrencia(rs.getString("numeralEnvolvidoOcorrencia"));
				envolvidoOcorrenciaBean.setNomeGuerraEnvolvidoOcorrencia(rs.getString("nomeGuerraEnvolvidoOcorrencia"));
				envolvidoOcorrenciaBean.setMatriculaEnvolvidoOcorrencia(rs.getString("matriculaEnvolvidoOcorrencia"));
				envolvidoOcorrenciaBean.setInformacoesEnvolvidoOcorrencia(rs.getString("informacoesEnvolvidoOcorrencia"));
				
				lista.add(envolvidoOcorrenciaBean);
			}
			
			return lista;
		}catch (Exception e) {
			System.out.println("Erro ao Consultar envolvidos  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Consultar envolvidos na Ocorrencia! Tente novamente ou fale com o Administrador.");
			return null;
		}
		
		
	}
	
	public void removerEnvolvidoOcorrencia(EnvolvidoOcorrenciaBean envolvido) {
		String sql = "DELETE FROM tblenvolvidoocorrencia WHERE codigoEnvolvidoOcorrencia = ? ";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, envolvido.getCodigoEnvolvidoOcorrencia());
			pst.execute();
			connection.commit();
		}catch (Exception e) {
			System.out.println("Erro ao Remover envolvidos  na Ocorrencia! :" + e);
			JOptionPane.showMessageDialog(null, "Erro ao Remover envolvidos na Ocorrencia! Tente novamente ou fale com o Administrador.");		
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

}
