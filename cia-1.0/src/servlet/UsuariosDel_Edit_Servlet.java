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


@WebServlet(name="UsuariosDel_Edit_Servlet", urlPatterns= {"/pages/UsuariosDel_Edit_Servlet"})
public class UsuariosDel_Edit_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UsuariosDel_Edit_Servlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		int codigoUsuarios = Integer.parseInt(request.getParameter("codigoUsuarios"));
		
		if(acao.equals("del")) {
			
			LoginDao loginDao = new LoginDao();
			loginDao.removerUsuarios(codigoUsuarios);
			request.setAttribute("checagem", "checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
			dispatcher.forward(request, response);
			
		}else if(acao.equals("editar")) {
			
			UsuariosBean usuariosBean = new UsuariosBean();
			LoginDao loginDao = new LoginDao();
			
			usuariosBean.setCodigoUsuarios(codigoUsuarios);
			usuariosBean = loginDao.consultaUsuarioCodigo(codigoUsuarios);
			request.setAttribute("usuarioPorCodigo",usuariosBean);
			request.setAttribute("valor", "Editar");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
			dispatcher.forward(request, response);
			
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
