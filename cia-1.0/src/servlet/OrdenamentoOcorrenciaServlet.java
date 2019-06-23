package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.OrdenamentoOcorrenciaBean;
import dao.OrdenamentoOcorrenciaDao;

@WebServlet(name = "OrdenamentoOcorrencia", urlPatterns = {"/pages/OrdenamentoOcorrencia"})
public class OrdenamentoOcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrdenamentoOcorrenciaServlet() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String codigoOcorrencia = request.getParameter("codigoOcor");
		String codigoOrdenamento = request.getParameter("codigoOrd");
		OrdenamentoOcorrenciaBean ordenamentoOcorrenciaBean = new OrdenamentoOcorrenciaBean();
		OrdenamentoOcorrenciaDao ordenamentoOcorrenciaDao = new OrdenamentoOcorrenciaDao();
		if(acao.equals("remover")) {
			ordenamentoOcorrenciaBean.setCodigoOcorrencia(Integer.parseInt(codigoOcorrencia));
			ordenamentoOcorrenciaBean.setCodigoOrdenamentoOcorrencia(Integer.parseInt(codigoOrdenamento));
			ordenamentoOcorrenciaDao.removerOrdenamento(ordenamentoOcorrenciaBean);
			
			try {
				List<OrdenamentoOcorrenciaBean> ordenamentos = ordenamentoOcorrenciaDao.consultaTotalOrdenamento(ordenamentoOcorrenciaBean);
				if(!ordenamentos.isEmpty()) {
					String data ="";
					int totalLista = ordenamentos.size();
					int index = 1;
					for (OrdenamentoOcorrenciaBean ordenamentos2 : ordenamentos) {
						data += "{"+
									"\"codigoOrdenamento\":\""+ordenamentos2.getCodigoOrdenamentoOcorrencia()+"\","+
									"\"codigoOcorrencia\":\""+ordenamentos2.getCodigoOcorrencia()+"\","+
									"\"leiOrdenamento\":\""+ordenamentos2.getLeiOrdenamentoOcorrencia()+"\","+
									"\"artigoOrdenamento\":\""+ordenamentos2.getArtigoOrdenamentoOcorrencia()+"\","+
									"\"paragrafoOrdenamento\":\""+ordenamentos2.getParagrafoOrdenamentoOcorrencia()+"\""+
								"}";
						if(index < totalLista) {
							data += ",";
						}
						index++;
					}	
				
					String dados =  "["+	
									data +
						
									"]";
						
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");	
				response.setStatus(200);
				response.getWriter().write(dados);;
				}
				
			} catch (Exception e) {
			
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String codigoOcorrencia = request.getParameter("codigoOcorrencia");
		OrdenamentoOcorrenciaBean ordenamentoOcorrenciaBean = new OrdenamentoOcorrenciaBean();
		OrdenamentoOcorrenciaDao ordenamentoOcorrenciaDao = new OrdenamentoOcorrenciaDao();
		
		if(acao.equals("salvar") && !codigoOcorrencia.equals("")) {
			ordenamentoOcorrenciaBean.setLeiOrdenamentoOcorrencia(request.getParameter("ordenamento"));
			ordenamentoOcorrenciaBean.setArtigoOrdenamentoOcorrencia(request.getParameter("artigo"));
			ordenamentoOcorrenciaBean.setParagrafoOrdenamentoOcorrencia(request.getParameter("paragrafo"));
			ordenamentoOcorrenciaBean.setCodigoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			ordenamentoOcorrenciaDao.cadastrarOrdenamentoOcorrencia(ordenamentoOcorrenciaBean);
			
			try {
				List<OrdenamentoOcorrenciaBean> ordenamentos = ordenamentoOcorrenciaDao.consultaTotalOrdenamento(ordenamentoOcorrenciaBean);
				if(!ordenamentos.isEmpty()) {
					String data ="";
					int totalLista = ordenamentos.size();
					int index = 1;
					for (OrdenamentoOcorrenciaBean ordenamentos2 : ordenamentos) {
						data += "{"+
									"\"codigoOrdenamento\":\""+ordenamentos2.getCodigoOrdenamentoOcorrencia()+"\","+
									"\"codigoOcorrencia\":\""+ordenamentos2.getCodigoOcorrencia()+"\","+
									"\"leiOrdenamento\":\""+ordenamentos2.getLeiOrdenamentoOcorrencia()+"\","+
									"\"artigoOrdenamento\":\""+ordenamentos2.getArtigoOrdenamentoOcorrencia()+"\","+
									"\"paragrafoOrdenamento\":\""+ordenamentos2.getParagrafoOrdenamentoOcorrencia()+"\""+
								"}";
						if(index < totalLista) {
							data += ",";
						}
						index++;
					}	
				
					String dados =  "["+	
									data +
						
									"]";
						
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");	
				response.setStatus(200);
				response.getWriter().write(dados);;
				}
				
			} catch (Exception e) {
			
			}
		}
	}

}
