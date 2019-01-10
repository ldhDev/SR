package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Member;
import logic.Station;

@Controller
public class LoginController {
	@Autowired
	BikeService service;
	
	@RequestMapping(value = "/main2")
	public ModelAndView personalInfo(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		if(request.getSession().getAttribute("member")==null) {
		if(request.getParameter("code")==null||request.getParameter("state")==null) {
			mav.setViewName("/main");
			return mav;
		}
		if(!request.getParameter("state").equals(request.getSession().getAttribute("state"))) {
			mav.setViewName("/alert");
			mav.addObject("message","잘못된 접근입니다." );
			mav.addObject("url", "main.bike");
			return mav;
		}
		
		/////////////
		
		String atkey = "";
		String clientId = "SXBfAVH8cGbb5AJWQWbQ";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "QCQ5GpERJz";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/SR_Project/main2.bike", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    //System.out.println("apiURL="+apiURL);
	    
	    //session.setAttribute(name, value)
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	  
	    	  JSONObject json= new JSONObject(res.toString());
	    	  atkey=(String)json.get("access_token");
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
/////////////
	        String token = atkey;// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
			//String token1 = request.getParameter("apiURL");
	        //String a1a = request.getParameter();
	        
	        //String to = request.getParameter(name);
	        
			//System.out.println("123123토큰값 = " + a1a);
			///
			String res = request.getParameter("res");
			System.out.println("설마 이거 되나? = " + res);
			
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가
	        try {
	            String apiURL1 = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL1);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            JSONObject json= new JSONObject(response.toString());
	            json= (JSONObject)json.get("response");
	            Member member=new Member();
	            member.setUser_id((String)json.get("id"));
	            member.setAge(Integer.parseInt(((String)json.get("age")).substring(0, 2)));
	            member.setGender((String)json.get("gender"));
	            member.setEmail((String)json.get("email"));
	            if(service.memberexist(member)) {
	            	member=service.imformation(member);
	            	request.getSession().setAttribute("member", member);
	            	mav.addObject("stationList",stationList);
	            	mav.addObject("my_member",member);
	            	System.out.println("정보 있음");
	            	mav.setViewName("main2");
	    			return mav;// 데이터베이스에서 회원정보가 있다면 가져와서 main2.bike뿌려준다.
	            }else {
	            	System.out.println("정보 없음");
	            	mav.addObject("my_member",member);
	            	mav.setViewName("userNameInput");
	            	// 데이터 베이스에 회원정보가 없다면 닉네임을 설정(회원가입)을 하는 페이지(결정하지 않았지만 닉네임을 설정한다는 의미로 이름은 nick_decision.jsp)로 이동
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		}
	        mav.addObject("stationList",stationList);
			return mav;
	}
	
	@RequestMapping("main3")
	public ModelAndView main3(HttpServletRequest req,Member member) {
		List<Station> stationList = service.stationList();
		req.getSession().setAttribute("member", member);
		service.memberinsert(member);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main2");
		mav.addObject("stationList",stationList);
		return mav;
	}
	
	
	
	/////////////////////////로그아웃 추가 1/10
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("alert"); 
		mav.addObject("message","안전하게 로그아웃 되셨습니다.");
		mav.addObject("url","main.bike");
		return mav;
	}
	
}