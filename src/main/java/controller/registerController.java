package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.User;
import service.UserService;



@Controller
public class registerController {
	@Autowired
	UserService us;
	
	
	@GetMapping("Reg")
	public String Reg() {
		return "Reg";
	}
	
	@PostMapping("toReg")
	@ResponseBody
	public String toReg(@RequestBody User user){
		
		
		if(us.checkUser(user.getUserName())==null) {			
			us.regUser(user);
			
			return "注册成功";
			
		}else{
			
			return "该账号已存在";
		}
		
			
		
	}
	
	
}
