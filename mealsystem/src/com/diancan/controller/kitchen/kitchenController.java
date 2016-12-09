package com.diancan.controller.kitchen;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diancan.base.BaseController;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.util.GetUsername;
import com.diancan.util.PageData;

@Controller
@RequestMapping(value = "/kitchen")
public class kitchenController extends BaseController{
	
	@Resource(name = "menumanagerService")
	private MenuMManager menumanagerService;
	
	@RequestMapping("/list")
	public ModelAndView  list() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String authority=GetUsername.getauthority();
		if(authority.equals("waiter"))
		{
			mv.setViewName("frontdesk/front_desk");
			mv.addObject("message","toreturn");
			return mv;
		}
		
		//查询订单表
		String sql="o_id,o_time,t_number,o_meal,o_piece,o_ispay,o_ispay";
		pd.put("column", sql);
		pd.put("tbName", "`order`");
		pd.put("columnName", "o_ispay");
		pd.put("columnValue", "1");
		List<PageData>	varList = menumanagerService.selectAnyone(pd);	
		String sql2="m_id,m_name";
		StringBuffer showStr = new StringBuffer();
		//拼接前台动态数据
		for(int i=0;i<varList.size();i++){
			//获取第i个餐桌的菜单
			String id=varList.get(i).getString("o_meal");
			String ids[]=id.split(",");
			showStr.append("<table><tr><td>餐桌:"+varList.get(i).getString("t_number")+"</td></tr>");
			//根据菜单代号去菜单表找菜单名
			List<PageData> mealList=menumanagerService.selectByids(ids);
			for(int j=0;j<mealList.size();j++){
				//拼接菜单名
				showStr.append("<tr><td>菜单名:"+mealList.get(j).getString("m_name")+"</tr></tr>");
	
			}
			showStr.append("</table><br><br>");
		}
		System.out.println(showStr);
		mv.setViewName("kitchen/kitchen_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("showStr", showStr);
		mv.addObject("pd", pd);
		return mv;
	}
}
