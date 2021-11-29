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
    Usuario[] usuariosArray;
    List<Usuario> usuarios;

    RestTemplate rtVe = new RestTemplate();
    Vehiculo[] vehiculosArray;
    List<Vehiculo> vehiculos;

    RestTemplate rtRe = new RestTemplate();
    Reserva[] reservasArray;
    List<Reserva> reservas;

    @RequestMapping("/usuarios/all")
    public String getAllUser(Model modelo, @RequestParam(name = "id") int id) {
        cargarDatosAdmin();
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);
        modelo.addAttribute("active", 1);

        return "vista_administrador";
    }

    @GetMapping("/usuarios/add")
    public String AddUserView(Model modelo, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        cargarDatosAdmin();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("action", action);

        return "vista_administrador_crud";
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
        for (Usuario us : this.usuarios) {
            if (id == us.getId()) {
                tmp = us;
            }
        }
        cargarDatosAdmin();
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);
        modelo.addAttribute("active", 1);

        return "vista_administrador";

    }

    @GetMapping("usuarios/edit/{id}")
    public String UpdateUserView(Model modelo, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        cargarDatosAdmin();
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
 
        modelo.addAttribute("usuario_edit", tmp);
        modelo.addAttribute("action", action);

        return "vista_administrador_crud";
    }

    @PostMapping("usuarios/edit/{id}")
    public String UpdateUser(Model modelo, Usuario usuario, @RequestParam(name = "user_id") int user_id) {

        RestTemplate rtEdit = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Usuario> request = new HttpEntity<>(usuario, headers);

        String url = "http://localhost:9090/usuarios/edit/" + usuario.getId();
        rtEdit.put(url, request, Usuario.class);

        cargarDatosAdmin();

        Usuario tmp = new Usuario();
        for (Usuario us : this.usuarios) {
            if (user_id == us.getId()) {
                tmp = us;
            }
        }

        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);
        modelo.addAttribute("active", 1);

        return "vista_administrador";
    }

    @GetMapping("usuarios/delete/{id}")
    public String DeleteUserView(Model modelo, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        /* Usuario usuario_edit = new Usuario();
        
        RestTemplate rtEdit = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String url = "http://localhost:9090/usuarios/edit/"+id;
        Usuario user = rtEdit.getForObject(url , Usuario.class);
        
        modelo.addAttribute("usuario_edit", user);
         */
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("action", action);

        return "vista_administrador_crud";
    }

    @RequestMapping("/vehiculos/all")
    public String getAllVehicle(Model modelo, @RequestParam(name = "id") int id) {
        cargarDatosAdmin();
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        cargarDatosAdmin();
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);
        modelo.addAttribute("active", 0);

        return "vista_administrador";
    }

    private void cargarDatosAdmin() {

        //Recibimos como un array y casteamos luego a List
        usuariosArray = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        usuarios = Arrays.asList(usuariosArray);

        vehiculosArray = rtVe.getForObject("http://localhost:9090/vehiculos/all", Vehiculo[].class);
        vehiculos = Arrays.asList(vehiculosArray);

        reservasArray = rtRe.getForObject("http://localhost:9090/reservas/all", Reserva[].class);
        reservas = Arrays.asList(reservasArray);
    }

}
