package global.sesoc.melt;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import global.sesoc.melt.vo.Userinfo;
import global.sesoc.melt.dao.UserinfoDAO;
import global.sesoc.melt.util.FileService;

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
	
	final String uploadPath = "/uploadPath";
	
	
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
		String profile = "";
		
        nick = dao.getnickname((String)session.getAttribute("idnum"));
        profile = dao.getfile((String)session.getAttribute("idnum"));
        logger.info(nick);
        logger.info(profile);
		model.addAttribute("nick",nick);
		model.addAttribute("profile", profile);
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
	
	@PostMapping("/inprofile")
	public String fileUpload(Userinfo userinfo, MultipartFile upload, HttpSession session)throws IOException
	{
		String id = (String)session.getAttribute("idnum");
		String sprofile = FileService.saveFile(upload, uploadPath);
		String oprofile = upload.getOriginalFilename();
		
		
		userinfo.setId(id);
		userinfo.setOprofile(oprofile);
		userinfo.setSprofile(sprofile);
		
		System.out.println("====== fileupload ======");
		System.out.println("id는"+id);
		System.out.println("oprofile은"+oprofile);
		System.out.println("sprofile은"+sprofile);
		System.out.println("========================");
		int result = dao.inprofile(userinfo);
		System.out.println(result);
		//String pathlink = uploadPath+"/"+sprofile;
		//session.setAttribute("filelink", pathlink);
		System.out.println("설정 완료");
		return "redirect:setting";
	}
	
	@GetMapping("/test")
	public String test() 
	{
		return "test";
	}
	
}
