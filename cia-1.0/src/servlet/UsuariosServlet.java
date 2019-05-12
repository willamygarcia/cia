package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UsuariosBean;
import dao.LoginDao;

@WebServlet(name = "CadastrarUsuario", urlPatterns= {"/pages/CadastrarUsuario"})
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsuariosServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UsuariosBean usuariosBean = new UsuariosBean();
		LoginDao loginDao = new LoginDao();
		
		if(request.getParameter("codigoConsulta").equals("")) {
			usuariosBean.setCodigoUsuarios(0);
		}else {
			usuariosBean.setCodigoUsuarios(Integer.parseInt(request.getParameter("codigoConsulta")));
		}
		
		usuariosBean.setNomeUsuarios(request.getParameter("mtUsuarioConsulta"));
		
		
		if(request.getParameter("nivelConsulta").equals("")) {
			usuariosBean.setNivelUsuarios(0);
		}else {
			usuariosBean.setNivelUsuarios((Integer.parseInt(request.getParameter("nivelConsulta"))));
		}
		request.setAttribute("checagem", "checked");
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
		request.setAttribute("consultaTotal", loginDao.consultaTotal(usuariosBean));
		dispatcher.forward(request, response);

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		
		UsuariosBean usuariosBean = new UsuariosBean();
		LoginDao loginDao = new LoginDao();
		
		if(request.getParameter("codigo").equals("")) {
			
			usuariosBean.setNomeUsuarios(request.getParameter("mtUsuario"));
			usuariosBean.setNomeCompletoUsuarios(request.getParameter("nomeUsuario"));
			usuariosBean.setSenha(request.getParameter("senha"));
			usuariosBean.setConfirmaSenha(request.getParameter("confirmaSenha"));
			usuariosBean.setNivelUsuarios(Integer.parseInt(request.getParameter("nivel")));
			
			if(loginDao.validaNome(usuariosBean.getNomeUsuarios())) {
				loginDao.cadastrarUsuario(usuariosBean.getNomeUsuarios(), usuariosBean.getNomeCompletoUsuarios(), usuariosBean.getSenha(), usuariosBean.getNivelUsuarios());
				request.setAttribute("alerta", "<script type=\"text/javascript\">alert(\"Usuário Cadastrado com Sucesso!!!\");</script>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
				dispatcher.forward(request, response);
			}else {
				request.setAttribute("alerta", "<script type=\"text/javascript\">alert(\"Usuário já Cadastrado\");</script>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
				dispatcher.forward(request, response);
			}
			
		}else{
		
			usuariosBean.setCodigoUsuarios(Integer.parseInt(request.getParameter("codigo")));
			usuariosBean.setNomeUsuarios(request.getParameter("mtUsuario"));
			usuariosBean.setNomeCompletoUsuarios(request.getParameter("nomeUsuario"));
			usuariosBean.setSenha(request.getParameter("senha"));
			usuariosBean.setConfirmaSenha(request.getParameter("confirmaSenha"));
			usuariosBean.setNivelUsuarios(Integer.parseInt(request.getParameter("nivel")));
			loginDao.atualizarUsuarios(usuariosBean);
			request.setAttribute("alerta", "<script type=\"text/javascript\">alert(\"Usuário Atualizado com Sucesso!!!\");</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
			dispatcher.forward(request, response);
		}
		
	

	}

}
