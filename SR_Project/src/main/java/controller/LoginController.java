package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
		if(request.getParameter("code")==null||request.getParameter("state")==null) {
			mav.setViewName("/main");
			return mav;
		}
		if(!request.getParameter("state").equals(request.getSession().getAttribute("state"))) {
			mav.setViewName("/alert");
			mav.addObject("message","�߸��� �����Դϴ�." );
			mav.addObject("url", "main.bike");
			return mav;
		}
		List<Station> stationList = service.stationList();
		/////////////
		
		String atkey = "";
		String clientId = "SXBfAVH8cGbb5AJWQWbQ";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientSecret = "QCQ5GpERJz";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
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
	      if(responseCode==200) { // ���� ȣ��
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // ���� �߻�
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
	        String token = atkey;// ���̹� �α��� ���� ��ū; ���⿡ ������ ��ū���� �־��ݴϴ�.
			//String token1 = request.getParameter("apiURL");
	        //String a1a = request.getParameter();
	        
	        //String to = request.getParameter(name);
	        
			//System.out.println("123123��ū�� = " + a1a);
			///
			String res = request.getParameter("res");
			System.out.println("���� �̰� �ǳ�? = " + res);
			
	        String header = "Bearer " + token; // Bearer ������ ���� �߰�
	        try {
	            String apiURL1 = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL1);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // ���� ȣ��
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // ���� �߻�
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
	            System.out.println(json.get("gender"));
	            System.out.println(json.get("email"));
	            System.out.println(json.get("birthday"));
	            Member member=new Member();
	            member.setUser_id((String)json.get("id"));
	            member.setAge(Integer.parseInt(((String)json.get("age"))));
	            

	            
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        mav.addObject("stationList",stationList);
			return mav;
	}
}