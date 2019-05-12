package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.CidadaoBean;

import connection.SingleConnection;

public class CidadaoDao {
	private Connection connection;

	public CidadaoDao() {
		connection = SingleConnection.getConnection();
	}
	
// CADASTRO DE CIDADÃO
	public void cadastrarCidadão(CidadaoBean cidadaoBean) {
		String sql =  "INSERT INTO tblcidadao (nomeCidadao ,alcunhaCidadao ,nascimentoCidadao ,"
				+ "telefoneCidadao ,rgCidadao ,cpfCidadao , orgaoEmissor ,ufCidadao ,"
				+ "maeCidadao ,paiCidadao ,"
				+ "cepCidadao ,logradouroCidadao ,numeroCidado ,"
				+ "complementoCidadao ,bairroCidado ,cidadeCidadao ,ufEndCidadao ,paisCiadadao ,"
				+ "dataInfracaoCidadao ,delegaciaInfracaoCidadao ,faccaoCidadao ,"
				+ "endOcorrenciaCidadao , bairroOcorrenciaCidadao ,cidadeOcorrenciaCidadao ,referenciaCidadao ,"
				+ "informacaoJudicial ,"
				+ "tatuRostoCidadao ,tatuPescocCidadao ,"
				+ "tatuToraxCidadao ,"
				+ "tatuBracoDireitoCidadao ,tatuBracoEsquerdoCidadao ,"
				+ "tatuPernaDireitaCidadao ,tatuPernaEsquerdaCidadao ,"
				+ "tatuCostasCidadao ,"
				+ "fotoFrenteCidadao ,fotoLadoCidadao ,fotoCostaCidadao ,fotoDiversa01 ,fotoDiversa02 ,"
				+ "historicoCidadao ) "
				+"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, cidadaoBean.getNome());
			pst.setString(2, cidadaoBean.getAlcunha());
			pst.setString(3, cidadaoBean.getNascimento());
			pst.setString(4, (cidadaoBean.getTelefone() == null) ? null :  cidadaoBean.getTelefone().toString());
			pst.setString(5, (cidadaoBean.getRg() == null) ? null :  cidadaoBean.getRg().toString());
			pst.setString(6, (cidadaoBean.getCpf() == null) ? null :  cidadaoBean.getCpf().toString());
			pst.setString(7, cidadaoBean.getOrgaoEmissor());
			pst.setString(8, cidadaoBean.getUf());
			pst.setString(9, cidadaoBean.getMae());
			pst.setString(10, cidadaoBean.getPai());
			pst.setString(11, (cidadaoBean.getCep() == null) ? null : cidadaoBean.getCep().toString());
			pst.setString(12, cidadaoBean.getEndereco());
			pst.setString(13, (cidadaoBean.getNumero() == null) ? null : cidadaoBean.getNumero().toString());
			pst.setString(14, cidadaoBean.getComplemento());
			pst.setString(15, cidadaoBean.getBairro());
			pst.setString(16, cidadaoBean.getCidade());
			pst.setString(17, cidadaoBean.getUfEndereco());
			pst.setString(18, cidadaoBean.getPais());
			pst.setString(19, cidadaoBean.getDataUtimaInfracao());
			pst.setString(20, cidadaoBean.getDelegacia());
			pst.setString(21, cidadaoBean.getFaccao());
			pst.setString(22, cidadaoBean.getEndOcorrencia());
			pst.setString(23, cidadaoBean.getBairroOcorrencia());
			pst.setString(24, cidadaoBean.getCidadeOcorrencia());
			pst.setString(25, cidadaoBean.getReferenciaOcorrencia());
			pst.setString(26, cidadaoBean.getHistoricoJuridico());
			pst.setString(27, cidadaoBean.getTatuRosto());
			pst.setString(28, cidadaoBean.getTatuPescoco());
			pst.setString(29, cidadaoBean.getTatuTorax());
			pst.setString(30, cidadaoBean.getTatuBracoDireito());
			pst.setString(31, cidadaoBean.getTatuBracoEsquerdo());
			pst.setString(32, cidadaoBean.getTatuPernaDireita());
			pst.setString(33, cidadaoBean.getTatuPernaEsquerda());
			pst.setString(34, cidadaoBean.getTatuCostas());
			pst.setString(35, cidadaoBean.getFotoFrente());
			pst.setString(36, cidadaoBean.getFotoLado());
			pst.setString(37, cidadaoBean.getFotoCostas());
			pst.setString(38, cidadaoBean.getFotoDiversas01());
			pst.setString(39, cidadaoBean.getFotoDiversas02());
			pst.setString(40, cidadaoBean.getHistorico());
			
			pst.execute();
			connection.commit();
			
		} catch (Exception e) {
			System.out.print("Erro ao cadastrar Cidadão");
			System.out.print(e);
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (Exception e2) {
				System.out.print(e2);
				e2.printStackTrace();
			}
		}
	
		
	}
