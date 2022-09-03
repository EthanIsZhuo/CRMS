package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import pojo.Manager;
import pojo.User;
import service.ManagerService;
import service.UserService;
@Controller
public class loginController {
	@Autowired
	UserService us;
	@Autowired
	ManagerService ms;
	
	@GetMapping("Login")
	public String Login() {
		return "Login";
	}
	

	@PostMapping("toNormalLogin")
	@ResponseBody
	public String toNormalLogin(@RequestBody User user, Model model, HttpSession session){

		
			
			User fuser=us.findByName(user.getUserName());
			if(fuser==null) {
				return "该用户不存在，请先注册！";
			}
			
			if (fuser.getUserState() == 0) {
				
				return "该用户已被禁用";
			}
			
			User u = us.loginUser(user);
			if (u != null) {

				session.setAttribute("haveLogin", u.getUserName());// 保存用户名和用户类型
				session.setAttribute("loginType", "normal");
				return "登录成功";
			} else {
				
				return "该用户不存在或用户名密码错误";

			}
	}


@PostMapping("toManagerLogin")
@ResponseBody
public String toManagerLogin(@RequestBody Manager manager, Model model, HttpSession session){
	
	Manager m = ms.LoginManager(manager);
	if (m != null) {
		
		session.setAttribute("haveLogin", m.getmName());// 保存用户名和用户类型
		session.setAttribute("loginType", "manager");
		return "登录成功";
	} else {
		
		return "该用户不存在或用户名密码错误";
	}


}


@GetMapping("outLogin")
public String outLogin(HttpSession session){
	session.removeAttribute("haveLogin");
	return "Main";
}
}
		

