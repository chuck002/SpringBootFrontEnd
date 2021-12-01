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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author javy
 */
@Controller
@RequestMapping("/cliente")
public class ControladorCliente {
    
    RestTemplate rt = new RestTemplate();
    //Recibimos como un array y casteamos luego a List
    Usuario[] usuariosArray;
    List<Usuario> usuarios;

    RestTemplate rtVe = new RestTemplate();
    Vehiculo[] vehiculosArray;
    List<Vehiculo> vehiculos;

    RestTemplate rtRe = new RestTemplate();
    Reserva[] reservasArray;
    List<Reserva> reservas;
    
    @GetMapping("vehiculos")
    public String getClienteVehiculos(Model modelo, @RequestParam(name = "id_reserva") int id_reserva, @RequestParam(name = "id") int id){
        
        usuariosArray = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        usuarios = Arrays.asList(usuariosArray);

        vehiculosArray = rtVe.getForObject("http://localhost:9090/vehiculos/all", Vehiculo[].class);
        vehiculos = Arrays.asList(vehiculosArray);

        reservasArray = rtRe.getForObject("http://localhost:9090/reservas/all", Reserva[].class);
        reservas = Arrays.asList(reservasArray);
        
        Reserva tmp = new Reserva();
        for (Reserva u : this.reservas) {
            if (id_reserva == u.getId()) {
                tmp = u;
            }
        }

        Usuario tmpUser = new Usuario();
        for (Usuario us : this.usuarios) {
            if (id == us.getId()) {
                tmpUser = us;
            }
        }
        modelo.addAttribute("id", id);
        modelo.addAttribute("vehiculos", tmp.getVehiculos_reservados());
        modelo.addAttribute("usuario", tmpUser);
        
        return "vista_cliente_vehiculos";
    }
    
    @GetMapping("volver")
    public String VolverReservaCliente(Model modelo, @RequestParam(name = "id") int id) {

        usuariosArray = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        usuarios = Arrays.asList(usuariosArray);

        vehiculosArray = rtVe.getForObject("http://localhost:9090/vehiculos/all", Vehiculo[].class);
        vehiculos = Arrays.asList(vehiculosArray);

        reservasArray = rtRe.getForObject("http://localhost:9090/reservas/all", Reserva[].class);
        reservas = Arrays.asList(reservasArray);
        
        Usuario tmpUser = new Usuario();
        for (Usuario us : this.usuarios) {
            if (id == us.getId()) {
                tmpUser = us;
            }
        }
        
        modelo.addAttribute("usuario", tmpUser);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);

        return "vista_cliente";
    }
    
}
