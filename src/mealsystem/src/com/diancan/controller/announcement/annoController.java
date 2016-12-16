package com.diancan.controller.announcement;
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
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.util.PageData;

//公告
@Controller
@RequestMapping(value = "/announcement")
// 窄化，方便模块开发
public class annoController extends BaseController{
	
	@Resource(name = "menumanagerService")
	private MenuMManager menumanagerService;

	@RequestMapping("/list")
	public ModelAndView  list() throws Exception {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//查询所有公告
		String sql="n_id,n_content,n_user,n_time,n_title";
		pd.put("column", sql);
		pd.put("tbName", "notice");
		//查找所有公告内容
		List<PageData>	varList = menumanagerService.selectAnyone(pd);	
		//获取最新公告      
		String sql2="n_id = ( SELECT max(n_id) FROM notice )";//拼接sql
		PageData pd2 = new PageData();
		pd2.put("column", sql);
		pd2.put("tbName", "notice");
		pd2.put("Name", sql2);
		List<PageData>	maxList = menumanagerService.selectAnyone(pd2);	
		mv.setViewName("announcement/anno_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("maxList", maxList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	@RequestMapping("/goAdd")
	@ResponseBody
	public Object  goAdd() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		//获取选中的ids
		pd.put("id", pd.getString("DATA_IDS"));
		PageData var=menumanagerService.findById(pd);
		Map<String, Object> map = new HashMap<String, Object>();
		
		//SimpleDateFormat  formatter  =  new   SimpleDateFormat( "yyyy-MM-dd ");
		//Date date = (Date) var.get("m_add_time");
		//Date   date   =   formatter.parse(var.getString("m_add_time"));
		map.put("m_data", var.getString("m_data"));
		map.put("m_describe", var.getString("m_describe"));
		map.put("m_sale", (Integer) var.get("m_sale"));
		map.put("m_name", var.getString("m_name"));
		map.put("m_add_user", var.getString("m_add_user"));
		map.put("m_piece", (Double) var.get("m_piece"));
		map.put("m_id", (Integer) var.get("m_id"));
		map.put("m_image",var.getString("m_image"));
		return map;
	}
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveEdit")
	public ModelAndView saveEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		menumanagerService.edit(pd);
		List<PageData>	varList = menumanagerService.list(pd);	
		mv.setViewName("menumanage/menu_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**新增
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		//获得系统时间
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date);
		pd.put("m_add_time0", time);
		//获取添加人
		menumanagerService.save(pd);
		List<PageData>	varList = menumanagerService.list(pd);	
		mv.setViewName("menumanage/menu_list");
		mv.addObject("varList", varList);      //值
		mv.addObject("pd", pd);
		return mv;
	}


	/**判断输入的是否数字
     * @return
     */
    @RequestMapping(value="/isNumber")
    @ResponseBody
    public Object isNumber(){
        Map<String,String> map = new HashMap<String,String>();
        String errInfo = "isExist";
        PageData pd = new PageData();
        pd = this.getPageData();
        String number=pd.getString("number");                         //全宗号
        try{
            //判断是否数字
            Integer.parseInt(number);
        } catch(Exception e){
           // logger.error(e.toString(), e);
            errInfo="fail";
        }
        map.put("result", errInfo);				                      //返回结果
        map.put("resultValue","");
        return map;
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
		String ids[]=pd.getString("DATA_IDS").split(",");
		for(int i=0;i<ids.length;i++){
			pd.put("id", ids[i]);
			menumanagerService.delete(pd);
		}
		//List<PageData>	varList = menumanagerService.list(pd);	
		//mv.setViewName("menumanage/menu_list");
		//mv.addObject("varList", varList);      //值
		//mv.addObject("pd", pd);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}

}
