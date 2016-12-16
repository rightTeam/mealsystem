package com.diancan.controller.loadcontroller;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.diancan.base.BaseController;
import com.diancan.service.loadcontroller.LoadControllerManager;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.util.GetUsername;
import com.diancan.util.PageData;

@Controller

@RequestMapping(value = "/loadcontroller")
// 窄化，方便模块开发
public class LoadController extends BaseController{
	
	@Resource(name = "loadcontrollerService")
	private LoadControllerManager loadcontrollerService;

	@RequestMapping("/load")
	public ModelAndView  load(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		
		pd = this.getPageData();
		pd= loadcontrollerService.judge(pd);
		if(pd==null)
		{
			mv.setViewName("login");
			mv.addObject("msg","用户名密码错误");
			return mv;
		}
		else if(pd.getString("type").equals("kitchen"))
		{
			mv.setViewName("kitchen/kitchen_list");
		}
		else if(pd.getString("type").equals("waiter"))
		{
			mv.setViewName("frontdesk/front_desk");
		}
		else {
			
			mv.setViewName("performance/performance_list");
		}
		session.setAttribute("username",pd.getString("account"));
		GetUsername.setusername(pd.getString("account"));
		GetUsername.setauthority(pd.getString("type"));
		mv.addObject("message","toreturn");
		return mv;
	}
}
