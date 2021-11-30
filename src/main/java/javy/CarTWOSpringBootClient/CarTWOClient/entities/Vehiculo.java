/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.entities;

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
public class Vehiculo {

    private Integer id;
    private Double precio_alquiler;
    private Double litros_combustible;
    private Integer entregado;
    private String patente;
    private String modelo;
    private String marca;
    private String color;

    
}
