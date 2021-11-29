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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author javy
 */
@Controller
@RequestMapping("/admin")
public class ControladorAdmin {

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

    @RequestMapping("/usuarios/all")
    public String getAllUser(Model modelo, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        for (Usuario u : usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_vehiculos", vehiculos);
        modelo.addAttribute("datos_usuarios", usuarios);
        modelo.addAttribute("active", 1);

        return "vista_administrador";
    }

    @RequestMapping("/vehiculos/all")
    public String getAllVehicle(Model modelo, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        for (Usuario u : usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_vehiculos", vehiculos);
        modelo.addAttribute("datos_usuarios", usuarios);
        modelo.addAttribute("active", 0);

        return "vista_administrador";
    }

    @PostMapping("/usuarios/add")
    public String AddUser(Model modelo, @RequestParam(name = "user") String user,
            @RequestParam(name = "pass") String pass,
            @RequestParam(name = "rol") int rol,
            @RequestParam(name = "nombre") String nombre,
            @RequestParam(name = "dni") int dni,
            @RequestParam(name = "direccion") String direccion,
            @RequestParam(name = "telefono") String telefono,
            @RequestParam(name = "sucursal") int sucursal,
            @RequestParam(name = "id") int id
    ) {

        RestTemplate rtAdd = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Usuario> request = new HttpEntity<>(new Usuario(null, user, pass, rol, nombre, dni, direccion, telefono, sucursal), headers);

        Usuario u = rtAdd.postForObject("http://localhost:9090/usuarios/add", request, Usuario.class);

        Usuario tmp = new Usuario();
        for (Usuario us : usuarios) {
            if (id == us.getId()) {
                tmp = us;
            }
        }
        Usuario[] usuariosArray2 = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        List<Usuario> usuarios2 = Arrays.asList(usuariosArray2);
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_vehiculos", vehiculos);
        modelo.addAttribute("datos_usuarios", usuarios2);
        modelo.addAttribute("active", 1);

        return "vista_administrador";

    }
    
    @GetMapping("usuarios/edit/{id}")
    public String modalUpdateUser(@PathVariable("id") int id, Model modelo){
        
        Usuario usuario_edit = new Usuario();
        
        RestTemplate rtEdit = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String url = "http://localhost:9090/usuarios/edit/"+id;
        Usuario user = rtEdit.getForObject(url , Usuario.class);
        
        modelo.addAttribute("usuario_edit", user);
        
        return "template/admin_forms_template::usuarios_edit";
    }

}
