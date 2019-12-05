package relatorios;

import java.util.ArrayList;
import java.util.List;


import beans.UsuariosBean;

public class User_RelatorioUsuario {

	public static List<UsuariosBean> listaUsuario(){
		
		List<UsuariosBean> listaUsuario = new ArrayList<UsuariosBean>();
		
		UsuariosBean usuario1 = new UsuariosBean();
		UsuariosBean usuario2 = new UsuariosBean();
		UsuariosBean usuario3 = new UsuariosBean();
		UsuariosBean usuario4 = new UsuariosBean();
		usuario1.setCodigoUsuarios(10);
		usuario1.setNomeCompletoUsuarios("Willamy");
		usuario1.setNomeUsuarios("willamy.garcia");
		usuario1.setEmailUsuario("willamy.t.i@gmail.com");
		usuario1.setNivelUsuarios(1);
		
		usuario2.setCodigoUsuarios(11);
		usuario2.setNomeCompletoUsuarios("LIVIA GARCIA");
		usuario2.setNomeUsuarios("livia.garcia");
		usuario2.setEmailUsuario("livia.t.i@gmail.com");
		usuario2.setNivelUsuarios(2);
		
		usuario3.setCodigoUsuarios(12);
		usuario3.setNomeCompletoUsuarios("Beatriz");
		usuario3.setNomeUsuarios("beatriz.garcia");
		usuario3.setEmailUsuario("beatriz.t.i@gmail.com");
		usuario3.setNivelUsuarios(3);
		
		usuario4.setCodigoUsuarios(13);
		usuario4.setNomeCompletoUsuarios("luciana");
		usuario4.setNomeUsuarios("luciana.garcia");
		usuario4.setEmailUsuario("luciana.t.i@gmail.com");
		usuario4.setNivelUsuarios(2);
		
		listaUsuario.add(usuario1);
		listaUsuario.add(usuario2);
		listaUsuario.add(usuario3);
		listaUsuario.add(usuario4);
		
		return listaUsuario;
	}
	
	
}
