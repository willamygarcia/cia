package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UsuariosBean;
import dao.LoginDao;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@WebServlet(name = "CadastrarUsuario", urlPatterns= {"/pages/CadastrarUsuario"})
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsuariosServlet() {
		super();

	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		String acaoConsulta = request.getParameter("acaoConsulta");
		List<UsuariosBean> listaUsuarios = new ArrayList<UsuariosBean>();
		UsuariosBean usuariosBean = new UsuariosBean();
		LoginDao loginDao = new LoginDao();
		if(acaoConsulta.equals("")) {
			
			
			
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
			request.setAttribute("relatorioUsuarios", "<a href=\"CadastrarUsuario?acao=geraRelatorio&acaoConsulta=geraRelatorio&codigoConsulta="+ usuariosBean.getCodigoUsuarios()
					+"&mtUsuarioConsulta="+ usuariosBean.getNomeUsuarios()
					+"&nivelConsulta="+ usuariosBean.getNivelUsuarios()+"\""
					+ "class=\"btn btn-info\" target=\"_blank\">Visualizar</a>");
			dispatcher.forward(request, response);
		
		}else if(acao.equals("editar")) {
			
			int codigoUsuarios = Integer.parseInt(request.getParameter("codigoUsuarios"));
			
			usuariosBean.setCodigoUsuarios(codigoUsuarios);
			usuariosBean = loginDao.consultaUsuarioCodigo(codigoUsuarios);
			request.setAttribute("usuarioPorCodigo",usuariosBean);
			request.setAttribute("valor", "Editar");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
			
			dispatcher.forward(request, response);
		}else if(acao.equals("del")) {
			
			int codigoUsuarios = Integer.parseInt(request.getParameter("codigoUsuarios"));
			loginDao.removerUsuarios(codigoUsuarios);
			request.setAttribute("checagem", "checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuarios.jsp");
			dispatcher.forward(request, response);
			
		}else if (acao.equalsIgnoreCase("geraRelatorio")) {
			try { 
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
				
				listaUsuarios = loginDao.consultaTotal(usuariosBean);
				JasperDesign jasperDesign =JRXmlLoader.load(getServletContext().getRealPath("/WEB-INF/relatorio/RelatorioUser.jrxml"));
				JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
				Map<String, Object> parameters = new HashMap<String, Object>();
				JasperPrint print = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(listaUsuarios));
				
				byte[] bytes = JasperExportManager.exportReportToPdf(print);
				response.setContentType("application/pdf");
				response.setContentLength(bytes.length);
				ServletOutputStream ouputStream = response.getOutputStream();
				ouputStream.write(bytes, 0, bytes.length);
				ouputStream.flush();
				ouputStream.close();
			
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
		}else if(acao.equalsIgnoreCase("viualizarUsuario")) {
			int codigoUsuarios = Integer.parseInt(request.getParameter("codigoUsuarios"));
			usuariosBean.setCodigoUsuarios(codigoUsuarios);
			usuariosBean = loginDao.consultaUsuarioCodigo(codigoUsuarios);
			List<UsuariosBean> usuariosBeans = new ArrayList<UsuariosBean>();
			usuariosBeans.add(usuariosBean);
			try {
				JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("/WEB-INF/relatorio/visualizarUsuario.jrxml"));
				JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
				Map<String, Object> parametros = new HashMap<String, Object>();
				JasperPrint print = JasperFillManager.fillReport(jasperReport, parametros, new JRBeanCollectionDataSource(usuariosBeans));
				byte[] bytes = JasperExportManager.exportReportToPdf(print);
				response.setContentType("application/pdf");
				response.setContentLength(bytes.length);
				ServletOutputStream ouputStream = response.getOutputStream();
				ouputStream.write(bytes, 0, bytes.length);
				ouputStream.flush();
				ouputStream.close();
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}	
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		
		UsuariosBean usuariosBean = new UsuariosBean();
		LoginDao loginDao = new LoginDao();
		
		if(request.getParameter("codigo").equals("")) {
			
			usuariosBean.setNomeUsuarios(request.getParameter("mtUsuario"));
			usuariosBean.setNomeCompletoUsuarios(request.getParameter("nomeUsuario"));
			usuariosBean.setEmailUsuario(request.getParameter("emailUsuario"));
			usuariosBean.setSenha(request.getParameter("senha"));
			usuariosBean.setConfirmaSenha(request.getParameter("confirmaSenha"));
			usuariosBean.setNivelUsuarios(Integer.parseInt(request.getParameter("nivel")));
			
			if(loginDao.validaNome(usuariosBean.getNomeUsuarios())) {
				loginDao.cadastrarUsuario(usuariosBean.getNomeUsuarios(), usuariosBean.getNomeCompletoUsuarios(), usuariosBean.getEmailUsuario(), usuariosBean.getSenha(), usuariosBean.getNivelUsuarios());
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
			usuariosBean.setEmailUsuario(request.getParameter("emailUsuario"));
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
