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
        for(Usuario u: usuarios){
            if(id == u.getId()){
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
        for(Usuario u: usuarios){
            if(id == u.getId()){
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
   /* 
    @PostMapping(value = "/usuarios/add",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
public ResponseEntity<UnicornResponse> createUnicornByEntity(@RequestBody UnicornDTO unicornDto) throws RestClientException, JsonProcessingException {		
	return restTemplate.postForEntity(
	    "https://crudcrud.com/api/72dbefb3917c4ce1b7bb17776fcf98e9/unicorns",
        unicornDto,
        UnicornResponse.class);
}
    */
    @PostMapping("/usuarios/add")
    public String AddUser(Model modelo, @RequestParam(name="user") String user,
            @RequestParam(name="pass") String pass,
            @RequestParam(name="rol") int rol,
            @RequestParam(name="nombre") String nombre,
            @RequestParam(name="dni") int dni,
            @RequestParam(name="direccion") String direccion,
            @RequestParam(name="telefono") String telefono,
            @RequestParam(name="sucursal") int sucursal
            )
    {
        
        modelo.addAttribute("user", user);
        modelo.addAttribute("pass", pass);
        modelo.addAttribute("rol", rol);
        modelo.addAttribute("nombre", nombre);
        modelo.addAttribute("dni", dni);
        modelo.addAttribute("direccion", direccion);
        modelo.addAttribute("telefono", telefono);
        modelo.addAttribute("sucursal", sucursal);
        return "holamundo";
        
       //usuario_add.setId(null);
       //RestTemplate rtAdd = new RestTemplate();
       
       //Usuario Usuario_otro = new Usuario(11, "venta4", "venta4", 2, "Pepe", 23233223, "caaa", "5555", 3);
       
       //ResponseEntity<Usuario> entity = rtAdd.postForEntity("http://localhost:9090/usuarios/add", usuario_add, Usuario.class);
       
        //HttpHeaders headers = new HttpHeaders();
        //headers.setContentType(MediaType.APPLICATION_JSON);
        //headers.setContentType(MediaType.APPLICATION_JSON);
       
        //HttpEntity<Usuario> request = new HttpEntity<>(new Usuario(null, user,pass,rol,nombre,dni,direccion,telefono,sucursal));
        
        //Usuario us = rtAdd.postForObject("http://localhost:9090/usuarios/add", request, Usuario.class);
       /* 
        Usuario tmp = new Usuario();
        for(Usuario u: usuarios){
            if(id == u.getId()){
                tmp = u;
            }
        }
        modelo.addAttribute("usuario", tmp); 
        modelo.addAttribute("datos_reservas", reservas);
        modelo.addAttribute("datos_vehiculos", vehiculos);
        modelo.addAttribute("datos_usuarios", usuarios);
        modelo.addAttribute("active", 1);

        return "vista_administrador";
*/
    }

}
