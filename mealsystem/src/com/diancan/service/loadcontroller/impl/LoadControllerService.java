package com.diancan.service.loadcontroller.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.service.choicemeal.ChoiceMealManager;
import com.diancan.service.loadcontroller.LoadControllerManager;
import com.diancan.util.PageData;
@Service(value="loadcontrollerService")
public class LoadControllerService implements LoadControllerManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public PageData judge(PageData pd) throws Exception
	{
		return (PageData) dao.findForObject("LoadControllerlMapper.judge",pd);
	}
	
	public boolean iscango(String string)throws Exception{
		String type[]={"waiter","kitchen","administrator"};
		PageData pd=(PageData) dao.findForObject("LoadControllerlMapper.findauthority",string);
		return false;
	}

	public PageData findById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ChoiceMealMapper.findById", pd);
	}
	
	public List<PageData> findclassify(PageData  pd) throws Exception{
		return (List<PageData>)dao.findForList("ChoiceMealMapper.findclassify", pd);
	}


}
