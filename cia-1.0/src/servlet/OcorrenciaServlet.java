package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

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
			System.out.println("sALVANDO Cadastro");
		}else if(acao.equals("alterar")) {
			System.out.println("Alterando");
		}
	}
	
	
	//Codificar fotos em Base64
		private ArrayList<String> encodeFoto(String fotoDiversa01, String fotoDiversa02, String fotoDiversa03 ,String fotoDiversa04 ,String fotoDiversa05, HttpServletRequest request) {
		
			
			try {
				ArrayList<String> lista = new ArrayList<String>();
				if(ServletFileUpload.isMultipartContent(request)) {
					
					Part fotoDiversa1Part = request.getPart(fotoDiversa01);
					Part fotoDiversa2Part = request.getPart(fotoDiversa02);
					Part fotoDiversa3Part = request.getPart(fotoDiversa03);
					Part fotoDiversa4Part = request.getPart(fotoDiversa04);
					Part fotoDiversa5Part = request.getPart(fotoDiversa05);
					
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
	//Converte ImputStream em Array de Bytes	
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
