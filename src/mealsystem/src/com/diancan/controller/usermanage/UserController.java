package com.diancan.controller.usermanage;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.diancan.base.BaseController;
import com.diancan.service.usermanage.UserManager;
import com.diancan.util.PageData;

@Controller
@RequestMapping(value = "/usermanage")
// 窄化，方便模块开发
public class UserController extends BaseController{
	
	@Resource(name = "usermanagerService")
	private UserManager usermanagerService;

	@RequestMapping("/list")
	public ModelAndView  list() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");	
		pd.put("keywords",keywords );
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords);
		}
		List<PageData>	varList = usermanagerService.list(pd);	
		mv.setViewName("usermanage/user_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	@RequestMapping("/goAdd")
	@ResponseBody
	public Object  goAdd() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取选中的ids
		PageData var=usermanagerService.findById(pd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", var.getString("account"));
		map.put("password", var.getString("password"));
		map.put("type", var.getString("type"));
		map.put("name", var.getString("name"));
		map.put("sex", var.getString("sex"));
		map.put("phone",var.getString("phone"));
		map.put("remark",var.getString("remark"));
		return map;
	}
	
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获得系统时间
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);
		pd.put("m_add_time0", time);
		//获取添加人
		usermanagerService.save(pd);
		List<PageData>	varList = usermanagerService.list(pd);	
		mv.setViewName("usermanage/user_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("pd", pd);
		return mv;
	}


    /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delAll")
	public Object delAll() throws Exception{
		//ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取所有要删除的id
		String ids[]=pd.getString("account").split(",");
		for(int i=0;i<ids.length;i++){
			pd.put("account", ids[i]);
			usermanagerService.delete(pd);
		}
		//List<PageData>	varList = menumanagerService.list(pd);	
		//mv.setViewName("menumanage/menu_list");
		//mv.addObject("varList", varList);      //值
		//mv.addObject("pd", pd);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}

}
