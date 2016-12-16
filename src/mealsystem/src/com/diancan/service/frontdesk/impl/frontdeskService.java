package com.diancan.service.frontdesk.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.service.choicemeal.ChoiceMealManager;
import com.diancan.service.frontdesk.frontdeskManager;
import com.diancan.service.loadcontroller.LoadControllerManager;
import com.diancan.util.PageData;
@Service(value="frontdeskService")
public class frontdeskService implements frontdeskManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	public void pay(PageData pd) throws Exception
	{
		 dao.update("frontdeskMapper.pay",pd);
	}
	
	


}
