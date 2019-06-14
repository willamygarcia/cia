package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.OcorrenciaBean;
import dao.OcorrenciaDao;

@WebServlet(name = "Ocorrencia", urlPatterns = {"/pages/Ocorrencia"})
@MultipartConfig
public class OcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public OcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String codigo = request.getParameter("codigoOcorrencia");
		OcorrenciaBean ocorrenciaBean = new OcorrenciaBean();
		OcorrenciaDao ocorrenciaDao = new OcorrenciaDao();
		
		if((acao.equals("salvar") || acao.equals("")) && codigo.equals("")) {
			ocorrenciaBean.setMikeOcorrencia(request.getParameter("mikeOcorrencia"));
			ocorrenciaBean.setInqueritoOcorrencia(request.getParameter("inqueritoOcorrencia"));
			ocorrenciaBean.setBoOcorrencia(request.getParameter("boOcorrencia"));
			ocorrenciaBean.setOutrosOcorrencia(request.getParameter("outrosOcorrencia"));
			ocorrenciaBean.setGraduacaoOcorrencia(request.getParameter("graduacaoPostoOcorrencia"));
			ocorrenciaBean.setNumeralOcorrencia(request.getParameter("numeralOcorrencia"));
			ocorrenciaBean.setMatriculaOcorrencia(request.getParameter("matriculaOcorrencia"));
			ocorrenciaBean.setNomeGuerraOcorrencia(request.getParameter("nomeGuerraOcorrencia"));
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			System.out.println(ocorrenciaDao.utimoCodigo());
			response.getWriter().write(ocorrenciaDao.utimoCodigo());
			//ocorrenciaDao.iniciarOcorrencia(ocorrenciaBean);
		}
	}

}
