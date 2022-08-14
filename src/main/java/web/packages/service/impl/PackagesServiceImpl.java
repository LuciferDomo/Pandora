package web.packages.service.impl;

import java.util.List;
import java.util.Map;

import web.packages.bean.PackageDetailVO;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.PackagesDAO;
import web.packages.dao.PortsOfCallDateDAO;
import web.packages.dao.impl.PackagesDAOImpl;
import web.packages.dao.impl.PortsOfCallDateDAOImpl;
import web.packages.service.PackagesService;

public class PackagesServiceImpl implements PackagesService {

	private PackagesDAO dao;
	private PortsOfCallDateDAO dateDao;
	public PackagesServiceImpl() {
		dao = new PackagesDAOImpl();
		dateDao = new PortsOfCallDateDAOImpl();
	}
	

	
	
	@Override
	public List<PackagesVO> getALLList() {
		
		return dao.getALLList();
	}



	@Override
	public List<PackagesVO> getAll(Map<String, String[]> map) {
		
		return dao.getAll(map);
	}

	@Override
	public PackagesVO getOnePackage(Integer packageId) {
		return dao.findByPrimaryKey(packageId);
	}


	@Override
	public PackagesVO insertPackage(PackagesVO packagesVO,List<PortsOfCallDateVO> portsOfCallDateVOList) {
				
				
		
		PackagesVO vo =dao.insertPackage(packagesVO);
		vo.getPackageNo();
		
		for(PortsOfCallDateVO portDateVO:portsOfCallDateVOList) {
			portDateVO.setPackageNo(vo.getPackageNo());
			dateDao.insertPortsOfCallDate(portDateVO);
		}
		
		 return packagesVO;
	}




	@Override
	public String getPortName(Integer portOfCallNo) {
		
		return dao.getPortName(portOfCallNo);
	}
	
	



	

}
