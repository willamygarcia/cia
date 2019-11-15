package servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONObject;

import beans.DocumentosOcorrenciaBean;
import dao.DocumentoOcorrenciaDao;

@WebServlet( name = "DocumentosOcorrencia", urlPatterns="/pages/DocumentosOcorrencia")
public class DocumentosOcorrencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DocumentosOcorrencia() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		DocumentosOcorrenciaBean documentosBean = new DocumentosOcorrenciaBean();
		DocumentoOcorrenciaDao documentoDao = new DocumentoOcorrenciaDao();
		
		if(acao.equalsIgnoreCase("remover")) {
			documentosBean.setCodigoDocumento(Integer.parseInt(request.getParameter("codigoDocumento")));
			documentosBean.setCodigoDocumentoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			documentoDao.removerDocumento(documentosBean);
			
			try {
				List<DocumentosOcorrenciaBean> listaDocumentos = documentoDao.consultaDocumentoTotal(documentosBean);
				if(!listaDocumentos.isEmpty()) {
					int index = 1;
					int total = listaDocumentos.size();
					String data = "";
					JSONObject jsonObject = new JSONObject();
					for (DocumentosOcorrenciaBean documentos : listaDocumentos ) {
						jsonObject.put("codigoDocumento", documentos.getCodigoDocumento());
						jsonObject.put("codigoOcorrencia", documentos.getCodigoDocumentoOcorrencia());
						jsonObject.put("descricao", documentos.getDescricaoDocumento());
						jsonObject.put("documento", documentos.getDocumento());
						data+= jsonObject.toString();
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
				
				
			} catch (Exception e) {
			
			}
		}else if(acao.equalsIgnoreCase("visualizar")) {
			int codigoDocumento = Integer.parseInt(request.getParameter("codigoDocumento"));
			documentosBean.setCodigoDocumento(codigoDocumento);
			documentosBean = documentoDao.consultaDocumento(documentosBean);
			if(documentosBean.getDocumento() != null) {
				String imagem = documentosBean.getDocumento().split(",")[1];
				
				new Base64();
				byte [] imagemBytes = Base64.decodeBase64(imagem);
				InputStream is = new ByteArrayInputStream(imagemBytes);
				int read = 0;
				byte [] bytes = new byte[1024];
				OutputStream os = response.getOutputStream();
				while((read = is.read(bytes)) != -1) {
					os.write(bytes, 0 , read);
				}
			
				os.flush();
				os.close();
			}
		}else if(acao.equalsIgnoreCase("download")) {
			int codigoDocumento = Integer.parseInt(request.getParameter("codigoDocumento"));
			documentosBean.setCodigoDocumento(codigoDocumento);
			documentosBean = documentoDao.consultaDocumento(documentosBean);
			if(documentosBean.getDocumento() != null) {
				String imagem = documentosBean.getDocumento().split(",")[1];
				response.setHeader("Content-Disposition", "attachment;filename=documento.pdf");
				new Base64();
				byte [] imagemBytes = Base64.decodeBase64(imagem);
				InputStream is = new ByteArrayInputStream(imagemBytes);
				int read = 0;
				byte [] bytes = new byte[1024];
				OutputStream os = response.getOutputStream();
				while((read = is.read(bytes)) != -1) {
					os.write(bytes, 0 , read);
				}
				os.flush();
				os.close();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		DocumentosOcorrenciaBean documentosBean = new DocumentosOcorrenciaBean();
		DocumentoOcorrenciaDao documentoDao = new DocumentoOcorrenciaDao();
		
		if(acao.equalsIgnoreCase("salvar")) {
			documentosBean.setCodigoDocumentoOcorrencia(Integer.parseInt(request.getParameter("codigoOcorrencia")));
			documentosBean.setDescricaoDocumento(request.getParameter("descricaoDocumento"));
			documentosBean.setDocumento(request.getParameter("documentoDocumento"));
			documentoDao.salvarDocumento(documentosBean);
			
			try {
				List<DocumentosOcorrenciaBean> listaDocumentos = documentoDao.consultaDocumentoTotal(documentosBean);
				if(!listaDocumentos.isEmpty()) {
					int index = 1;
					int total = listaDocumentos.size();
					String data = "";
					JSONObject jsonObject = new JSONObject();
					for (DocumentosOcorrenciaBean documentos : listaDocumentos ) {
						jsonObject.put("codigoDocumento", documentos.getCodigoDocumento());
						jsonObject.put("codigoOcorrencia", documentos.getCodigoDocumentoOcorrencia());
						jsonObject.put("descricao", documentos.getDescricaoDocumento());
						jsonObject.put("documento", documentos.getDocumento());
						data+= jsonObject.toString();
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
				
				
			} catch (Exception e) {
			
			}
			
			
		}
	}

}
