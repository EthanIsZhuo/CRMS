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
				return "���û������ڣ�����ע�ᣡ";
			}
			
			if (fuser.getUserState() == 0) {
				
				return "���û��ѱ�����";
			}
			
			User u = us.loginUser(user);
			if (u != null) {

				session.setAttribute("haveLogin", u.getUserName());// �����û������û�����
				session.setAttribute("loginType", "normal");
				return "��¼�ɹ�";
			} else {
				
				return "���û������ڻ��û����������";

			}
	}


@PostMapping("toManagerLogin")
@ResponseBody
public String toManagerLogin(@RequestBody Manager manager, Model model, HttpSession session){
	
	Manager m = ms.LoginManager(manager);
	if (m != null) {
		
		session.setAttribute("haveLogin", m.getmName());// �����û������û�����
		session.setAttribute("loginType", "manager");
		return "��¼�ɹ�";
	} else {
		
		return "���û������ڻ��û����������";
	}


}


@GetMapping("outLogin")
public String outLogin(HttpSession session){
	session.removeAttribute("haveLogin");
	return "Main";
}
}
		

