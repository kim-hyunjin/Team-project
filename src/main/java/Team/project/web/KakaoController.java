package Team.project.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hc.client5.http.entity.UrlEncodedFormEntity;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.NameValuePair;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import Team.project.domain.User;
import Team.project.service.UserService;

@Controller
@RequestMapping("/auth/kakao")
public class KakaoController {
	@Autowired
	UserService userService;


	@RequestMapping("login")
	public String login(String code, RedirectAttributes redirectAttributes, Model model) throws Exception {
		System.out.println("code:"+code);
		String accessToken = getAccessToken(code);
		System.out.println("access token = " + accessToken);
		HashMap<String, Object> userInfo = getUserInfo(accessToken);
		System.out.println("유저정보 : " + userInfo);

		String email = (String) userInfo.get("email");
		if(email != null) {
			User user = userService.get(email);
			if(user != null) {
				return "redirect:../login?email="+email+"&password="+user.getPassword();
			} else {
				redirectAttributes.addFlashAttribute("user", userInfo);
				return "redirect:../../user/add";
			}
		} else {
			String error = "카카오로 로그인하기 위해선 이메일 제공을 동의해주셔야 합니다.";
			model.addAttribute("error", error);
			return "/WEB-INF/jsp/auth/loginError.jsp";
		}
	}

	private String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		HttpClient httpClient = HttpClient.newBuilder().version(HttpClient.Version.HTTP_2).build();
		HttpRequest request = HttpRequest.newBuilder()
				.POST(buildFormDataFromMap(authorize_code))
				.uri(URI.create(reqURL)).setHeader("User-Agent", "BTS")
				.header("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
                .build();
		
		try {
			HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
			System.out.println("상태 : "+ response.statusCode());
			System.out.println("body: "+ response.body());
		
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(response.body());

				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		

		return access_Token;
	}
	
	private static HttpRequest.BodyPublisher buildFormDataFromMap(String authorize_code) {
        var builder = new StringBuilder();
       builder.append("grant_type=authorization_code"
       		+ "&client_id=b2421e263082325965158a3fe73ffd67"
       		+ "&redirect_uri=http://localhost:9999/Team-project/app/auth/kakao/login"
       		+ "&code="+authorize_code);
       System.out.println(builder.toString());
        return HttpRequest.BodyPublishers.ofString(builder.toString());
    }


	private HashMap<String, Object> getUserInfo (String access_Token) {

		//    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			//    요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(result);

			JsonObject id = element.getAsJsonObject().get("id").getAsJsonObject();
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String profileImage = properties.getAsJsonObject().get("profile_image").getAsString();

			userInfo.put("email", email);
			userInfo.put("password", id);
			userInfo.put("name", nickname);
			userInfo.put("profilePhoto", profileImage);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userInfo;
	}



}
