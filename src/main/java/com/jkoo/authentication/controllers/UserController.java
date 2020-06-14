package com.jkoo.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jkoo.authentication.models.User;
import com.jkoo.authentication.services.UserService;
import com.jkoo.authentication.validator.UserValidator;

@Controller
public class UserController {
	private final UserService userService;
	private final UserValidator userValidator;
	

	public UserController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/login")
	public String loginForm() {
		return "login.jsp";
	}
	
	@RequestMapping("/registration")
	public String registrationForm(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		boolean auth = userService.authenticateUser(email, password);
		if (auth) {
			User loggedin = userService.findByEmail(email);
			session.setAttribute("userID", loggedin.getId());
			return "redirect:/";
		}
		model.addAttribute("error", "Login failed. Please verify email and password.");
		return "login.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		userValidator.validate(user, result);
		boolean dupeEmail = userService.duplicateEmail(user.getEmail());
		if (userService.duplicateEmail(user.getEmail())) {
			model.addAttribute("error", "An account already exists for this email");
		}		
		if (result.hasErrors() || dupeEmail) {
			return "registration.jsp";
		}
		User newuser = userService.registerUser(user);
		session.setAttribute("userID", newuser.getId());
		return "redirect:/";
	}
	
	@RequestMapping("/")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("userID") == null) {
			return "redirect:/login";
		}
		Long userID = (Long) session.getAttribute("userID");
		User loggedin = userService.findUserById(userID);
		model.addAttribute("user", loggedin);
		return "index.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/**/{[path:[^\\.]*}")
	public String allRoutes() {
		return "redirect:/";
	}
		
	
}