// CONSULTA TODOS OS CIDADÃO
	public List<CidadaoBean> consultaTotal(CidadaoBean cidadao) {

		List<CidadaoBean> lista = new ArrayList<CidadaoBean>();
		
		String sql = "SELECT * FROM tblcidadao WHERE nomeCidadao LIKE '%" + cidadao.getNome() + "%' AND maeCidadao LIKE '%" + cidadao.getMae() +
					"%' AND bairroCidado LIKE '%" + cidadao.getBairro() +"%' AND bairroOcorrenciaCidadao LIKE '%" + cidadao.getBairroOcorrencia() + "%'";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CidadaoBean cidadaoBean = new CidadaoBean();
				cidadaoBean.setCodigo(rs.getInt("codigocidadao"));
				cidadaoBean.setNome(rs.getString("nomeCidadao"));
				cidadaoBean.setMae(rs.getString("maeCidadao"));
				cidadaoBean.setNascimento((rs.getString("nascimentoCidadao") == null) ? "" : rs.getString("nascimentoCidadao"));
				cidadaoBean.setEndereco(rs.getString("logradouroCidadao"));
				cidadaoBean.setNumero((rs.getString("numeroCidado") == null) ? "" : rs.getString("numeroCidado"));
				cidadaoBean.setBairro(rs.getString("bairroCidado"));
				cidadaoBean.setCidade(rs.getString("cidadeCidadao"));
				cidadaoBean.setUf(rs.getString("ufEndCidadao"));

				lista.add(cidadaoBean);
			}
			return lista;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}
