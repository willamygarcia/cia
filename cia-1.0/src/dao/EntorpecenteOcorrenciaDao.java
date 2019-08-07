package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.EntorpecentesOcorrenciaBean;
import connection.SingleConnection;

public class EntorpecenteOcorrenciaDao {
	
	private Connection connection;
	public EntorpecenteOcorrenciaDao() {
		
		connection = SingleConnection.getConnection();
	}
	
	public void salvarEntorpecentes(EntorpecentesOcorrenciaBean entorpecente) {
		String sql = "INSERT INTO tblentorpecentesocorrencia (nomeEntorpecenteOcorrencia,qtdUnEntorpecenteOcorrencia,qtdKgEntorpecenteOcorrencia,informacoesEntorpecenteOcorrencia,entorpCodigoOcorrencia)"
				+ " VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, entorpecente.getNomeEntorpecenteOcorrencia());
			pst.setInt(2, entorpecente.getQtdUnEntorpecenteOcorrencia());
			pst.setDouble(3, entorpecente.getQtdKgEntorpecenteOcorrencia());
			pst.setString(4, entorpecente.getInformacoesEntorpecenteOcorrencia());
			pst.setInt(5, entorpecente.getEntorpCodigoOcorrencia());
			pst.execute();
			connection.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}		
		
	}
	
	public List<EntorpecentesOcorrenciaBean> consultaEntorpecentes(EntorpecentesOcorrenciaBean entorpecentesOcorrenciaBean){
		String sql ="SELECT * FROM tblentorpecentesocorrencia WHERE entorpCodigoOcorrencia = ?";
		List<EntorpecentesOcorrenciaBean> lista = new ArrayList<EntorpecentesOcorrenciaBean>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, entorpecentesOcorrenciaBean.getEntorpCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				EntorpecentesOcorrenciaBean entorpecentes = new EntorpecentesOcorrenciaBean();
				entorpecentes.setCodigoEntorpecenteOcorrencia(rs.getString("codigoEntorpecenteOcorrencia"));
				entorpecentes.setNomeEntorpecenteOcorrencia(rs.getString("nomeEntorpecenteOcorrencia"));
				entorpecentes.setQtdUnEntorpecenteOcorrencia(rs.getString("qtdUnEntorpecenteOcorrencia"));
				entorpecentes.setQtdKgEntorpecenteOcorrencia(rs.getString("qtdKgEntorpecenteOcorrencia"));
				entorpecentes.setInformacoesEntorpecenteOcorrencia(rs.getString("informacoesEntorpecenteOcorrencia").replaceAll("\n", "<br>"));
				entorpecentes.setEntorpCodigoOcorrencia(rs.getString("entorpCodigoOcorrencia"));
				lista.add(entorpecentes);
			}
			
			return lista;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void removerEntorpecentes(EntorpecentesOcorrenciaBean entorpecentes) {
		
		String sql = "DELETE FROM  tblentorpecentesocorrencia WHERE codigoEntorpecenteOcorrencia = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, entorpecentes.getCodigoEntorpecenteOcorrencia());
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
	}
	

}
