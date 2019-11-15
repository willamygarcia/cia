package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.VeiculosOcorrenciaBean;
import connection.SingleConnection;

public class VeiculoOcorrenciaDao {
		
	private Connection connection;
	
	public VeiculoOcorrenciaDao() {
		connection = SingleConnection.getConnection();
	}
	
	public void salvarVeiculoOcoDao(VeiculosOcorrenciaBean veiculo) {
		
		String sql = "INSERT INTO tblveiculosocorrencia (placaVeiculoOco, marcaVeiculoOco, modeloVeiculoOco, tipoVeiculoOco, corVeiculoOco,"
				+ " anoFabVeiculoOco, anoModVeiculoOco, codigoOcorrencia) VALUES(?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, veiculo.getPlacaVeiculoOco());
			pst.setString(2, veiculo.getMaracaVeiculoOco());
			pst.setString(3, veiculo.getModeloVeiculoOco());
			pst.setString(4, veiculo.getTipoVeiculoOco());
			pst.setString(5, veiculo.getCorVeiculoOco());
			pst.setInt(6, veiculo.getAnoFabVeiculoOco());
			pst.setInt(7, veiculo.getAnoModVeiculoOco());
			pst.setInt(8, veiculo.getCodigoOcorrencia());
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
	public List<VeiculosOcorrenciaBean> consultaTotalVeiculos(VeiculosOcorrenciaBean veiculo){
		String sql ="SELECT * FROM tblveiculosocorrencia WHERE codigoOcorrencia = ?";
		List<VeiculosOcorrenciaBean> listaVeiculos = new ArrayList<VeiculosOcorrenciaBean>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, veiculo.getCodigoOcorrencia());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				VeiculosOcorrenciaBean veiculos = new VeiculosOcorrenciaBean();
				veiculos.setCodigoVeiculoOco(rs.getInt("codigoVeiculoOco"));
				veiculos.setCodigoOcorrencia(rs.getString("codigoOcorrencia"));
				veiculos.setPlacaVeiculoOco(rs.getString("placaVeiculoOco"));
				veiculos.setMaracaVeiculoOco(rs.getString("marcaVeiculoOco"));
				veiculos.setModeloVeiculoOco(rs.getString("modeloVeiculoOco"));
				veiculos.setTipoVeiculoOco(rs.getString("tipoVeiculoOco"));
				veiculos.setCorVeiculoOco(rs.getString("corVeiculoOco"));
				veiculos.setAnoFabVeiculoOco(rs.getString("anoFabVeiculoOco"));
				veiculos.setAnoModVeiculoOco(rs.getString("anoModVeiculoOco"));
				
				listaVeiculos.add(veiculos);
			}
			
			return listaVeiculos;
			
		}catch(Exception e) {
			
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void removerVeiculoOcorrencia(VeiculosOcorrenciaBean veiculo) {
		String sql = " DELETE FROM tblveiculosocorrencia WHERE codigoVeiculoOco = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, veiculo.getCodigoVeiculoOco());
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			
			try {
				connection.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		}
		
	}
	
}
