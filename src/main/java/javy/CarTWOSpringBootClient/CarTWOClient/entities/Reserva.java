/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author javy
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserva {

    private int id;
    private Date fecha_inicio;
    private Date fecha_final;
    private double precio_total;
    private int id_oficina;
    private int id_cliente;
    private List<Vehiculo> vehiculos_entregados;
    private List<Vehiculo> vehiculos_reservados;

}
