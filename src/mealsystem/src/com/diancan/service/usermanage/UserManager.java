package com.diancan.service.usermanage;

import java.util.List;

import com.diancan.entity.Page;
import com.diancan.util.PageData;

public interface UserManager {
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(PageData page)throws Exception;

	
	/**通过id查询数据
	 * @param page
	 * @throws Exception
	 */
	public PageData findById(PageData page)throws Exception;

	
}
