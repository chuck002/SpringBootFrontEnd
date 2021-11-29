/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.controllers;

import java.util.Arrays;
import java.util.List;
import javax.sound.midi.MidiDevice;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Reserva;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Usuario;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Vehiculo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author javy
 */
@Controller
@RequestMapping("/login")
public class ControladorLogin {

    
    @PostMapping("/entrar")
    public String getUserAndPass(Model modelo, @RequestParam(name = "user") String user,
            @RequestParam(name = "pass") String pass) {
        String vista = "";

        RestTemplate rt = new RestTemplate();
        //Recibimos como un array y casteamos luego a List
        Usuario[] usuariosArray = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        List<Usuario> usuarios = Arrays.asList(usuariosArray);
        
        RestTemplate rtVe = new RestTemplate();
        Vehiculo[] vehiculosArray = rtVe.getForObject("http://localhost:9090/vehiculos/all", Vehiculo[].class);
        List<Vehiculo> vehiculos = Arrays.asList(vehiculosArray);
        
        RestTemplate rtRe = new RestTemplate();
        Reserva[] reservasArray = rtRe.getForObject("http://localhost:9090/reservas/all", Reserva[].class);
        List<Reserva> reservas = Arrays.asList(reservasArray);
        
        boolean estaUser = false;
        Usuario us = new Usuario();
        for (Usuario u : usuarios) {
            if (u.getUser().equals(user)) {
               estaUser = true;
               us = u;
            }
        }
        if(estaUser){
                if (!us.getPass().equals(pass)){
                    us.setRol(0);
                    System.out.println("Password Incorrecto");
                    vista = "vista_error";
                    modelo.addAttribute("error", -1);
                    modelo.addAttribute("ErrorMsg", "Password Incorrecto vuelve al login e intenta nuevamente.");
                }
        }else{
            System.out.println("Usuario Inexistente");
                vista = "vista_error";
                modelo.addAttribute("error", -2);
                modelo.addAttribute("ErrorMsg", "Usuario Inexistente vuelve al login e intenta nuevamente.");
        }
        

        switch (us.getRol()) {
            case 1:
                Usuario usuario_add = new Usuario();
                
                modelo.addAttribute("datos_reservas", reservas);
                modelo.addAttribute("datos_vehiculos", vehiculos);
                modelo.addAttribute("datos_usuarios", usuarios);
                
                modelo.addAttribute("usuario_add", usuario_add);
                modelo.addAttribute("active", 1);
                vista = "vista_administrador";
                break;
            case 2:
                modelo.addAttribute("datos_reservas", reservas);
                modelo.addAttribute("datos_usuarios", usuarios);
                modelo.addAttribute("active", 1);
                vista = "vista_vendedor";
                break;
            case 3:
                modelo.addAttribute("datos_reservas", reservas);
              
                vista = "vista_cliente";
                break;
            default:
                vista = "vista_error";
                break;
        }
        //modelo.addAttribute("nombre", us.getNombre());
        modelo.addAttribute("usuario", us);
        return vista;
    }
}
