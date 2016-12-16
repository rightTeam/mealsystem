package com.diancan.service.choicemeal.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.service.choicemeal.ChoiceMealManager;
import com.diancan.util.PageData;
@Service(value="choicemealService")
public class ChoiceMealService implements ChoiceMealManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	//查询菜品表中所有的菜品
	public List<PageData> list(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ChoiceMealMapper.listAll", pd);
	}

	@Override
	//通过菜品的ID查询菜品记录
	public PageData findById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ChoiceMealMapper.findById", pd);
	}
	public List<PageData> findBycolumn(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForObject("ChoiceMealMapper.findBycolumn", pd);
	}
	public List<PageData> findclassify(PageData  pd) throws Exception{
		return (List<PageData>)dao.findForList("ChoiceMealMapper.findclassify", pd);
	}
	//添加订单
	public void addmeal(PageData pd) throws Exception{
		
		 dao.save("ChoiceMealMapper.addmeal", pd);
		
	}

	@Override
	public List<PageData> findByTableNumber(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("ChoiceMealMapper.findByTableNumber", pd);
	}

	@Override
	public void settablenumber(int parseInt) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ChoiceMealMapper.settablenumber", parseInt);
	}

	@Override
	public void sendask(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ChoiceMealMapper.sendask", pd);
	}

	@Override
	public void ispay(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
