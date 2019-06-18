package servlet;

import java.io.IOException;
import java.util.List;

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
			
			try {
				List<EnvolvidoOcorrenciaBean> envolvidos = envolvidoOcorrenciaDao.consultaEnvolvidosTotal(envolvidoOcorrenciaBean);
				if(!envolvidos.isEmpty()) {
					String data ="";
					int totalLista = envolvidos.size();
					int index = 1;
					for (EnvolvidoOcorrenciaBean envolvido2 : envolvidos) {
						data += "{"+
									"\"codigoEnvolvido\":\""+envolvido2.getCodigoEnvolvidoOcorrencia()+"\","+
									"\"codigoOcorrencia\":\""+envolvido2.getCodigoOcorrenia()+"\","+
									"\"graduacaoEnvolvido\":\""+envolvido2.getGraduacaoEnvolvidoOcorrencia()+"\","+
									"\"numeralEnvolvido\":\""+envolvido2.getNumeralEnvolvidoOcorrencia()+"\","+
									"\"matriculaEnvolvido\":\""+envolvido2.getMatriculaEnvolvidoOcorrencia()+"\","+
									"\"nomeGuerraEnvolvido\":\""+envolvido2.getNomeGuerraEnvolvidoOcorrencia()+"\","+
									"\"informacaoEnvolvido\":\""+envolvido2.getInformacoesEnvolvidoOcorrencia()+"\""+
								"}";
						if(index < totalLista) {
							data += ",";
						}
						index++;
					}	
				
					String dados =  "["+	
									data +
						
									"]";
						
					
				response.setStatus(200);
				response.getWriter().write(dados);;
				}
				
			} catch (Exception e) {
			
			}
		}
	}

}
