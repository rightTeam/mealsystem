package com.diancan.service.performance.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.entity.Page;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.service.noticemanage.NoticeManager;
import com.diancan.service.performance.PerformanceManager;
import com.diancan.util.PageData;

@Service(value="performanceService")
public class PerformanceService implements PerformanceManager{

	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<PageData> list(PageData pd) throws Exception{
		
		return (List<PageData>)dao.findForList("PerformanceMapper.list",pd);
		
	}
	////将销量流水生成营业额存入数据库
	public String createperformance(PageData pd) throws Exception{
		return (String) dao.findForObject("PerformanceMapper.createperformance",pd);
	}
	
	public void insertperformance(PageData pd) throws Exception{
		
		dao.save("PerformanceMapper.insertperformance", pd);
		
	}
	public void creatturnover() throws Exception
	{	SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String year=df.format(new Date());
		for(int i=1;i<=12;i++)
		{
			PageData ipd = new PageData();
			ipd.put("year",year);
			ipd.put("month",String.valueOf(i));
			String turnover=createperformance(ipd);
			if(turnover!=null)
			{
				double a=Double.parseDouble(turnover);
				if(a!=0)
			{
				ipd.put("p_mode", i+"月");
				dao.delete("PerformanceMapper.deletemonth",ipd);
				ipd.put("p_generates",a);
				df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time=df.format(new Date());
				ipd.put("p_time", time);
				insertperformance(ipd);
			}
			}
		}
		PageData pd=new PageData();
		pd.put("year",year);
		String turnover=(String)dao.findForObject("PerformanceMapper.queryyear", pd);
		if(turnover!=null)
		{
			double a=Double.parseDouble(turnover);
			if(a!=0)
		{
			pd.put("p_mode", year+"年");
			dao.delete("deletemonth",pd);
			pd.put("p_generates",Double.parseDouble(turnover));
			df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			pd.put("p_time", time);
			insertperformance(pd);
		}
		}
		
		
		
	}
	@Override
	public List<PageData> query(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		 return (List<PageData>)dao.findForList("PerformanceMapper.query",pd);
	}

	
}
