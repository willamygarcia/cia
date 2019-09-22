package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import beans.ArmasOcorrenciaBean;
import beans.EntorpecentesOcorrenciaBean;
import beans.EnvolvidoOcorrenciaBean;
import beans.OcorrenciaBean;
import beans.OrdenamentoOcorrenciaBean;
import beans.VeiculosOcorrenciaBean;
import dao.ArmaOcorrenciaDao;
import dao.EntorpecenteOcorrenciaDao;
import dao.EnvolvioOcorrenciaDao;
import dao.OcorrenciaDao;
import dao.OrdenamentoOcorrenciaDao;
import dao.VeiculoOcorrenciaDao;

@WebServlet(name = "Ocorrencia", urlPatterns = {"/pages/Ocorrencia"})
@MultipartConfig
public class OcorrenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public OcorrenciaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String codigo = request.getParameter("codigo");
		OcorrenciaBean ocorrenciaBean = new OcorrenciaBean();
		OcorrenciaDao ocorrenciaDao = new OcorrenciaDao();
		
		
		if(acao.equals("editar")) {
			ArmasOcorrenciaBean armasBean = new ArmasOcorrenciaBean();
			ArmaOcorrenciaDao armasDao = new ArmaOcorrenciaDao();
			EnvolvidoOcorrenciaBean envolvidosBean = new EnvolvidoOcorrenciaBean();
			EnvolvioOcorrenciaDao envolvidosDao = new EnvolvioOcorrenciaDao();
			OrdenamentoOcorrenciaBean ordenamentoBean = new OrdenamentoOcorrenciaBean();
			OrdenamentoOcorrenciaDao ordenamentoDao = new OrdenamentoOcorrenciaDao();
			EntorpecentesOcorrenciaBean entorpecenteBean = new EntorpecentesOcorrenciaBean();
			EntorpecenteOcorrenciaDao entorpecenteDao = new EntorpecenteOcorrenciaDao();
			VeiculosOcorrenciaBean veiculoBean = new VeiculosOcorrenciaBean();
			VeiculoOcorrenciaDao veiculoDao = new VeiculoOcorrenciaDao();
			
			ocorrenciaBean.setCodigoOcorrencia(Integer.parseInt(codigo));
			armasBean.setCodigoOcorrencia(Integer.parseInt(codigo));
			envolvidosBean.setCodigoOcorrenia(Integer.parseInt(codigo));
			ordenamentoBean.setCodigoOcorrencia(Integer.parseInt(codigo));
			entorpecenteBean.setEntorpCodigoOcorrencia(codigo);
			veiculoBean.setCodigoOcorrencia(codigo);
						
			request.setAttribute("ocorrencia", ocorrenciaDao.consultaEditar(ocorrenciaBean));
			OcorrenciaBean  ocorrenciaHoras = new OcorrenciaBean();
			ocorrenciaHoras = ocorrenciaDao.consultaEditar(ocorrenciaBean);
			request.setAttribute("dataHoraFormato", ocorrenciaBean.getDataHoraOcorrenciaFormato(ocorrenciaHoras.getDataHoraOcorrencia()));
			request.setAttribute("armas", armasDao.consultaTotalArmas(armasBean));
			request.setAttribute("quantidadeArmas",armasDao.consultaTotalArmas(armasBean).size());
			request.setAttribute("envolvidos", envolvidosDao.consultaEnvolvidosTotal(envolvidosBean));
			request.setAttribute("processos", ordenamentoDao.consultaTotalOrdenamento(ordenamentoBean));
			request.setAttribute("entorpecentes", entorpecenteDao.consultaEntorpecentes(entorpecenteBean));
			request.setAttribute("quantidadeEntorpecentes", entorpecenteDao.consultaEntorpecentes(entorpecenteBean).size());
			request.setAttribute("veiculos", veiculoDao.consultaTotalVeiculos(veiculoBean));
			request.setAttribute("quantidadeVeiculos", veiculoDao.consultaTotalVeiculos(veiculoBean).size());
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroOcorrencia.jsp");
			dispatcher.forward(request, response);
			
		}else if(acao.equals("consultarDetalhes")) {
			
		}
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String codigo = request.getParameter("codigoOcorrencia");
		OcorrenciaBean ocorrenciaBean = new OcorrenciaBean();
		OcorrenciaDao ocorrenciaDao = new OcorrenciaDao();
		
		if((acao.equals("iniciarCadastro") || acao.equals("")) && codigo.equals("")) {
			ocorrenciaBean.setMikeOcorrencia(request.getParameter("mikeOcorrencia"));
			ocorrenciaBean.setInqueritoOcorrencia(request.getParameter("inqueritoOcorrencia"));
			ocorrenciaBean.setBoOcorrencia(request.getParameter("boOcorrencia"));
			ocorrenciaBean.setOutrosOcorrencia(request.getParameter("outrosOcorrencia"));
			ocorrenciaBean.setGraduacaoOcorrencia(request.getParameter("graduacaoPostoOcorrencia"));
			ocorrenciaBean.setNumeralOcorrencia(request.getParameter("numeralOcorrencia"));
			ocorrenciaBean.setMatriculaOcorrencia(request.getParameter("matriculaOcorrencia"));
			ocorrenciaBean.setNomeGuerraOcorrencia(request.getParameter("nomeGuerraOcorrencia"));
			ocorrenciaDao.iniciarOcorrencia(ocorrenciaBean);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(ocorrenciaDao.utimoCodigo());
			
		}else if(acao.equals("salvar")) {
			
			ocorrenciaBean.setMikeOcorrencia(request.getParameter("mikeOcorrencia"));
			ocorrenciaBean.setInqueritoOcorrencia(request.getParameter("inqueritoOcorrencia"));
			ocorrenciaBean.setBoOcorrencia(request.getParameter("boOcorrencia"));
			ocorrenciaBean.setOutrosOcorrencia(request.getParameter("outrosOcorrencia"));
			ocorrenciaBean.setGraduacaoOcorrencia(request.getParameter("graduacaoPostoOcorrencia"));
			ocorrenciaBean.setNumeralOcorrencia(request.getParameter("numeralOcorrencia"));
			ocorrenciaBean.setMatriculaOcorrencia(request.getParameter("matriculaOcorrencia"));
			ocorrenciaBean.setNomeGuerraOcorrencia(request.getParameter("nomeGuerraOcorrencia"));
			ocorrenciaBean.setDataHoraOcorrencia(request.getParameter("dataHoraOcorrencia"));
			ocorrenciaBean.setDataHoraInicioComunicacao(request.getParameter("dataHoraInicioComunicacao"));
			ocorrenciaBean.setDataHoraFimComunicacao(request.getParameter("dataHoraFimComunicacao"));
			ocorrenciaBean.setDelegaciaOcorrencia(request.getParameter("delegaciaOcorrencia"));
			ocorrenciaBean.setTipoOcorrencia(request.getParameter("tipoOcorrencia"));
			ocorrenciaBean.setEnderecoOcorrencia(request.getParameter("enderecoOcorrencia"));
			ocorrenciaBean.setBairroOcorrencia(request.getParameter("bairroOcorrencia"));
			ocorrenciaBean.setCidadeOcorrencia(request.getParameter("cidadeOcorrencia"));
			ocorrenciaBean.setReferenciaOcorrencia(request.getParameter("referenciaOcorrencia"));
			ocorrenciaBean.setDelegadoOcorrencia(request.getParameter("delegadoOcorrencia"));
			ocorrenciaBean.setEscrivaoOcorrencia(request.getParameter("escrivaoOcorrencia"));
			ocorrenciaBean.setAutoridadeMilitarOcorrencia(request.getParameter("autoridadeMilitar"));
			ArrayList<String> listaFotos = encodeFoto("fotoDiversas01", "fotoDiversas02", "fotoDiversas03", "fotoDiversas04", "fotoDiversas05", request);
			ocorrenciaBean.setFotosDiversasOcorrencia01(listaFotos.get(0));
			ocorrenciaBean.setFotosDiversasOcorrencia02(listaFotos.get(1));
			ocorrenciaBean.setFotosDiversasOcorrencia03(listaFotos.get(2));
			ocorrenciaBean.setFotosDiversasOcorrencia04(listaFotos.get(3));
			ocorrenciaBean.setFotosDiversasOcorrencia05(listaFotos.get(4));
			ocorrenciaBean.setHistoricoOcorrencia(request.getParameter("historicoOcorrencia"));
			ocorrenciaDao.salvarOcorrencia(ocorrenciaBean);
			System.out.println("SALVANDO Cadastro");
			
		}else if(acao.equals("alterar")) {
			ocorrenciaBean.setCodigoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			ocorrenciaBean.setMikeOcorrencia(request.getParameter("mikeOcorrencia"));
			ocorrenciaBean.setInqueritoOcorrencia(request.getParameter("inqueritoOcorrencia"));
			ocorrenciaBean.setBoOcorrencia(request.getParameter("boOcorrencia"));
			ocorrenciaBean.setOutrosOcorrencia(request.getParameter("outrosOcorrencia"));
			ocorrenciaBean.setGraduacaoOcorrencia(request.getParameter("graduacaoPostoOcorrencia"));
			ocorrenciaBean.setNumeralOcorrencia(request.getParameter("numeralOcorrencia"));
			ocorrenciaBean.setMatriculaOcorrencia(request.getParameter("matriculaOcorrencia"));
			ocorrenciaBean.setNomeGuerraOcorrencia(request.getParameter("nomeGuerraOcorrencia"));
			ocorrenciaBean.setDataHoraOcorrencia(request.getParameter("dataHoraOcorrencia"));
			ocorrenciaBean.setDataHoraInicioComunicacao(request.getParameter("dataHoraInicioComunicacao"));
			ocorrenciaBean.setDataHoraFimComunicacao(request.getParameter("dataHoraFimComunicacao"));
			ocorrenciaBean.setDelegaciaOcorrencia(request.getParameter("delegaciaOcorrencia"));
			ocorrenciaBean.setTipoOcorrencia(request.getParameter("tipoOcorrencia"));
			ocorrenciaBean.setEnderecoOcorrencia(request.getParameter("enderecoOcorrencia"));
			ocorrenciaBean.setBairroOcorrencia(request.getParameter("bairroOcorrencia"));
			ocorrenciaBean.setCidadeOcorrencia(request.getParameter("cidadeOcorrencia"));
			ocorrenciaBean.setReferenciaOcorrencia(request.getParameter("referenciaOcorrencia"));
			ocorrenciaBean.setDelegadoOcorrencia(request.getParameter("delegadoOcorrencia"));
			ocorrenciaBean.setEscrivaoOcorrencia(request.getParameter("escrivaoOcorrencia"));
			ocorrenciaBean.setAutoridadeMilitarOcorrencia(request.getParameter("autoridadeMilitar"));
			ArrayList<String> listaFotos = encodeFoto("fotoDiversas01", "fotoDiversas02", "fotoDiversas03", "fotoDiversas04", "fotoDiversas05", request);
			
			OcorrenciaBean ocorrenciaFotos = new OcorrenciaBean();
			ocorrenciaFotos = ocorrenciaDao.consultaEditar(ocorrenciaBean);
			
			
			if(!listaFotos.get(0).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				ocorrenciaBean.setFotosDiversasOcorrencia01(listaFotos.get(0));
			}else {
				ocorrenciaBean.setFotosDiversasOcorrencia01(ocorrenciaFotos.getFotosDiversasOcorrencia01());
			}
			if(!listaFotos.get(1).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				ocorrenciaBean.setFotosDiversasOcorrencia02(listaFotos.get(1));
			}else {
				ocorrenciaBean.setFotosDiversasOcorrencia02(ocorrenciaFotos.getFotosDiversasOcorrencia02());
			}
			if(!listaFotos.get(2).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				ocorrenciaBean.setFotosDiversasOcorrencia03(listaFotos.get(2));
			}else {
				ocorrenciaBean.setFotosDiversasOcorrencia03(ocorrenciaFotos.getFotosDiversasOcorrencia03());
			}
			if(!listaFotos.get(3).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				ocorrenciaBean.setFotosDiversasOcorrencia04(listaFotos.get(3));
			}else {
				ocorrenciaBean.setFotosDiversasOcorrencia04(ocorrenciaFotos.getFotosDiversasOcorrencia04());
			}
			if(!listaFotos.get(4).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				ocorrenciaBean.setFotosDiversasOcorrencia05(listaFotos.get(4));
			}else {
				ocorrenciaBean.setFotosDiversasOcorrencia05(ocorrenciaFotos.getFotosDiversasOcorrencia05());
			}
			/*ocorrenciaBean.setFotosDiversasOcorrencia02(listaFotos.get(1));
			ocorrenciaBean.setFotosDiversasOcorrencia03(listaFotos.get(2));
			ocorrenciaBean.setFotosDiversasOcorrencia04(listaFotos.get(3));
			ocorrenciaBean.setFotosDiversasOcorrencia05(listaFotos.get(4));*/
			ocorrenciaBean.setHistoricoOcorrencia(request.getParameter("historicoOcorrencia"));
			ocorrenciaDao.alterarOcorrencia(ocorrenciaBean);
			
			request.setAttribute("alterado", "<script type=\"text/javascript\">alert(\"Ocorrência Salva com Sucesso!!!\");</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroOcorrencia.jsp");
			dispatcher.forward(request, response);
			System.out.println("Alterando Cadastro");
		}else if(acao.equals("editar")) {
			ocorrenciaBean.setCodigoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			request.setAttribute("ocorrecia", ocorrenciaDao.consultaEditar(ocorrenciaBean));
			request.setAttribute("", "");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroOcorrencia.jsp");
			dispatcher.forward(request, response);
			
		}else if(acao.equals("consultar")) {
			ocorrenciaBean.setMikeOcorrencia(request.getParameter("mikeConsulta"));
			ocorrenciaBean.setNomeGuerraOcorrencia(request.getParameter("noticianteOcorrenciaConsulta"));
			ocorrenciaBean.setBairroOcorrencia(request.getParameter("bairroConsulta"));
			ocorrenciaBean.setDataHoraOcorrencia(request.getParameter("dataOcorrenciaConsulta"));
			
			System.out.println("Consultar"+request.getParameter("mikeConsulta"));
			request.setAttribute("consultaTotal", ocorrenciaDao.consultaTotalOcorrencia(ocorrenciaBean));
			request.setAttribute("checado", "checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroOcorrencia.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
//CODIFICAR FOTOS EM BASE64
		private ArrayList<String> encodeFoto(String fotoDiversas01, String fotoDiversas02, String fotoDiversas03 ,String fotoDiversas04 ,String fotoDiversas05, HttpServletRequest request) {
			
			try {
				ArrayList<String> lista = new ArrayList<String>();
				if(ServletFileUpload.isMultipartContent(request)) {
					
					Part fotoDiversa1Part = request.getPart(fotoDiversas01);
					Part fotoDiversa2Part = request.getPart(fotoDiversas02);
					Part fotoDiversa3Part = request.getPart(fotoDiversas03);
					Part fotoDiversa4Part = request.getPart(fotoDiversas04);
					Part fotoDiversa5Part = request.getPart(fotoDiversas05);
					
					new Base64();
					String foto1 = Base64.encodeBase64String(converterStreamToByte(fotoDiversa1Part.getInputStream()));
					foto1 = "data:" + fotoDiversa1Part.getContentType() + ";base64," + foto1;
					new Base64();
					String foto2 = Base64.encodeBase64String(converterStreamToByte(fotoDiversa2Part.getInputStream()));
					foto2 =  "data:" + fotoDiversa2Part.getContentType() + ";base64," + foto2;
					new Base64();
					String foto3 = Base64.encodeBase64String(converterStreamToByte(fotoDiversa3Part.getInputStream()));
					foto3 =  "data:" + fotoDiversa3Part.getContentType() + ";base64," + foto3;
					new Base64();
					String foto4 = Base64.encodeBase64String(converterStreamToByte(fotoDiversa4Part.getInputStream()));
					foto4 =  "data:" + fotoDiversa4Part.getContentType() + ";base64," + foto4;
					new Base64();
					String foto5 = Base64.encodeBase64String(converterStreamToByte(fotoDiversa5Part.getInputStream()));
					foto5 =  "data:" + fotoDiversa5Part.getContentType() + ";base64," + foto5;
					
					lista.add(foto1);
					lista.add(foto2);
					lista.add(foto3);
					lista.add(foto4);
					lista.add(foto5);
				}
				
				return lista;
				
			}catch (Exception e) {
				
				e.printStackTrace();
				return null;
			}
			
		}
//CONVERTE ImputStream EM Array DE Bytes
		private byte[] converterStreamToByte(InputStream inputStream) {
			try {
				ByteArrayOutputStream arrayOutputStream = new ByteArrayOutputStream();
				int reads = inputStream.read();
				
				while(reads != -1) {
					arrayOutputStream.write(reads);
					reads = inputStream.read();
				}
				
				return arrayOutputStream.toByteArray();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				return null;
			}
			
		}

}
