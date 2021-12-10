package com.codingdojo.poke.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.poke.models.Poke;
import com.codingdojo.poke.services.PokeService;

@Controller
public class HomeController {
	
	@Autowired
	PokeService pokeService;
	
    @RequestMapping("/poke")
    public String index(Model model) {
    	
    	model.addAttribute("newpoke", new Poke());
        List<Poke> poke1 = pokeService.allPoke();
    	model.addAttribute("poke", poke1);
    	return "index.jsp";
    }
    
    @RequestMapping(value="/poke", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("newpoke") Poke poke, BindingResult result) {
    	if (result.hasErrors()) {
    		return "index.jsp";
    	} else {
    		pokeService.createPoke(poke);
    		return "redirect:/poke";
    	}
    	
    }
    
    @RequestMapping("/poke/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
    	Poke poke = pokeService.findPoke(id);
    	model.addAttribute("poke", poke);
    	return "edit.jsp";
    }
    
    @RequestMapping(value="/poke/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("poke") Poke poke, BindingResult result) {
    	if(result.hasErrors()) {
    		return "/edit.jsp";
    	} else {
    		pokeService.updatePoke(poke);
    		return "redirect:/poke";
    	}
    }
    
    @RequestMapping(value="/poke/delete/{id}")
    public String destroy(@PathVariable("id") Long id) {
         pokeService.deletePoke(id);
         return "redirect:/poke";
     }
    
    @GetMapping("/poke/{pokeId}")
    public String onepoke(Model model, @PathVariable("pokeId") Long pokeId) {
    	Poke poke = pokeService.findPoke(pokeId);
    	model.addAttribute("poke", poke);
    	return "show.jsp";
    }
    
}



