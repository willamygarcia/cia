package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.EnvolvidoOcorrenciaBean;
import dao.EnvolvioOcorrenciaDao;

@WebServlet(name = "EnvolvidosOcorrencia", urlPatterns = {"/pages/EnvolvidosOcorrencia"})
public class EnvolvidosOcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EnvolvidosOcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		EnvolvidoOcorrenciaBean envolvidoOcorrenciaBean = new EnvolvidoOcorrenciaBean();
		EnvolvioOcorrenciaDao envolvidoOcorrenciaDao = new EnvolvioOcorrenciaDao();
		if(acao.equals("salvar")) {
			envolvidoOcorrenciaBean.setCodigoOcorrenia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			envolvidoOcorrenciaBean.setGraduacaoEnvolvidoOcorrencia(request.getParameter("graduacao"));
			envolvidoOcorrenciaBean.setNumeralEnvolvidoOcorrencia(request.getParameter("numeral"));
			envolvidoOcorrenciaBean.setMatriculaEnvolvidoOcorrencia(request.getParameter("matricula"));
			envolvidoOcorrenciaBean.setNomeGuerraEnvolvidoOcorrencia(request.getParameter("nome"));
			envolvidoOcorrenciaBean.setInformacoesEnvolvidoOcorrencia(request.getParameter("informacoes"));
			envolvidoOcorrenciaDao.cadastrarEnvolvidoOcorrencia(envolvidoOcorrenciaBean);
		}
	}

}