//CONUSLTAR POR CODIGO
	public CidadaoBean consultaPorCodigo(CidadaoBean cidadao) {


		CidadaoBean cidadaoBean = new CidadaoBean();
		String sql = "SELECT * FROM tblcidadao WHERE codigocidadao = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, cidadao.getCodigo());
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
			
				cidadaoBean.setCodigo(rs.getInt("codigocidadao"));
				cidadaoBean.setNome(rs.getString("nomeCidadao"));
				cidadaoBean.setAlcunha(rs.getString("alcunhaCidadao"));
				cidadaoBean.setNascimento((rs.getString("nascimentoCidadao") == null) ? "" : rs.getString("nascimentoCidadao"));
				cidadaoBean.setTelefone((rs.getString("telefoneCidadao") == null) ? "" : rs.getString("telefoneCidadao"));
				cidadaoBean.setRg((rs.getString("rgCidadao") == null) ? "" : rs.getString("rgCidadao"));
				cidadaoBean.setCpf((rs.getString("cpfCidadao") == null) ? "" : rs.getString("cpfCidadao"));
				cidadaoBean.setOrgaoEmissor(rs.getString("orgaoEmissor"));
				cidadaoBean.setUf(rs.getString("ufCidadao"));
				cidadaoBean.setMae(rs.getString("maeCidadao"));
				cidadaoBean.setPai(rs.getString("paiCidadao"));
				cidadaoBean.setCep((rs.getString("cepCidadao") == null) ? "" : rs.getString("cepCidadao"));
				cidadaoBean.setEndereco(rs.getString("logradouroCidadao"));
				cidadaoBean.setNumero((rs.getString("numeroCidado") == null) ? "" : rs.getString("numeroCidado"));
				cidadaoBean.setComplemento(rs.getString("complementoCidadao"));
				cidadaoBean.setBairro(rs.getString("bairroCidado"));
				cidadaoBean.setCidade(rs.getString("cidadeCidadao"));
				cidadaoBean.setUfEndereco(rs.getString("ufEndCidadao"));
				cidadaoBean.setPais(rs.getString("paisCiadadao"));
				cidadaoBean.setDataUtimaInfracao((rs.getString("dataInfracaoCidadao") == null) ? "" : rs.getString("dataInfracaoCidadao"));
				cidadaoBean.setDelegacia(rs.getString("delegaciaInfracaoCidadao"));
				cidadaoBean.setFaccao(rs.getString("faccaoCidadao"));
				cidadaoBean.setEndOcorrencia(rs.getString("endOcorrenciaCidadao"));
				cidadaoBean.setBairroOcorrencia(rs.getString("bairroOcorrenciaCidadao"));
				cidadaoBean.setCidadeOcorrencia(rs.getString("cidadeOcorrenciaCidadao"));
				cidadaoBean.setReferenciaOcorrencia(rs.getString("referenciaCidadao"));
				cidadaoBean.setHistoricoJuridico(rs.getString("informacaoJudicial"));
				cidadaoBean.setTatuRosto(rs.getString("tatuRostoCidadao"));
				cidadaoBean.setTatuPescoco(rs.getString("tatuPescocCidadao"));
				cidadaoBean.setTatuTorax(rs.getString("tatuToraxCidadao"));
				cidadaoBean.setTatuBracoDireito(rs.getString("tatuBracoDireitoCidadao"));
				cidadaoBean.setTatuBracoEsquerdo(rs.getString("tatuBracoEsquerdoCidadao"));
				cidadaoBean.setTatuPernaDireita(rs.getString("tatuPernaDireitaCidadao"));
				cidadaoBean.setTatuPernaEsquerda(rs.getString("tatuPernaEsquerdaCidadao"));
				cidadaoBean.setTatuCostas(rs.getString("tatuCostasCidadao"));
				cidadaoBean.setFotoFrente(rs.getString("fotoFrenteCidadao"));
				cidadaoBean.setFotoLado(rs.getString("fotoLadoCidadao"));
				cidadaoBean.setFotoCostas(rs.getString("fotoCostaCidadao"));
				cidadaoBean.setFotoDiversas01(rs.getString("fotoDiversa01"));
				cidadaoBean.setFotoDiversas02(rs.getString("fotoDiversa02"));
				cidadaoBean.setHistorico(rs.getString("historicoCidadao"));
				
			}
			return cidadaoBean;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}
	
//EXCLUIR CIDADAO
	public boolean excluir(CidadaoBean cidadao) {
		
		String sql =" DELETE FROM tblcidadao WHERE codigocidadao = ?";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, cidadao.getCodigo());
			pst.execute();
			connection.commit();
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();

			
			try {
			
				connection.rollback();
							
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			
			
			}
			return false;
		}
		
	}
