package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.DocumentosOcorrenciaBean;
import connection.SingleConnection;

public class DocumentoOcorrenciaDao {
	
	private Connection connection ;
	public DocumentoOcorrenciaDao() {
		
		connection = SingleConnection.getConnection();
	}
	
	public void salvarDocumento(DocumentosOcorrenciaBean documento) {
		
		String sql = "INSERT INTO tblDocumentoOcorrencia(codigoOcorrencia,descricaoOcorrencia,documentoOcorrencia) VALUES(?,?,?) ";
		try {
			
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, documento.getCodigoDocumentoOcorrencia());
			pst.setString(2, documento.getDescricaoDocumento());
			pst.setString(3, documento.getDocumento());
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			
			try {
				connection.rollback();
				
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
		
		}
	}
	
	public List<DocumentosOcorrenciaBean> consultaDocumentoTotal(DocumentosOcorrenciaBean documento){
		
		String sql = "SELECT * FROM tbldocumentoocorrencia WHERE codigoOcorrencia = ?";
		List<DocumentosOcorrenciaBean> listaDocumentos = new ArrayList<DocumentosOcorrenciaBean>();
		
		try{
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, documento.getCodigoDocumentoOcorrencia());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
			DocumentosOcorrenciaBean doBean = new DocumentosOcorrenciaBean();
				doBean.setCodigoDocumento(rs.getInt("codigoDocumento"));
				doBean.setCodigoDocumentoOcorrencia(rs.getInt("codigoOcorrencia"));
				doBean.setDescricaoDocumento(rs.getString("descricaoOcorrencia"));
				doBean.setDocumento(rs.getString("documentoOcorrencia"));
				listaDocumentos.add(doBean);
							
			}
			
			return listaDocumentos;
		}catch(Exception e) {
			return null;
		}
		
		
	}
	public DocumentosOcorrenciaBean consultaDocumento(DocumentosOcorrenciaBean documento) {
		
		String sql = "SELECT * FROM tbldocumentoocorrencia WHERE codigoDocumento = ?";
		DocumentosOcorrenciaBean documentoBean = new DocumentosOcorrenciaBean();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, documento.getCodigoDocumento());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				documentoBean.setCodigoDocumento(rs.getInt("codigoDocumento"));
				documentoBean.setCodigoDocumentoOcorrencia(rs.getInt("codigoOcorrencia"));
				documentoBean.setDescricaoDocumento(rs.getString("descricaoOcorrencia"));
				documentoBean.setDocumento(rs.getString("documentoOcorrencia"));
			}
			
			return documentoBean;
			
		}catch(Exception e) {
		
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	public void removerDocumento(DocumentosOcorrenciaBean documento) {
		String sql = "DELETE FROM tbldocumentoocorrencia WHERE codigoDocumento = ?";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql) ;
			pst.setInt(1, documento.getCodigoDocumento());
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
	

}
