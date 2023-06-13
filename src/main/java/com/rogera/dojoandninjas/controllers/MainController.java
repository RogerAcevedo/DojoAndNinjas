package com.rogera.dojoandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.rogera.dojoandninjas.models.Dojo;
import com.rogera.dojoandninjas.models.Ninja;
import com.rogera.dojoandninjas.services.MainService;

@Controller
public class MainController {

	@Autowired
	MainService mainServ;
	
	
	// ---------------------------- DOJO CONTROLLERS START ----------------//
	// ---------------------------- CREATING A DOJO ----------------//
	@GetMapping(value={"/", "/dojo/new"})
	public String createDojo(
			@ModelAttribute("dojoObj") Dojo emptyDojo
	) {
		return "/dojo/create.jsp";
	}

	@PostMapping("/dojo/new")
	public String processDojo(
			@Valid @ModelAttribute("dojoObj") Dojo filledDojo,
			BindingResult results
	) {
		// VALIDATIONS FAIL
		if(results.hasErrors()) {
			return "/dojo/create.jsp";
		}
		// VALIDATIONS PASS
		mainServ.createDojo(filledDojo);
		return "redirect:/";
	}
	
	
	// DISPLAY A CHECF WITH ALL NINJAS
	@GetMapping("/dojo/{id}")
	public String oneDojo(
		@PathVariable("id") Long dojoId,
		Model model
	) {
		Dojo oneDojo = mainServ.getOneDojo(dojoId);
		model.addAttribute("dojo", oneDojo);
		return "/dojo/onedojo.jsp";
	}
	
	// ---------------------------- DOJO CONTROLLERS END ----------------//
	
	
	// ---------------------------- NINJA CONTROLLERS START ----------------//
	// ---------------------------- CREATING A NINJA ----------------//
	@GetMapping("/ninja/new")
	public String createNinja(
			@ModelAttribute("ninjaObj") Ninja emptyNinjaObj, Model model
	) {
		// ITIRATE THROUGH THE DATABASE
		model.addAttribute("allDojos", mainServ.getAllDojos());
		return "/ninja/create.jsp";
	}
	
	@PostMapping("ninja/new")
	public String processNinja(
		@Valid @ModelAttribute("ninjaObj") Ninja filledNinja,
		BindingResult results,
		Model model
			
			) {
		//VALIDATIONS FAIL
		if(results.hasErrors()) {
			// RENDER AND DIPLAY ALL CHEFS
			model.addAttribute("allDojos", mainServ.getAllDojos());
			return "/ninja/create.jsp";
		}
		//VALIDATIONS PASS - make call to Database
		mainServ.createNinja(filledNinja);
		return "redirect:/";
		}
	
	// ---------------------------- NINJA CONTROLLERS END ----------------//

	
	
	
//CLOSING TAG
}
