package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ViaturaBean;
import connection.SingleConnection;

public class ViaturaDao {
	Connection connection;
	
	public ViaturaDao() {
		connection = SingleConnection.getConnection();
	}
	
	public void cadastraViatura(ViaturaBean viatura) {
		
		String sql = "INSERT INTO tblviatura (codigoVtr,placaVtr,marcaVtr,chassiVtr,corVtr,anoVtr) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, viatura.getCodigoViatura());
			pst.setString(2, viatura.getPlacaViatura());
			pst.setString(3, viatura.getMarcaViatura());
			pst.setString(4, viatura.getChassiViatura());
			pst.setString(5, viatura.getCorViatura());
			pst.setString(6, viatura.getAnoViatura());
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
	public void alterarViatura(ViaturaBean viatura) {
		
		String sql = "UPDATE tblviatura SET  codigoVtr = ?, placaVtr = ?, marcaVtr = ?, chassiVtr = ?, corVtr = ?, anoVtr = ? WHERE codigoVtr = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, viatura.getCodigoViatura());
			pst.setString(2, viatura.getPlacaViatura());
			pst.setString(3, viatura.getMarcaViatura());
			pst.setString(4, viatura.getChassiViatura());
			pst.setString(5, viatura.getCorViatura());
			pst.setString(6, viatura.getAnoViatura());
			pst.setInt(7, viatura.getCodigoViatura());
			pst.executeUpdate();
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
	
	
	
	public ViaturaBean consultaViaturaPorCodigo(ViaturaBean viatura) {
		ViaturaBean viaturaBean = new ViaturaBean();
		String sql = "SELECT * FROM tblViatura WHERE codigoVtr = ?";		
		try {
			
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, viatura.getCodigoViatura());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				viaturaBean.setCodigoViatura(rs.getInt("codigoVtr"));
				viaturaBean.setPlacaViatura(rs.getString("placaVtr"));
				viaturaBean.setMarcaViatura(rs.getString("marcaVtr"));
				viaturaBean.setChassiViatura(rs.getString("chassiVtr"));
				viaturaBean.setCorViatura(rs.getString("corVtr"));
				viaturaBean.setAnoViatura(rs.getString("anoVtr"));
				
			}
			
			return viaturaBean;
		} catch (Exception e) {
			return null;
		}
		
	}
	public List<ViaturaBean> consultaTotalViaturas(ViaturaBean viaturaBean){
		List<ViaturaBean> listaViaturas = new ArrayList<ViaturaBean>();
		
		String sql = "SELECT * FROM tblViatura WHERE codigoVtr LIKE ? AND placaVtr LIKE ? AND marcaVtr LIKE ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, "%"+(viaturaBean.getCodigoViatura() == null ? "" : viaturaBean.getCodigoViatura())+"%");
			pst.setString(2, "%"+viaturaBean.getPlacaViatura()+"%");
			pst.setString(3, "%"+viaturaBean.getMarcaViatura()+"%");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				ViaturaBean vtrBean = new ViaturaBean();
				vtrBean.setCodigoViatura(rs.getInt("codigoVtr"));
				vtrBean.setPlacaViatura(rs.getString("placaVtr"));
				vtrBean.setMarcaViatura(rs.getString("marcaVtr"));
				vtrBean.setChassiViatura(rs.getString("chassiVtr"));
				vtrBean.setCorViatura(rs.getString("corVtr"));
				vtrBean.setAnoViatura(rs.getString("anoVtr"));
				
				listaViaturas.add(vtrBean);
			
			}
			
			return listaViaturas;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public void removerViatura(ViaturaBean viaturaBean) {
		String sql = "DELETE FROM tblViatura WHERE codigoVtr = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, viaturaBean.getCodigoViatura());
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

}
