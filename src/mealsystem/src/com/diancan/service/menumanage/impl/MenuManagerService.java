package com.diancan.service.menumanage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.diancan.dao.DaoSupport;
import com.diancan.entity.Page;
import com.diancan.service.menumanage.MenuMManager;
import com.diancan.util.PageData;

@Service(value="menumanagerService")
public class MenuManagerService implements MenuMManager{

	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("MenuManageMapper.save", pd);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("MenuManageMapper.delete", pd);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("MenuManageMapper.edit", pd);
	}

	@Override
	public List<PageData> list(PageData page) throws Exception {
		return (List<PageData>) dao.findForList("MenuManageMapper.listAll",page);
	}

	@Override
	public PageData findById(PageData page) throws Exception {
		return (PageData) dao.findForObject("MenuManageMapper.findById", page);
	}
	
	/**列表
     * @param pd
     * @throws Exception
     */
    public List<PageData> selectAnyone(PageData pd)throws Exception{
        return (List<PageData>)dao.findForList("MenuManageMapper.selectAnyone", pd);
    }

	@Override
	public List<PageData> selectByids(String[] ArrayDATA_IDS) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("MenuManageMapper.selectByids", ArrayDATA_IDS);
	}
	
}
