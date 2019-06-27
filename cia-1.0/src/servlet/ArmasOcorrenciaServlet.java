package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ArmasOcorrenciaBean;
import dao.ArmaOcorrenciaDao;

@WebServlet(name = "ArmasOcorrencia", urlPatterns= {"/pages/ArmasOcorrencia"})
public class ArmasOcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ArmasOcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		ArmasOcorrenciaBean armasOcorrenciaBean = new ArmasOcorrenciaBean();
		ArmaOcorrenciaDao armaOcorrenciaDao = new ArmaOcorrenciaDao();
		
		if(acao.equals("salvar")) {
			armasOcorrenciaBean.setCodigoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			armasOcorrenciaBean.setSerieArma(request.getParameter("serieArma"));
			armasOcorrenciaBean.setTipoArma(request.getParameter("tipoArma"));
			armasOcorrenciaBean.setFuncionamentoArma(request.getParameter("funcionamentoArma"));
			armasOcorrenciaBean.setMarcaArma(request.getParameter("marcaArma"));
			armasOcorrenciaBean.setCalibreArma(request.getParameter("calibreArma"));
			armasOcorrenciaBean.setCapacidadeArma(request.getParameter("capacidadeArma"));
			armasOcorrenciaBean.setInformacoesArama(request.getParameter("informacaoArma"));
			armaOcorrenciaDao.salvarArmaOcorrencia(armasOcorrenciaBean);
		}
	}

}
