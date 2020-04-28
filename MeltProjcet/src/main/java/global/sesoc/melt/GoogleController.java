package global.sesoc.melt;

import java.io.IOException;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;

import global.sesoc.kakao.googleAPI;
import global.sesoc.melt.dao.UserinfoDAO;
import global.sesoc.melt.vo.Userinfo;



@Controller
public class GoogleController {
	
	@Autowired
	private googleAPI google;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	private UserinfoDAO dao;
	
//	@RequestMapping(value="/login", method = {RequestMethod.GET, RequestMethod.POST})
//	public String goologin(Model model, HttpSession session) {
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		System.out.println("구글:" + url);
//
//		model.addAttribute("google_url", url);
//		
//		
//		return "login";
//	}
	
	@RequestMapping(value = "/google", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {
		//System.out.println("여기는 googleCallback");
//		System.out.println("code :" +code);
		//Access Token 발급
		JsonNode jsonToken = google.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if(jsonToken.has("refresh_token")) {
            refreshToken = jsonToken.get("refresh_token").toString();
        }
        String expiresTime = jsonToken.get("expires_in").toString();
//        System.out.println("Access Token : " + accessToken);
//        System.out.println("Refresh Token : " + refreshToken);
//        System.out.println("Expires Time : " + expiresTime);
		
        //Access Token으로 사용자 정보 반환
        JsonNode userInfo = google.getGoogleUserInfo(accessToken);
        System.out.println(userInfo.toString());
        
        
        //System.out.println(userInfo.get("id").toString());
        //System.out.println(userInfo.get("name").toString());
        
        // Get User id
        String id = userInfo.get("id").asText();
        //이게 왜 Null 값이 뜰까?? 그러면 userinfo를 못받아온다는건데..?
        
        String name = userInfo.get("name").asText();
        if (!dao.getuser(id)) 
        {
        	
        	Userinfo user = new Userinfo();
        	user.setId(id);
        	user.setName(name);
        	// 첫 사용자
        	// insert
        	int itmp = dao.insertUserinfo(user);
        	
        	if (itmp == 0)
        		return "imgo";
        }
        
        
        // db 
        // SELECT COUNT(*) FROM USERTABLE WHERE id = ttt;
        // 1 : 0 -> 첫 사용자     -> INSERT
        // 2 : 1 -> 기존사용자  -> LOGIN
        
        // INSERT (첫사용자만)
        
        if(userInfo.get("id").toString() != null) {
        	session.setAttribute("idnum", userInfo.get("id").asText());
	        session.setAttribute("name", userInfo.get("name").asText());
	        
        }
        
//        String nick = "";
//        nick = dao.getnickname(id);
//        if(nick != null) 
//        {
//        	model.addAttribute("nick",nick);
//        }
//        System.out.println(nick);
		return "index";
	}
	
	@GetMapping("/googlelogout")
	public String logout(HttpSession session) {
		System.out.println("Google Logout");
		session.invalidate();
		return "logout/googlelogout";
	}
}
