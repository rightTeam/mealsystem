package com.diancan.service.choicemeal;

import java.util.List;

import com.diancan.entity.Page;
import com.diancan.util.PageData;

public interface ChoiceMealManager {

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(PageData pd)throws Exception;

	
	/**通过id查询数据
	 * @param page
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	public List<PageData> findclassify(PageData pd) throws Exception;
	public void addmeal(PageData pd) throws Exception;
	public List<PageData> findBycolumn(PageData pd) throws Exception;
	
}
