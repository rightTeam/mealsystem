package com.diancan.service.menumanage;

import java.util.List;

import com.diancan.util.PageData;

public interface MenuMManager {
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

	/**列表
     * @param pd
     * @throws Exception
     */
    public List<PageData> selectAnyone(PageData pd)throws Exception;
    
    
    /**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectByids(String[] ArrayDATA_IDS)throws Exception;
	
}
