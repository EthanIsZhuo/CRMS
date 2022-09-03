package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.xdevapi.Result;

import pojo.User;
import service.UserManageService;
import service.UserService;

@Controller
public class userManageController {
	@Autowired
	UserManageService ums;
	@Autowired
	UserService us;
	
	@GetMapping("userManage")
	public String userMangage(String uname,Model model,HttpSession session)  {
	
		if(session.getAttribute("loginType").equals("manager")) {
			return "userManage";
		}else {
		
			model.addAttribute("msg","<script>alert('普通用户无登录管理的权限!!!')</script>");
			return "Main";
		}
	}
	@RequestMapping("findAllUser")
	@ResponseBody
	public List<User> findAllUser() {
	List<User> userList=ums.findAllUser();
	return userList;
	}
	
	
	@RequestMapping("changeUserState")
	@ResponseBody
	public List<User> changeUserState(String userId) {
		int uId=Integer.parseInt(userId);
		ums.changeUserState(uId);
		List<User> userList=ums.findAllUser();
		return userList;
	}
	
	@GetMapping("findUserByUserName")
	@ResponseBody
	public List<User> findUserByUserName(String searchKey) {
	List<User> userList=ums.findUserByUserName(searchKey);
	return userList;
	}
	
	
	@PostMapping("AddUser")
	@ResponseBody
	public Map<String,Object> AddUser(@RequestBody User user,Model model,HttpServletResponse resp) throws IOException{
		Map<String,Object> result=new HashMap<String, Object>();
		User u=us.findByName(user.getUserName());
		if(u!=null) {
			
			String msg="该用户已存在";
			List<User> userlist=ums.findAllUser();
			result.put("msg", msg);
			result.put("userlist", userlist);
			return result;
		}else {
			ums.addUser(user);
			List<User> userlist=ums.findAllUser();
			String msg="添加成功";
			result.put("msg", msg);
			result.put("userlist", userlist);
			return result;
		}
			
		
	}
	
	
}
