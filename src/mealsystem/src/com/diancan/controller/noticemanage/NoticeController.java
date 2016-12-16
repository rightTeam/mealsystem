package com.diancan.controller.noticemanage;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.diancan.base.BaseController;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.service.noticemanage.NoticeManager;
import com.diancan.util.GetUsername;
import com.diancan.util.PageData;

@Controller
@RequestMapping(value = "/noticemanage")
// 窄化，方便模块开发
//公告发布
public class NoticeController extends BaseController{
	
	@Resource(name = "noticemanagerService")
	private NoticeManager noticemanagerService;

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
		List<PageData>	varList = noticemanagerService.list(pd);	
		mv.setViewName("noticemanage/notice_list");
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
		pd.put("id", pd.getString("DATA_IDS"));
		PageData var=noticemanagerService.findById(pd);
		Map<String, Object> map = new HashMap<String, Object>();
		
		//SimpleDateFormat  formatter  =  new   SimpleDateFormat( "yyyy-MM-dd ");
		//Date date = (Date) var.get("m_add_time");
		//Date   date   =   formatter.parse(var.getString("m_add_time"));
		map.put("n_title", var.getString("n_title"));
		map.put("N_CONTENT", var.getString("N_CONTENT"));
		map.put("n_user", var.getString("n_user"));
		map.put("n_id", (Integer) var.get("n_id"));
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
		noticemanagerService.edit(pd);
		List<PageData>	varList = noticemanagerService.list(pd);	
		mv.setViewName("noticemanage/notice_list");
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
		pd.put("n_time0", time);
		//获取添加人
		noticemanagerService.save(pd);
		List<PageData>	varList = noticemanagerService.list(pd);	
		mv.setViewName("noticemanage/notice_list");
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
			noticemanagerService.delete(pd);
		}
		//List<PageData>	varList = menumanagerService.list(pd);	
		//mv.setViewName("menumanage/menu_list");
		//mv.addObject("varList", varList);      //值
		//mv.addObject("pd", pd);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}

}
