package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import beans.EntorpecentesOcorrenciaBean;
import dao.EntorpecenteOcorrenciaDao;

@WebServlet(name = "EntorpecentesOcorrencia", urlPatterns = {"/pages/EntorpecentesOcorrencia"})

public class EntorpecentesOcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EntorpecentesOcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		EntorpecentesOcorrenciaBean entorpecenteBean = new EntorpecentesOcorrenciaBean();
		EntorpecenteOcorrenciaDao entorpecenteDao = new EntorpecenteOcorrenciaDao();
		if(acao.equals("remover")) {
			entorpecenteBean.setCodigoEntorpecenteOcorrencia(request.getParameter("entorpecente"));
			entorpecenteBean.setEntorpCodigoOcorrencia(request.getParameter("ocorrencia"));
			entorpecenteDao.removerEntorpecentes(entorpecenteBean);
			try {
				List<EntorpecentesOcorrenciaBean> listaEntorpecentes = entorpecenteDao.consultaEntorpecentes(entorpecenteBean);
				if(!listaEntorpecentes.isEmpty()) {
					String data = "";
					int totalLista = listaEntorpecentes.size();
					int index = 1;
					JSONObject obj_Json = new JSONObject();
					for (EntorpecentesOcorrenciaBean entorpecente : listaEntorpecentes) {
						
						obj_Json.put("codigoEntorpecente", entorpecente.getCodigoEntorpecenteOcorrencia());
						obj_Json.put("codigoOcorrencia", entorpecente.getEntorpCodigoOcorrencia());
						obj_Json.put("nome", entorpecente.getNomeEntorpecenteOcorrencia());
						obj_Json.put("qtdUn", entorpecente.getQtdUnEntorpecenteOcorrencia());
						obj_Json.put("qtdKg", entorpecente.getQtdKgEntorpecenteOcorrencia());
						obj_Json.put("informacoes", entorpecente.getInformacoesEntorpecenteOcorrencia());
						
						data+= obj_Json.toString();
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
			}catch(Exception e) {
				
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		EntorpecentesOcorrenciaBean entorpecentesBean = new EntorpecentesOcorrenciaBean();
		EntorpecenteOcorrenciaDao entorpecentesDao = new EntorpecenteOcorrenciaDao();
		
		if(acao.equalsIgnoreCase("salvar")) {
			entorpecentesBean.setNomeEntorpecenteOcorrencia(request.getParameter("nomeEntorpecente"));
			entorpecentesBean.setQtdUnEntorpecenteOcorrencia(request.getParameter("qtdUn"));
			entorpecentesBean.setQtdKgEntorpecenteOcorrencia(request.getParameter("qtdKg"));
			entorpecentesBean.setInformacoesEntorpecenteOcorrencia(request.getParameter("informacoesAdicionais"));
			entorpecentesBean.setEntorpCodigoOcorrencia(request.getParameter("EntorpCodigoOcorrencia"));
			entorpecentesDao.salvarEntorpecentes(entorpecentesBean);
			
			try {
				List<EntorpecentesOcorrenciaBean> listaEntorpecentes = entorpecentesDao.consultaEntorpecentes(entorpecentesBean);
				if(!listaEntorpecentes.isEmpty()) {
					String data = "";
					int totalLista = listaEntorpecentes.size();
					int index = 1;
					for (EntorpecentesOcorrenciaBean entorpecente : listaEntorpecentes) {
						data += "{"+
									"\"codigoEntorpecente\":\""+entorpecente.getCodigoEntorpecenteOcorrencia()+"\","+
									"\"codigoOcorrencia\":\""+entorpecente.getEntorpCodigoOcorrencia()+"\","+
									"\"nome\":\""+entorpecente.getNomeEntorpecenteOcorrencia()+"\","+
									"\"qtdUn\":\""+entorpecente.getQtdUnEntorpecenteOcorrencia()+"\","+
									"\"qtdKg\":\""+entorpecente.getQtdKgEntorpecenteOcorrencia()+"\","+
									"\"informacoes\":\""+entorpecente.getInformacoesEntorpecenteOcorrencia()+"\""+
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

}