//ALTERANDO DADOS DOS CIDADÃOS
	public void alterarCidadao(CidadaoBean cidadaoBean) {
		
		
		String sql =  "UPDATE tblcidadao SET nomeCidadao = ?,alcunhaCidadao = ?,nascimentoCidadao = ?,"
				+ "telefoneCidadao = ?,rgCidadao = ?,cpfCidadao = ?, orgaoEmissor = ?,ufCidadao = ?,"
				+ "maeCidadao = ?,paiCidadao = ?,"
				+ "cepCidadao = ?,logradouroCidadao = ?,numeroCidado = ?,"
				+ "complementoCidadao = ?,bairroCidado = ?,cidadeCidadao = ?,ufEndCidadao = ?,paisCiadadao = ?,"
				+ "dataInfracaoCidadao = ?,delegaciaInfracaoCidadao = ?,faccaoCidadao = ?,"
				+ "endOcorrenciaCidadao = ?, bairroOcorrenciaCidadao = ?,cidadeOcorrenciaCidadao = ?,referenciaCidadao = ?,"
				+ "informacaoJudicial = ?,"
				+ "tatuRostoCidadao = ?,tatuPescocCidadao = ?,"
				+ "tatuToraxCidadao = ?,"
				+ "tatuBracoDireitoCidadao = ?,tatuBracoEsquerdoCidadao= ? ,"
				+ "tatuPernaDireitaCidadao = ?,tatuPernaEsquerdaCidadao = ?,"
				+ "tatuCostasCidadao = ?,"
				+ "fotoFrenteCidadao = ?,fotoLadoCidadao = ?,fotoCostaCidadao = ?,fotoDiversa01 = ?,fotoDiversa02 = ?,"
				+ "historicoCidadao = ? WHERE codigocidadao = ?";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
					
			pst.setString(1, cidadaoBean.getNome());
			pst.setString(2, cidadaoBean.getAlcunha());
			pst.setString(3, cidadaoBean.getNascimento());
			pst.setString(4, (cidadaoBean.getTelefone() == null) ? null :  cidadaoBean.getTelefone().toString());
			pst.setString(5, (cidadaoBean.getRg() == null) ? null :  cidadaoBean.getRg().toString());
			pst.setString(6, (cidadaoBean.getCpf() == null) ? null :  cidadaoBean.getCpf().toString());
			pst.setString(7, cidadaoBean.getOrgaoEmissor());
			pst.setString(8, cidadaoBean.getUf());
			pst.setString(9, cidadaoBean.getMae());
			pst.setString(10, cidadaoBean.getPai());
			pst.setString(11, (cidadaoBean.getCep() == null) ? null : cidadaoBean.getCep().toString());
			pst.setString(12, cidadaoBean.getEndereco());
			pst.setString(13, (cidadaoBean.getNumero() == null) ? null : cidadaoBean.getNumero().toString());
			pst.setString(14, cidadaoBean.getComplemento());
			pst.setString(15, cidadaoBean.getBairro());
			pst.setString(16, cidadaoBean.getCidade());
			pst.setString(17, cidadaoBean.getUfEndereco());
			pst.setString(18, cidadaoBean.getPais());
			pst.setString(19, cidadaoBean.getDataUtimaInfracao());
			pst.setString(20, cidadaoBean.getDelegacia());
			pst.setString(21, cidadaoBean.getFaccao());
			pst.setString(22, cidadaoBean.getEndOcorrencia());
			pst.setString(23, cidadaoBean.getBairroOcorrencia());
			pst.setString(24, cidadaoBean.getCidadeOcorrencia());
			pst.setString(25, cidadaoBean.getReferenciaOcorrencia());
			pst.setString(26, cidadaoBean.getHistoricoJuridico());
			pst.setString(27, cidadaoBean.getTatuRosto());
			pst.setString(28, cidadaoBean.getTatuPescoco());
			pst.setString(29, cidadaoBean.getTatuTorax());
			pst.setString(30, cidadaoBean.getTatuBracoDireito());
			pst.setString(31, cidadaoBean.getTatuBracoEsquerdo());
			pst.setString(32, cidadaoBean.getTatuPernaDireita());
			pst.setString(33, cidadaoBean.getTatuPernaEsquerda());
			pst.setString(34, cidadaoBean.getTatuCostas());
			pst.setString(35, cidadaoBean.getFotoFrente());
			pst.setString(36, cidadaoBean.getFotoLado());
			pst.setString(37, cidadaoBean.getFotoCostas());
			pst.setString(38, cidadaoBean.getFotoDiversas01());
			pst.setString(39, cidadaoBean.getFotoDiversas02());
			pst.setString(40, cidadaoBean.getHistorico());
			pst.setInt(41, cidadaoBean.getCodigo());
			
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

}
