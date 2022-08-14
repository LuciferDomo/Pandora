package web.packages.service.impl;

import java.util.List;
import java.util.Map;

import web.cruiseline.bean.PortNameListVO;
import web.cruiseline.bean.PortsOfCallListVO;
import web.cruiseline.dao.PortsOfCallListDAO;
import web.cruiseline.dao.impl.PortsOfCallListDAOImpl;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.PortsOfCallListDAO2;
import web.packages.dao.impl.PortsOfCallListDAOImpl2;
import web.packages.service.PortsOfCallListService;

public class PortsOfCallListServiceImpl implements PortsOfCallListService {
	
	PortsOfCallListDAO2 dao = new PortsOfCallListDAOImpl2();

	@Override
	public List<PortsOfCallListVO> getByCruiseLineNo(Integer cruiseLineNo) {
		
		return dao.getByCruiseLineNo(cruiseLineNo);
	}

	@Override
	public Map<Integer, String> getPortMap() {
		
		return dao.getPortMap();
	}
	
	
	public List<PortNameListVO> getAll(Map<String, String[]> map){
		
		return dao.getPortNameListByMap(map);
		
	}


}
