/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javy.CarTWOSpringBootClient.CarTWOClient.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author javy
 */
@Controller
public class ControladorMain {

    @GetMapping({"/index", "/", "/home"})
    public String getIndex() {

        return "index";
    }

}
