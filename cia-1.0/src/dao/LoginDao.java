package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.UsuariosBean;

import connection.SingleConnection;

public class LoginDao {

	private Connection connection;

	public LoginDao() {

		connection = SingleConnection.getConnection();
	}
// METODO DE VERIFICAÇÃO DE LOGIN
	public boolean logar(String usuario, String senha) {
		String sql = "SELECT * FROM tblusuarios WHERE matricula_usuarios = ? and senha_usuarios = ?";

		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, usuario);
			pst.setString(2, senha);
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}

	}
// CADASTRAR USUARIO NO BANCO DE DADOS
	public void cadastrarUsuario(String matricula,String nome, String email, String senha, int nivel) {
		String sql = "INSERT INTO tblusuarios (matricula_usuarios,nome_completo_usuarios,email_usuarios,senha_usuarios,nivel_usuarios) VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, matricula);
			pst.setString(2, nome);
			pst.setString(3, email);
			pst.setString(4, senha);
			pst.setInt(5, nivel);
			pst.execute();
		} catch (Exception e) {
			try {
				connection.commit();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}
	
// CONSULTA DOS USUARIOS
	
	public List<UsuariosBean> consultaTotal(UsuariosBean usuarios) {

		List<UsuariosBean> lista = new ArrayList<UsuariosBean>();
		PreparedStatement pst;
		
		String sql = "SELECT codigo_usuarios, matricula_usuarios, nome_completo_usuarios, nivel_usuarios FROM tblusuarios WHERE codigo_usuarios LIKE '%" +  usuarios.getCodigoUsuarios()+
				 "%' AND matricula_usuarios LIKE '%" + usuarios.getNomeUsuarios() +
				 "%' AND nivel_usuarios LIKE '%" + usuarios.getNivelUsuarios() +
				 "%'";
		
		String sql2 = "SELECT codigo_usuarios, matricula_usuarios, nome_completo_usuarios, nivel_usuarios FROM tblusuarios WHERE codigo_usuarios LIKE '%" +  
				 "%' AND matricula_usuarios LIKE '%" + usuarios.getNomeUsuarios() +
				 "%' AND nivel_usuarios LIKE '%" + usuarios.getNivelUsuarios() +
				 "%'";
		
		String sql3 = "SELECT codigo_usuarios, matricula_usuarios, nome_completo_usuarios, nivel_usuarios FROM tblusuarios WHERE codigo_usuarios LIKE '%" +  usuarios.getCodigoUsuarios() +
				 "%' AND matricula_usuarios LIKE '%" + usuarios.getNomeUsuarios() +
				 "%' AND nivel_usuarios LIKE '%" + "%'";
		
		String sql4 = "SELECT codigo_usuarios, matricula_usuarios, nome_completo_usuarios, nivel_usuarios FROM tblusuarios WHERE codigo_usuarios LIKE '%" +
				 "%' AND matricula_usuarios LIKE '%" + usuarios.getNomeUsuarios() +
				 "%' AND nivel_usuarios LIKE '%" + "%'";
		try {
			if(usuarios.getCodigoUsuarios() == 0 && usuarios.getNivelUsuarios() != 0) {
				pst = connection.prepareStatement(sql2);
			}else if(usuarios.getCodigoUsuarios() != 0 && usuarios.getNivelUsuarios() == 0){
				pst = connection.prepareStatement(sql3);
			}else if(usuarios.getCodigoUsuarios() == 0 && usuarios.getNivelUsuarios() == 0){
				pst = connection.prepareStatement(sql4);
			}else if(usuarios.getCodigoUsuarios() != 0 && usuarios.getNivelUsuarios() != 0){
				pst = connection.prepareStatement(sql);
			}else {
				pst = connection.prepareStatement(sql4);
			}
		
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				UsuariosBean usuariosBean = new UsuariosBean();
				usuariosBean.setCodigoUsuarios(rs.getInt("codigo_usuarios"));
				usuariosBean.setNomeUsuarios(rs.getString("matricula_usuarios"));
				usuariosBean.setNomeCompletoUsuarios(rs.getString("nome_completo_usuarios"));
				usuariosBean.setNivelUsuarios(rs.getInt("nivel_usuarios"));
				

				lista.add(usuariosBean);
			}
			return lista;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}
// REMOVER UM USUARIO
	public void removerUsuarios(int codigoUsuarios){
		String sql = "DELETE FROM tblusuarios WHERE codigo_usuarios = ?";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, codigoUsuarios);
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
		
	};
// CONSULTAR USUARIOS POR CODIGO INFORMADO
	public UsuariosBean consultaUsuarioCodigo(int codigo) {
		String sql = "SELECT * FROM tblusuarios WHERE codigo_usuarios = ?";
		UsuariosBean usuariosBean = new UsuariosBean();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, codigo);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				usuariosBean.setCodigoUsuarios(rs.getInt("codigo_usuarios"));
				usuariosBean.setNomeUsuarios(rs.getString("matricula_usuarios"));
				usuariosBean.setEmailUsuario(rs.getString("email_usuarios"));
				usuariosBean.setNomeCompletoUsuarios(rs.getString("nome_completo_usuarios"));
				usuariosBean.setSenha(rs.getString("senha_usuarios"));
				usuariosBean.setNivelUsuarios(rs.getInt("nivel_usuarios"));
			}
			
			return usuariosBean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
//	ATUALIZAR USUARIOS	
	public void atualizarUsuarios(UsuariosBean usuariosBean) {
		
		String sql = "UPDATE tblusuarios SET matricula_usuarios = ?, nome_completo_usuarios = ?, email_usuarios, senha_usuarios = ?, nivel_usuarios = ? WHERE codigo_usuarios ="+usuariosBean.getCodigoUsuarios();
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, usuariosBean.getNomeUsuarios());
			pst.setString(2, usuariosBean.getNomeCompletoUsuarios());
			pst.setString(3, usuariosBean.getEmailUsuario());
			pst.setString(4, usuariosBean.getSenha());
			pst.setInt(5, usuariosBean.getNivelUsuarios());
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
	
	public boolean validaNome(String nome) {
		
		String sql ="SELECT COUNT(1) AS qtd FROM tblusuarios WHERE matricula_usuarios = ?";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, nome);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				
				return rs.getInt("qtd")<=0;
			}else {
				return false;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
			
		}
		
	
	}

}
