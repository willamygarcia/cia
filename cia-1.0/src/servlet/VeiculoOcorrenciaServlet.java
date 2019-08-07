package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import beans.VeiculosOcorrenciaBean;
import dao.VeiculoOcorrenciaDao;

@WebServlet(name = "VeiculoOcorrencia", urlPatterns = {"/pages/VeiculoOcorrencia"})
public class VeiculoOcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public VeiculoOcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		VeiculosOcorrenciaBean veiculoBean = new VeiculosOcorrenciaBean();
		if(acao.equalsIgnoreCase("consulta")) {
			veiculoBean.setCodigoOcorrencia(request.getParameter("codigoOcorrencia"));
			
			
			
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		VeiculosOcorrenciaBean veiculoBean = new VeiculosOcorrenciaBean();
		VeiculoOcorrenciaDao veiculoDao = new VeiculoOcorrenciaDao();
		
		if(acao.equals("salvar")) {
			veiculoBean.setPlacaVeiculoOco(request.getParameter("placa"));
			veiculoBean.setMaracaVeiculoOco(request.getParameter("marca"));
			veiculoBean.setModeloVeiculoOco(request.getParameter("modelo"));
			veiculoBean.setTipoVeiculoOco(request.getParameter("tipo"));
			veiculoBean.setCorVeiculoOco(request.getParameter("cor"));
			veiculoBean.setAnoFabVeiculoOco(request.getParameter("anoFab"));
			veiculoBean.setAnoModVeiculoOco(request.getParameter("anoMod"));
			veiculoBean.setCodigoOcorrencia(request.getParameter("codigoOcorrencia"));
			veiculoDao.salvarVeiculoOcoDao(veiculoBean);
			
			try {
				List<VeiculosOcorrenciaBean> listVeiculos = veiculoDao.consultaTotalVeiculos(veiculoBean);
				if(!listVeiculos.isEmpty()) {
					int total = listVeiculos.size();
					String data = "";
					int index = 1;
					JSONObject obj_json = new JSONObject();
					for(VeiculosOcorrenciaBean veiculos : listVeiculos) {
						obj_json.put("codigoVeiculo", veiculos.getCodigoVeiculoOco());
						obj_json.put("codigoOcorrencia", veiculos.getCodigoOcorrencia());
						obj_json.put("placa", veiculos.getPlacaVeiculoOco());
						obj_json.put("marca", veiculos.getMaracaVeiculoOco());
						obj_json.put("modelo", veiculos.getModeloVeiculoOco());
						obj_json.put("tipo", veiculos.getTipoVeiculoOco());
						obj_json.put("anoFab", veiculos.getAnoFabVeiculoOco());
						obj_json.put("anoMod", veiculos.getAnoModVeiculoOco());
						
						data+= obj_json.toString();
						if(index < total) {
							data+=",";
						}
						
						index++;
						
					}
					String dados = "["+
										data + 
									"]";
					
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");	
					response.setStatus(200);
					response.getWriter().write(dados);
						
				}
			}catch(Exception e){
				
			}
		}
	}

}
