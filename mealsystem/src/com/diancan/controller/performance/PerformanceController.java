package com.diancan.controller.performance;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diancan.base.BaseController;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.service.performance.PerformanceManager;
import com.diancan.util.GetUsername;
import com.diancan.util.PageData;

@Controller
@RequestMapping(value = "/performance")
public class PerformanceController extends BaseController{
	
	@Resource(name = "performanceService")
	private PerformanceManager performanceService;
	@RequestMapping("/list")
	public ModelAndView  list() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String authority=GetUsername.getauthority();
		if(authority.equals(""))
		{
			mv.setViewName("login");
			return mv;
		}
		if(authority.equals("waiter"))
		{
			mv.setViewName("frontdesk/front_desk");
			mv.addObject("message","toreturn");
			return mv;
		}
		else if(authority.equals("kitchen"))
		{
			mv.setViewName("kitchen/kitchen_list");
			mv.addObject("message","toreturn");
			return mv;
		}
		if(pd.getString("message")!=null)
		{
			if(pd.getString("message").equals("update"))
		{
			performanceService.creatturnover();
			mv.addObject("mes", "success");
		}
		else if(pd.getString("message").equals("query"))
		{
			List<PageData> query=performanceService.query(pd);
			if(query==null||query.size()==0)
			{
				mv.addObject("mes", "queryfalses");
			}
			mv.addObject("query", query);
		}
		}
		pd.put("keywords","年");
		List<PageData> listyear=performanceService.list(pd);//年销售额
		pd.put("keywords","月");
		List<PageData> listmonth=performanceService.list(pd);//月销售额
		mv.setViewName("performance/performance_list");
		mv.addObject("listyear", listyear);
		mv.addObject("listmonth", listmonth);
		mv.addObject("pd", pd);
		return mv;
	}
}
