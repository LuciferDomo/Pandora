package web.packages.dao;

import java.util.List;
import java.util.Map;

import web.packages.bean.PackagesVO;
import web.port.bean.PortVO;

public interface PackagesDAO {

	List<PackagesVO> getAll(Map<String, String[]> map);

	List<PackagesVO> getALLList();
	
	PackagesVO findByPrimaryKey(Integer packageId);
	
	PackagesVO insertPackage(PackagesVO packagesVO);
	
	String getPortName(Integer portOfCallNo);
	
}
