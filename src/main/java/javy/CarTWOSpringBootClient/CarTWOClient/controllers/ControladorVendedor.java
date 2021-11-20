/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.controllers;

import java.util.Arrays;
import java.util.List;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Reserva;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Usuario;
import javy.CarTWOSpringBootClient.CarTWOClient.entities.Vehiculo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author javy
 */
@Controller
@RequestMapping("vendedor")
public class ControladorVendedor {
    
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

    @RequestMapping("/clientes/all")
    public String getAllClient(Model modelo, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        for(Usuario u: usuarios){
            if(id == u.getId()){
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_usuarios", usuarios);
        modelo.addAttribute("active", 1);

        return "vista_vendedor";
    }
    
    @RequestMapping("/reservas/all")
    public String getAllReservation(Model modelo, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        for(Usuario u: usuarios){
            if(id == u.getId()){
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_usuarios", usuarios);
        modelo.addAttribute("active", 0);

        return "vista_vendedor";
    }
    
}
