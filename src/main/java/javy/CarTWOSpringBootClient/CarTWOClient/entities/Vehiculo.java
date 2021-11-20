/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.entities;

import java.io.Serializable;
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

    private int Id;
    private double precio_alquiler;
    private double litros_combustible;
    private int entregado;
    private String patente;
    private String modelo;
    private String marca;
    private String color;

    
}
