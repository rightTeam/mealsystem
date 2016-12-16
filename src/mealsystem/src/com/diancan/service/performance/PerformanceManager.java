package com.diancan.service.performance;

import java.util.List;

import com.diancan.entity.Page;
import com.diancan.util.PageData;

public interface PerformanceManager {
	
	//将销量流水生成营业额存入数据库
	public String createperformance(PageData pd) throws Exception;
	public void insertperformance(PageData pd) throws Exception;
	//生成营业额
	public void creatturnover() throws Exception;
	//列表查询
	public List<PageData> list(PageData pd) throws Exception;
	public List<PageData> query(PageData pd) throws Exception;
}
