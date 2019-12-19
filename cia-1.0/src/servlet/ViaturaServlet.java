package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ViaturaBean;
import dao.ViaturaDao;

@WebServlet(name = "Viaturas", urlPatterns = "/pages/Viaturas" )
public class ViaturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViaturaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViaturaBean viaturaBean = new ViaturaBean();
		ViaturaDao viaturaDao = new ViaturaDao();
		
		if(request.getParameter("btnAcao").equalsIgnoreCase("consultar")) {
			
			Integer prefixo = (request.getParameter("prefixoConsulta") == "" ? null : Integer.parseInt(request.getParameter("prefixoConsulta")));
			viaturaBean.setCodigoViatura(prefixo);
			viaturaBean.setPlacaViatura(request.getParameter("placaConsulta"));
			viaturaBean.setMarcaViatura(request.getParameter("marcaConsulta"));
			
			request.setAttribute("listaViaturas", viaturaDao.consultaTotalViaturas(viaturaBean));
			request.setAttribute("checagem", "checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroViaturas.jsp");
			dispatcher.forward(request, response);
			
		}else if(request.getParameter("btnAcao").equalsIgnoreCase("editar")) {
			
			viaturaBean.setCodigoViatura((request.getParameter("codigoVtr") == "" ? null : Integer.parseInt(request.getParameter("codigoVtr"))));
			request.setAttribute("viaturas", viaturaDao.consultaViaturaPorCodigo(viaturaBean));
			request.setAttribute("leitura", "readonly");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroViaturas.jsp");
			dispatcher.forward(request, response);
			
		}else if(request.getParameter("btnAcao").equalsIgnoreCase("remover")) {
			viaturaBean.setCodigoViatura((request.getParameter("codigoVtr") == "" ? null : Integer.parseInt(request.getParameter("codigoVtr"))));
			viaturaDao.removerViatura(viaturaBean);
			request.setAttribute("mensagem", "<script>alert('Viatura Removida com Sucesso !!!')</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroViaturas.jsp");
			dispatcher.forward(request, response);
			
		
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViaturaBean viaturaBean = new ViaturaBean();
		ViaturaDao viaturaDao = new ViaturaDao();
		String acao ; 
		viaturaBean.setCodigoViatura((request.getParameter("codigo") != "" ) ? Integer.parseInt(request.getParameter("codigo")) : null );
		
		viaturaBean = viaturaDao.consultaViaturaPorCodigo(viaturaBean);
		Integer codigoVtr = viaturaBean.getCodigoViatura();
		
		if(codigoVtr == null) {
			acao = "salvar";
			System.out.println("Objetor Viatura Vazio");
		}else {
			 acao = "alterar";
		}
				
		if(acao.equalsIgnoreCase("salvar")) {
			viaturaBean.setCodigoViatura(Integer.parseInt(request.getParameter("codigo")));
			viaturaBean.setPlacaViatura(request.getParameter("placa"));
			viaturaBean.setMarcaViatura(request.getParameter("marca"));
			viaturaBean.setChassiViatura(request.getParameter("chassi"));
			viaturaBean.setCorViatura(request.getParameter("cor"));
			viaturaBean.setAnoViatura(request.getParameter("ano"));
			viaturaDao.cadastraViatura(viaturaBean);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroViaturas.jsp");
			request.setAttribute("mensagem", "<script>alert('Viatura cadastrada com sucesso !!!')</script>");
			dispatcher.forward(request, response);
			
		}else if(acao.equalsIgnoreCase("alterar")) {
			viaturaBean.setCodigoViatura(Integer.parseInt(request.getParameter("codigo")));
			viaturaBean.setPlacaViatura(request.getParameter("placa"));
			viaturaBean.setMarcaViatura(request.getParameter("marca"));
			viaturaBean.setChassiViatura(request.getParameter("chassi"));
			viaturaBean.setCorViatura(request.getParameter("cor"));
			viaturaBean.setAnoViatura(request.getParameter("ano"));
			viaturaDao.alterarViatura(viaturaBean);
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroViaturas.jsp");
			request.setAttribute("mensagem", "<script>alert('Viatura Alterada com sucesso !!!')</script>");
			dispatcher.forward(request, response);

		}
	}

}
