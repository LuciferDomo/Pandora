package web.packages.service.impl;

import java.util.List;

import web.packages.bean.PortsOfCallDateVO;
import web.packages.dao.PortsOfCallDateDAO;
import web.packages.dao.impl.PortsOfCallDateDAOImpl;
import web.packages.service.PortsOfCallDateService;

public class  PortsOfCallDateServiceImpl implements PortsOfCallDateService{

	PortsOfCallDateDAO dao =  new PortsOfCallDateDAOImpl();
	
	@Override
	public List<PortsOfCallDateVO> getAll() {
		
		return dao.getAll();
	}

	@Override
	public PortsOfCallDateVO insertPortsOfCallDate(PortsOfCallDateVO portsOfCallDateVO) {
		
		dao.insertPortsOfCallDate(portsOfCallDateVO);
		return portsOfCallDateVO;
	}
	

	

}
