package servlet;

import java.io.IOException;
import java.util.List;

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
		String acao = request.getParameter("acao");
		ArmasOcorrenciaBean armasOcorrenciaBean = new ArmasOcorrenciaBean();
		ArmaOcorrenciaDao armaOcorrenciaDao = new ArmaOcorrenciaDao();
		if(acao.equals("remover")) {
			armasOcorrenciaBean.setCodigoArma(Integer.parseInt(request.getParameter("codigoArma")));
			armasOcorrenciaBean.setCodigoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			armaOcorrenciaDao.removerArmaOcorrencia(armasOcorrenciaBean);
			try {
				List<ArmasOcorrenciaBean> listaArmas = armaOcorrenciaDao.consultaTotalArmas(armasOcorrenciaBean);
				if(!listaArmas.isEmpty()) {
					String data = "";
					int totalLista = listaArmas.size();
					int index = 1;
					for (ArmasOcorrenciaBean arma : listaArmas) {
						data += "{"+
									"\"codigoArma\":\""+arma.getCodigoArma()+"\","+
									"\"codigoOcorrencia\":\""+arma.getCodigoOcorrencia()+"\","+
									"\"serie\":\""+arma.getSerieArma()+"\","+
									"\"tipo\":\""+arma.getTipoArma()+"\","+
									"\"funcionamento\":\""+arma.getFuncionamentoArma()+"\","+
									"\"marca\":\""+arma.getMarcaArma()+"\","+
									"\"calibre\":\""+arma.getCalibreArma()+"\","+
									"\"capacidade\":\""+arma.getCapacidadeArma()+"\","+
									"\"informacao\":\""+arma.getInformacoesArama()+"\""+
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
					response.getWriter().write(dados);
				}
				
			} catch (Exception e) {
				
			}
		}
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
			armasOcorrenciaBean.setInformacoesArama(request.getParameter("informacaoArma").replaceAll("\r","\\r"));
			System.out.println(armasOcorrenciaBean.getInformacoesArama());
			armaOcorrenciaDao.salvarArmaOcorrencia(armasOcorrenciaBean);
			
			try {
				List<ArmasOcorrenciaBean> listaArmas = armaOcorrenciaDao.consultaTotalArmas(armasOcorrenciaBean);
				if(!listaArmas.isEmpty()) {
					String data = "";
					int totalLista = listaArmas.size();
					int index = 1;
					for (ArmasOcorrenciaBean arma : listaArmas) {
						data += "{"+
									"\"codigoArma\":\""+arma.getCodigoArma()+"\","+
									"\"codigoOcorrencia\":\""+arma.getCodigoOcorrencia()+"\","+
									"\"serie\":\""+arma.getSerieArma()+"\","+
									"\"tipo\":\""+arma.getTipoArma()+"\","+
									"\"funcionamento\":\""+arma.getFuncionamentoArma()+"\","+
									"\"marca\":\""+arma.getMarcaArma()+"\","+
									"\"calibre\":\""+arma.getCalibreArma()+"\","+
									"\"capacidade\":\""+arma.getCapacidadeArma()+"\","+
									"\"informacao\":\""+arma.getInformacoesArama()+"\""+
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
