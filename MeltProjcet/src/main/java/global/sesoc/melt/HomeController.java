package global.sesoc.melt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.melt.vo.Userinfo;
import global.sesoc.melt.dao.UserinfoDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	private UserinfoDAO dao;
	
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
	public String login(Model model)
	{
		logger.info("Login Page In");
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		//String url = "https://accounts.google.com/o/oauth2/auth?client_id=1076621433838-pgcvvagrsnr3n99l1h6chi292d1abe58.apps.googleusercontent.com&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login&redirect_uri=http:/203.233.199.149:8089/melt/google"
		//System.out.println("구글:" + url);

		model.addAttribute("google_url", url);
		
		return "login";
	}
	
	@GetMapping("/index")
	public String callindex()
	{
		logger.info("index Page In");
		
		return "index";
	}
	
	@GetMapping("/setting")
	public String setting(Model model,HttpSession session)
	{
		logger.info("setting Page In");
		String nick = "";
		
        nick = dao.getnickname((String)session.getAttribute("idnum"));
        logger.info(nick);
		model.addAttribute("nick",nick);
		
		return "setting";
	}
	
	@ResponseBody
	@RequestMapping("/changenick")
	public int changenick(Userinfo userinfo)
	{
		//logger.debug(userinfo.toString());
		int result = 0;
		result = dao.changenick(userinfo);
		
		
		System.out.println(result);
		
		return result;	
	}
	
	
}
