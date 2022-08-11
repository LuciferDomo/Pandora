package web.packages.dao;

import java.util.List;
import java.util.Map;

import web.packages.bean.PackagesVO;

public interface PackagesDAO {

	List<PackagesVO> getAll(Map<String, String[]> map);
	
	PackagesVO findByPrimaryKey(Integer packageId);
	
}
