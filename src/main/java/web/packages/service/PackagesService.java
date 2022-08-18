package web.packages.service;

import java.util.List;
import java.util.Map;

import web.packages.bean.PackageDetailVO;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.impl.PackagesDAOImpl;

public interface PackagesService {

	List<PackagesVO> getAll(Map<String, String[]> map);

	List<PackagesVO> getALLList();

	PackagesVO getOnePackage(Integer packageId);
	
	PackagesVO insertPackage(PackagesVO packagesVO,List<PortsOfCallDateVO> portsOfCallDateVOList);
	
	String getPortName(Integer portOfCallNo);
}
