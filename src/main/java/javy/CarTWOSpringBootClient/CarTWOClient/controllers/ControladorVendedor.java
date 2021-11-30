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
import org.springframework.http.ResponseEntity;
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
@RequestMapping("vendedor")
public class ControladorVendedor {
    
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

    //Metodos para Clientes 
    
    @RequestMapping("/clientes/all")
    public String getAllClient(Model modelo, @RequestParam(name = "id") int id) {
        cargarDatosVenta();
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
    
     @GetMapping("/clientes/add")
    public String AddUserView(Model modelo, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        cargarDatosVenta();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("/clientes/add")
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
        cargarDatosVenta();
        Usuario tmp = new Usuario();
        for (Usuario us : this.usuarios) {
            if (id == us.getId()) {
                tmp = us;
            }
        }
        
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("datos_reservas", this.reservas);
        modelo.addAttribute("datos_vehiculos", this.vehiculos);
        modelo.addAttribute("datos_usuarios", this.usuarios);
        modelo.addAttribute("active", 1);

        return "vista_vendedor";

    }

    @GetMapping("clientes/edit/{user_id}")
    public String UpdateUserView(Model modelo, @PathVariable("user_id") int user_id, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        cargarDatosVenta();
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (user_id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("id", id);
        modelo.addAttribute("usuario_edit", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("clientes/edit/{id}")
    public String UpdateUser(Model modelo, Usuario usuario, @RequestParam(name = "user_id") int user_id) {

        RestTemplate rtEdit = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Usuario> request = new HttpEntity<>(usuario, headers);

        String url = "http://localhost:9090/usuarios/edit/" + usuario.getId();
        rtEdit.put(url, request, Usuario.class);

        cargarDatosVenta();

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

        return "vista_vendedor";
    }

    @GetMapping("clientes/delete/{user_id}")
    public String DeleteUserView(Model modelo, @PathVariable("user_id") int user_id, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        cargarDatosVenta();
        Usuario tmp = new Usuario();
        for (Usuario u : this.usuarios) {
            if (user_id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("id", id);
        modelo.addAttribute("usuario_delete", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("clientes/delete/{id}")
    public String DeleteUser(Model modelo, Usuario usuario, @RequestParam(name = "user_id") int user_id) {

        RestTemplate rtDelete = new RestTemplate();

        String url = "http://localhost:9090/usuarios/delete/" + usuario.getId();
        rtDelete.delete(url);

        cargarDatosVenta();

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

        return "vista_vendedor";
    }
    
    //Metodos para Reservas
    
    @RequestMapping("/reservas/all")
    public String getAllReservation(Model modelo, @RequestParam(name = "id") int id) {
        
        cargarDatosVenta();
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
    
    @GetMapping("/reservas/add")
    public String AddReservaView(Model modelo, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {
        Usuario tmp = new Usuario();
        cargarDatosVenta();
        for (Usuario u : this.usuarios) {
            if (id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("clientes", usuarios);
        modelo.addAttribute("vehiculos", vehiculos);
        modelo.addAttribute("usuario", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("/reservas/add")
    public String AddReserva(Model Modelo, @RequestParam(name = "marca") String marca,
            @RequestParam(name = "modelo") String modelo,
            @RequestParam(name = "patente") String patente,
            @RequestParam(name = "color") String color,
            @RequestParam(name = "precio_alquiler") double precio_alquiler,
            @RequestParam(name = "litros_combustible") double litros_combustible,
            @RequestParam(name = "entregado") int entregado,
            @RequestParam(name = "id") int id
    ) {

        RestTemplate rtAdd = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
        Vehiculo veh = new Vehiculo();
        veh.setId(null);
        veh.setLitros_combustible(litros_combustible);
        veh.setPrecio_alquiler(precio_alquiler);
        veh.setColor(color);
        veh.setEntregado(entregado);
        veh.setMarca(marca);
        veh.setModelo(modelo);
        veh.setPatente(patente);
        
        HttpEntity<Vehiculo> request;
        request = new HttpEntity<>(new Vehiculo(null, litros_combustible,precio_alquiler,entregado,patente,modelo,marca,color), headers);

        ResponseEntity<Vehiculo> v = rtAdd.postForEntity("http://localhost:9090/reservas/add", request, Vehiculo.class);

        cargarDatosVenta();
        Usuario tmp = new Usuario();
        for (Usuario us : this.usuarios) {
            if (id == us.getId()) {
                tmp = us;
            }
        }
        
        Modelo.addAttribute("usuario", tmp);
        Modelo.addAttribute("datos_reservas", this.reservas);
        Modelo.addAttribute("datos_vehiculos", this.vehiculos);
        Modelo.addAttribute("datos_usuarios", this.usuarios);
        Modelo.addAttribute("active", 0);

        return "vista_vendedor";

    }
    
     @GetMapping("reservas/edit/{reserva_id}")
    public String UpdateReservaView(Model modelo, @PathVariable("reserva_id") int reserva_id, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        cargarDatosVenta();
        Reserva tmp = new Reserva();
        for (Reserva u : this.reservas) {
            if (reserva_id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("id", id);
        modelo.addAttribute("reserva_edit", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("reservas/edit/{id}")
    public String UpdateReserva(Model modelo, Vehiculo vehiculo, @RequestParam(name = "user_id") int user_id) {

        RestTemplate rtEdit = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Vehiculo> request = new HttpEntity<>(vehiculo, headers);

        String url = "http://localhost:9090/reservas/edit/" + vehiculo.getId();
        rtEdit.put(url, request, Vehiculo.class);

        cargarDatosVenta();

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
        modelo.addAttribute("active", 0);

        return "vista_vendedor";
    }

    @GetMapping("reservas/delete/{reserva_id}")
    public String DeleteReservaView(Model modelo, @PathVariable("reserva_id") int reserva_id, @RequestParam(name = "action") String action, @RequestParam(name = "id") int id) {

        cargarDatosVenta();
        Reserva tmp = new Reserva();
        for (Reserva u : this.reservas) {
            if (reserva_id == u.getId()) {
                tmp = u;
            }
        }
        modelo.addAttribute("vehiculos", tmp.getVehiculos_reservados());
        modelo.addAttribute("id", id);
        modelo.addAttribute("reserva_delete", tmp);
        modelo.addAttribute("action", action);

        return "vista_vendedor_crud";
    }

    @PostMapping("reservas/delete/{id}")
    public String DeleteReserva(Model modelo, Reserva reserva, @RequestParam(name = "user_id") int user_id) {

        RestTemplate rtDelete = new RestTemplate();

        String url = "http://localhost:9090/reservas/delete/" + reserva.getId();
        rtDelete.delete(url);

        cargarDatosVenta();

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
        modelo.addAttribute("active", 0);

        return "vista_vendedor";
    }
    
    private void cargarDatosVenta() {

        //Recibimos como un array y casteamos luego a List
        usuariosArray = rt.getForObject("http://localhost:9090/usuarios/all", Usuario[].class);
        usuarios = Arrays.asList(usuariosArray);

        vehiculosArray = rtVe.getForObject("http://localhost:9090/vehiculos/all", Vehiculo[].class);
        vehiculos = Arrays.asList(vehiculosArray);

        reservasArray = rtRe.getForObject("http://localhost:9090/reservas/all", Reserva[].class);
        reservas = Arrays.asList(reservasArray);
    }
    
}
