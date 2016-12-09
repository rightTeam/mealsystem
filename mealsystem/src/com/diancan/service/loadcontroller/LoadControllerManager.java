package com.diancan.service.loadcontroller;

import java.util.List;

import com.diancan.entity.Page;
import com.diancan.util.PageData;

public interface LoadControllerManager {
	public PageData findById(PageData pd)throws Exception;
	public List<PageData> findclassify(PageData pd) throws Exception;

	public PageData judge(PageData pd) throws Exception;

	
}
