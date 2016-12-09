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
			mv.addObject("pd", pd);
			
			return mv;
		}
		else if(pd.getString("u_type").equals("kitchen"))
		{
			mv.setViewName("kitchen/kitchen_list");
		}
		else
		{
			mv.setViewName("frontdesk/front_desk");
		}
		session.setAttribute("username",pd.getString("a_name"));
		GetUsername.setusername(pd.getString("a_name"));
		GetUsername.setauthority(pd.getString("u_type"));
		mv.addObject("message","toreturn");
		return mv;
	}
}
