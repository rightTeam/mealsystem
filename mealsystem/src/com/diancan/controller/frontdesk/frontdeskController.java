package com.diancan.controller.frontdesk;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.diancan.base.BaseController;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.util.GetUsername;
import com.diancan.util.PageData;

//公告
@Controller
@RequestMapping(value = "/frontdesk")
// 窄化，方便模块开发
public class frontdeskController extends BaseController{
	
	@Resource(name = "menumanagerService")
	private MenuMManager menumanagerService;

	@RequestMapping("/list")
	public ModelAndView  list() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String authority=GetUsername.getauthority();
		if(authority.equals(""))
		{
			mv.setViewName("login");
			return mv;
		}
		if(authority.equals("kitchen"))
		{
			mv.setViewName("kitchen/kitchen_list");
			mv.addObject("message","toreturn");
			return mv;
		}
		
		
		//查询所有的桌子
		String sql="t_id,t_number,t_isNull,t_isReq";
		pd.put("column", sql);
		pd.put("tbName", "`table`");
		List<PageData>	varList = menumanagerService.selectAnyone(pd);	
		System.out.println(varList);
		//获取最新公告      
//		String sql2="n_id = ( SELECT max(n_id) FROM notice )";//拼接sql
//		PageData pd2 = new PageData();
//		pd2.put("column", sql);
//		pd2.put("tbName", "notice");
//		pd2.put("Name", sql2);
		//List<PageData>	maxList = menumanagerService.selectAnyone(pd2);	
		mv.setViewName("frontdesk/front_desk");
		mv.addObject("varList", varList);      //值
		//mv.addObject("maxList", maxList);
		mv.addObject("pd", pd);
		return mv;
	}

}
