package com.diancan.service.noticemanage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.entity.Page;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.service.noticemanage.NoticeManager;
import com.diancan.util.PageData;

@Service(value="noticemanagerService")
public class NoticeManagerService implements NoticeManager{

	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("NoticeManageMapper.save", pd);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("NoticeManageMapper.delete", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("NoticeManageMapper.edit", pd);
	}

	@Override
	public List<PageData> list(PageData page) throws Exception {
		return (List<PageData>) dao.findForList("NoticeManageMapper.listAll",page);
	}

	@Override
	public PageData findById(PageData page) throws Exception {
		return (PageData) dao.findForObject("NoticeManageMapper.findById", page);
	}

	

	
}
