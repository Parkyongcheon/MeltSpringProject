package global.sesoc.melt;

import java.util.HashMap;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;

import global.sesoc.kakao.kakaoAPI;
import global.sesoc.melt.dao.UserinfoDAO;
import global.sesoc.melt.vo.Userinfo;



@Controller
public class KakaoController {

	@Autowired
	private kakaoAPI kakao;
	@Autowired
	private UserinfoDAO dao;
	
	
	JsonNode node;
	String access_Token = "";
	
	@RequestMapping(value="/kakao")
	public String login(@RequestParam("code") String code, HttpSession session, Model model){
		
		String access_Token = kakao.getAccessToken(code);
		//System.out.println("controller access_token : " + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    String id = userInfo.get("idnum").toString();
	    String name = userInfo.get("nickname").toString();
	    
	    
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
	    
	    
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	    	session.setAttribute("idnum", userInfo.get("idnum"));
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("nickname", userInfo.get("nickname"));
	        session.setAttribute("access_Token", access_Token);
	        
	    }
	    //System.out.println(access_Token);
	
		return "index";
	}
	
	@RequestMapping(value="/kakaologout", produces = "application/json")
	public String logout(HttpSession session) {
		
		//System.out.println("in+"+(String)session.getAttribute("access_Token"));
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		
		
	    //session.removeAttribute("access_Token");
	    //session.removeAttribute("userId");
	    session.invalidate();
	    
		
		return "logout/kakaologout";
	}
	
	
}
