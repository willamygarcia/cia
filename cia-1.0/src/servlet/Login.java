package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import beans.UsuariosBean;
import dao.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
		UsuariosBean usuariosBean = new UsuariosBean();
		dao.LoginDao loginDao = new LoginDao();
		
		usuariosBean.setNomeUsuarios(request.getParameter("usuario"));
		usuariosBean.setSenha(request.getParameter("senha"));
		
		if (loginDao.logar(usuariosBean.getNomeUsuarios(), usuariosBean.getSenha())) {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			
			session.setAttribute("usuario", usuariosBean);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/principal.jsp");
			dispatcher.forward(request, response);
			
		} else {
			request.setAttribute("negado", "<script type=\"text/javascript\">alert(\"Usuário ou Senha Inválida!!!\");</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		
			
		}

	}

}
