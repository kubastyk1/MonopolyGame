package com.JStudio.Monopoly;

import java.text.DateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.JStudio.Monopoly.User.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	public LinkedList<User> usersList = new LinkedList<User>();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		User user1 = new User("userq", "pass1", "email1");
		User user2 = new User("user2", "pass2", "email2");
		usersList.add(user1);
		usersList.add(user2);
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Model model) {
		
		model.addAttribute(user);
		for(User u: usersList){
			if(u.getUsername().equals(user.getUsername()))
				if(u.getPassword().equals(user.getPassword()))
					return "playground";
		}
					
		return "home";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public void signup(User user, Model model) {
		
		model.addAttribute("newUser", user);
		usersList.add(user);
	}
}
