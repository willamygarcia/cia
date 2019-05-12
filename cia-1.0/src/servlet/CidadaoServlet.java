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

import beans.CidadaoBean;
import dao.CidadaoDao;



@WebServlet(name = "Cidadao", urlPatterns= {"/pages/Cidadao"})
@MultipartConfig
public class CidadaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CidadaoServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CidadaoBean cidadaoBean = new CidadaoBean();
		CidadaoDao cidadaoDao = new CidadaoDao();
		
		cidadaoBean.setCodigo(Integer.parseInt(request.getParameter("codigo")));
		String acao = request.getParameter("acao");
		
		if(acao.equals("excluir")){
			

			if(cidadaoDao.excluir(cidadaoBean)) {
				
				request.setAttribute("checado", "checked");
				request.setAttribute("excluido", "<script type=\"text/javascript\">alert(\"Cidadão Excluido com Sucesso!!!\");</script>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
				dispatcher.forward(request, response);
				
			}
				
		}else if(acao.equals("editar")){
		
			cidadaoBean = cidadaoDao.consultaPorCodigo(cidadaoBean);
			request.setAttribute("opcao1", "<option selected=\"selected\">");
			request.setAttribute("opcao2", "</option>");
			request.setAttribute("opcaoF1", "<option selected=\"selected\">");
			request.setAttribute("opcaoF2", "</option>");
			request.setAttribute("cidadao", cidadaoBean);
			request.setAttribute("selecionarDelegacia", "selected");
			request.setAttribute("acaoBtnSalvar", "alterar");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
			dispatcher.forward(request, response);
			
		}else if(acao.equals("visualizar")) {
			
			cidadaoBean = cidadaoDao.consultaPorCodigo(cidadaoBean);
			request.setAttribute("cidadao", cidadaoBean);
			RequestDispatcher dispatcher = request.getRequestDispatcher("cidadaoView.jsp");
			dispatcher.forward(request, response);
		}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String acao = request.getParameter("acao");
		String codigo = request.getParameter("codigo");
			
		if(acao.equals("salvar") && codigo.equals("")) {
			CidadaoBean cidadaoBean = new CidadaoBean();
			CidadaoDao cidadaoDao = new CidadaoDao();
			cidadaoBean.setNome(request.getParameter("nome"));
			cidadaoBean.setAlcunha(request.getParameter("alcunha"));
			cidadaoBean.setNascimento(request.getParameter("nascimento"));
			cidadaoBean.setTelefone(request.getParameter("telefone"));
			cidadaoBean.setRg(request.getParameter("rg"));
			cidadaoBean.setCpf(request.getParameter("cpf"));
			cidadaoBean.setOrgaoEmissor(request.getParameter("orgaoEmissor"));
			cidadaoBean.setUf(request.getParameter("ufRg"));
			cidadaoBean.setMae(request.getParameter("mae"));
			cidadaoBean.setPai(request.getParameter("pai"));
			cidadaoBean.setCep(request.getParameter("cep"));
			cidadaoBean.setEndereco(request.getParameter("rua"));
			cidadaoBean.setNumero(request.getParameter("numero"));
			cidadaoBean.setComplemento(request.getParameter("complemento"));
			cidadaoBean.setBairro(request.getParameter("bairro"));
			cidadaoBean.setCidade(request.getParameter("cidade"));
			cidadaoBean.setUfEndereco(request.getParameter("uf"));
			cidadaoBean.setPais(request.getParameter("pais"));
			cidadaoBean.setDataUtimaInfracao(request.getParameter("dataInfracao"));
			cidadaoBean.setDelegacia(request.getParameter("delegacia"));
			cidadaoBean.setFaccao(request.getParameter("faccao"));
			cidadaoBean.setEndOcorrencia(request.getParameter("enderecoO"));
			cidadaoBean.setBairroOcorrencia(request.getParameter("bairroOcorrencia"));
			cidadaoBean.setCidadeOcorrencia(request.getParameter("cidadeOcorriencia"));
			cidadaoBean.setReferenciaOcorrencia(request.getParameter("referenciaOcorrecia"));
			cidadaoBean.setHistoricoJuridico(request.getParameter("artigos"));
			cidadaoBean.setTatuRosto(request.getParameter("rosto"));
			cidadaoBean.setTatuPescoco(request.getParameter("pescoco"));
			cidadaoBean.setTatuTorax(request.getParameter("torax"));
			cidadaoBean.setTatuBracoDireito(request.getParameter("bracoDireito"));
			cidadaoBean.setTatuBracoEsquerdo(request.getParameter("bracoEsquerdo"));
			cidadaoBean.setTatuPernaDireita(request.getParameter("pernaDireita"));
			cidadaoBean.setTatuPernaEsquerda(request.getParameter("pernaEsquerda"));
			cidadaoBean.setTatuCostas(request.getParameter("costas"));
			
			ArrayList<String> listaFotos = encodeFoto("fotoFrente", "fotoLado", "fotoCostas", "fotoDiversas01", "fotoDiversas02", request);
			
			cidadaoBean.setFotoFrente(listaFotos.get(0));
			cidadaoBean.setFotoLado(listaFotos.get(1));
			cidadaoBean.setFotoCostas(listaFotos.get(2));
			cidadaoBean.setFotoDiversas01(listaFotos.get(3));
			cidadaoBean.setFotoDiversas02(listaFotos.get(4));
			cidadaoBean.setHistorico(request.getParameter("historioOcorrencia"));
			
			cidadaoDao.cadastrarCidadão(cidadaoBean);
			request.setAttribute("salvo", "<script type=\"text/javascript\">alert(\"Cidadão Cadastrado com Sucesso!!!\");</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
			dispatcher.forward(request, response);
			
		}else if(acao.equals("limpar")) {
			request.setAttribute("checado","checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
			dispatcher.forward(request, response);
	
		}else if(acao.equals("consultar")) {
			CidadaoBean cidadaoBean = new CidadaoBean();
			CidadaoDao cidadaoDao = new CidadaoDao();
			cidadaoBean.setNome(request.getParameter("nomeConsulta"));
			cidadaoBean.setMae(request.getParameter("maeCidadaoConsulta"));
			cidadaoBean.setBairro(request.getParameter("bairroConsulta"));
			cidadaoBean.setBairroOcorrencia(request.getParameter("atuacaoConsulta"));
			
			request.setAttribute("checado", "checked");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
			request.setAttribute("consultaTotal", cidadaoDao.consultaTotal(cidadaoBean));
			dispatcher.forward(request, response);
			
		}else if(acao.equals("alterar")){
			CidadaoBean cidadaoBean = new CidadaoBean();
			CidadaoDao cidadaoDao = new CidadaoDao();
			
			cidadaoBean.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			cidadaoBean.setNome(request.getParameter("nome"));
			cidadaoBean.setAlcunha(request.getParameter("alcunha"));
			cidadaoBean.setNascimento(request.getParameter("nascimento"));
			cidadaoBean.setTelefone(request.getParameter("telefone"));
			cidadaoBean.setRg(request.getParameter("rg"));
			cidadaoBean.setCpf(request.getParameter("cpf"));
			cidadaoBean.setOrgaoEmissor(request.getParameter("orgaoEmissor"));
			cidadaoBean.setUf(request.getParameter("ufRg"));
			cidadaoBean.setMae(request.getParameter("mae"));
			cidadaoBean.setPai(request.getParameter("pai"));
			cidadaoBean.setCep(request.getParameter("cep"));
			cidadaoBean.setEndereco(request.getParameter("rua"));
			cidadaoBean.setNumero(request.getParameter("numero"));
			cidadaoBean.setComplemento(request.getParameter("complemento"));
			cidadaoBean.setBairro(request.getParameter("bairro"));
			cidadaoBean.setCidade(request.getParameter("cidade"));
			cidadaoBean.setUfEndereco(request.getParameter("uf"));
			cidadaoBean.setPais(request.getParameter("pais"));
			cidadaoBean.setDataUtimaInfracao(request.getParameter("dataInfracao"));
			cidadaoBean.setDelegacia(request.getParameter("delegacia"));
			cidadaoBean.setFaccao(request.getParameter("faccao"));
			cidadaoBean.setEndOcorrencia(request.getParameter("enderecoO"));
			cidadaoBean.setBairroOcorrencia(request.getParameter("bairroOcorrencia"));
			cidadaoBean.setCidadeOcorrencia(request.getParameter("cidadeOcorriencia"));
			cidadaoBean.setReferenciaOcorrencia(request.getParameter("referenciaOcorrecia"));
			cidadaoBean.setHistoricoJuridico(request.getParameter("artigos"));
			cidadaoBean.setTatuRosto(request.getParameter("rosto"));
			cidadaoBean.setTatuPescoco(request.getParameter("pescoco"));
			cidadaoBean.setTatuTorax(request.getParameter("torax"));
			cidadaoBean.setTatuBracoDireito(request.getParameter("bracoDireito"));
			cidadaoBean.setTatuBracoEsquerdo(request.getParameter("bracoEsquerdo"));
			cidadaoBean.setTatuPernaDireita(request.getParameter("pernaDireita"));
			cidadaoBean.setTatuPernaEsquerda(request.getParameter("pernaEsquerda"));
			cidadaoBean.setTatuCostas(request.getParameter("costas"));
			
			ArrayList<String> listaFotos = encodeFoto("fotoFrente", "fotoLado", "fotoCostas", "fotoDiversas01", "fotoDiversas02", request);
			
			CidadaoBean cidadaoBeanFoto = new CidadaoBean();
			cidadaoBeanFoto = cidadaoDao.consultaPorCodigo(cidadaoBean);
			
			if(!listaFotos.get(0).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				cidadaoBean.setFotoFrente(listaFotos.get(0));
			}else {
				cidadaoBean.setFotoFrente(cidadaoBeanFoto.getFotoFrente());
			}
			if(!listaFotos.get(1).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				cidadaoBean.setFotoLado(listaFotos.get(1));
			}else {
				cidadaoBean.setFotoLado(cidadaoBeanFoto.getFotoLado());
			}
			if(!listaFotos.get(2).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				cidadaoBean.setFotoCostas(listaFotos.get(2));
			}else {
				cidadaoBean.setFotoCostas(cidadaoBeanFoto.getFotoCostas());
			}
			if(!listaFotos.get(3).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				cidadaoBean.setFotoDiversas01(listaFotos.get(3));
			}else {
				cidadaoBean.setFotoDiversas01(cidadaoBeanFoto.getFotoDiversas01());
			}
			if(!listaFotos.get(4).equalsIgnoreCase("data:application/octet-stream;base64,")) {
				cidadaoBean.setFotoDiversas02(listaFotos.get(4));
			}else {
				cidadaoBean.setFotoDiversas02(cidadaoBeanFoto.getFotoDiversas02());
			}	
			
			cidadaoBean.setHistorico(request.getParameter("historioOcorrencia"));
			
			cidadaoDao.alterarCidadao(cidadaoBean);
			
			request.setAttribute("alterado", "<script type=\"text/javascript\">alert(\"Cidadão Alterado com Sucesso!!!\");</script>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroCidadao.jsp");
			dispatcher.forward(request, response);
			
		}
	}

//Codificar fotos em Base64
	private ArrayList<String> encodeFoto(String fotoFrente, String fotoLado, String fotoCosta ,String fotoDiverso01 ,String fotoDiverso02, HttpServletRequest request) {
	
		
		try {
			ArrayList<String> lista = new ArrayList<String>();
			if(ServletFileUpload.isMultipartContent(request)) {
				
				Part fotoFrentePart = request.getPart(fotoFrente);
				Part fotoLadoPart = request.getPart(fotoLado);
				Part fotoCostaPart = request.getPart(fotoCosta);
				Part fotoDiverso01Part = request.getPart(fotoDiverso01);
				Part fotoDiverso02Part = request.getPart(fotoDiverso02);
				
				String foto1 = new Base64().encodeBase64String(converterStreamToByte(fotoFrentePart.getInputStream()));
				foto1 = "data:" + fotoFrentePart.getContentType() + ";base64," + foto1;
				String foto2 = new Base64().encodeBase64String(converterStreamToByte(fotoLadoPart.getInputStream()));
				foto2 =  "data:" + fotoLadoPart.getContentType() + ";base64," + foto2;
				String foto3 = new Base64().encodeBase64String(converterStreamToByte(fotoCostaPart.getInputStream()));
				foto3 =  "data:" + fotoCostaPart.getContentType() + ";base64," + foto3;
				String foto4 = new Base64().encodeBase64String(converterStreamToByte(fotoDiverso01Part.getInputStream()));
				foto4 =  "data:" + fotoDiverso01Part.getContentType() + ";base64," + foto4;
				String foto5 = new Base64().encodeBase64String(converterStreamToByte(fotoDiverso02Part.getInputStream()));
				foto5 =  "data:" + fotoDiverso02Part.getContentType() + ";base64," + foto5;
				
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
