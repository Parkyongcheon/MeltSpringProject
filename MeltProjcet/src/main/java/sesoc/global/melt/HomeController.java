package sesoc.global.melt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping("/")
	public String index()
	{
		logger.info("Index Page In");
		
		return "index";
	}
	
	//MELT HomePage Explanation
	@GetMapping("/melt")
	public String melt()
	{
		logger.info("Melt Page In");
		
		return "melt";
	}
	
	//Login Page 
	@GetMapping("/login")
	public String login()
	{
		logger.info("Login Page In");
		
		return "login";
	}
	
	@GetMapping("/home")
	public String home()
	{
		logger.info("Login Page In");
		
		return "home";
	}
}
